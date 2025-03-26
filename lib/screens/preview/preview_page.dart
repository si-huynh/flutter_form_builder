import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/forms/forms_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:gap/gap.dart';
import 'package:uuid/uuid.dart';

import '../../blocs/preview/preview_bloc.dart';
import '../../blocs/responses/responses_bloc.dart';
import '../../models/response_model.dart';
import '../../router/app_router.gr.dart';
import '../../widgets/preview_question_card.dart';

@RoutePage()
class PreviewPage extends StatelessWidget implements AutoRouteWrapper {
  const PreviewPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    final args = context.tabsRouter.routeData.route.args as HomeRouteArgs;
    final formId = args.formId;
    final formsState = context.read<FormsBloc>().state;
    if (formsState case FormsStateLoaded(:final forms)) {
      final form = forms.firstWhere((form) => form.id == formId);
      return BlocProvider(
        create: (context) => PreviewBloc()..add(PreviewEventLoadForm(form)),
        child: this,
      );
    }
    return this;
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<FormsBloc, FormsState>(
        listener: (context, state) {
          if (state case FormsStateLoaded(:final forms)) {
            final formId = context.tabsRouter.routeData.route.args.formId;
            final form = forms.firstWhere((form) => form.id == formId);
            context.read<PreviewBloc>().add(PreviewEventLoadForm(form));
          }
        },
        builder: (context, state) {
          return const PreviewPageView();
        },
      );
}

class PreviewPageView extends StatelessWidget {
  const PreviewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Form'),
      ),
      body: BlocConsumer<PreviewBloc, PreviewState>(
        listener: (context, state) {
          if (state case PreviewStateError(:final message)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            PreviewStateInitial() => const SizedBox.shrink(),
            PreviewStateLoading() =>
              const Center(child: CircularProgressIndicator()),
            PreviewStateLoaded(:final form, :final answers, :final errors) =>
              _buildPreviewListContent(form, context, answers, errors),
            PreviewStateError(:final message) => Center(child: Text(message)),
          };
        },
      ),
      floatingActionButton: _buildSubmitButton(context),
    );
  }

  ListView _buildPreviewListContent(
    FormModel form,
    BuildContext context,
    Map<String, dynamic> answers,
    Map<String, String?> errors,
  ) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            form.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        if (form.description.isNotEmpty) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              form.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
        const Gap(16),
        ...form.questions.map(
          (question) => PreviewQuestionCard(
            question: question,
            currentAnswer: answers[question.id],
            error: errors[question.id],
            onAnswerChanged: (value) {
              context.read<PreviewBloc>().add(
                    PreviewEventUpdateAnswer(question.id, value),
                  );
            },
          ),
        ),
        const SizedBox(height: 80), // Extra space for FAB
      ],
    );
  }

  FloatingActionButton _buildSubmitButton(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: 'submit_form',
      icon: const Icon(Icons.send),
      label: const Text('Submit'),
      onPressed: () {
        // Validate the form
        context.read<PreviewBloc>().add(const PreviewEventValidateForm());

        // Get the updated state after validation
        Future.delayed(Duration.zero, () {
          final currentState = context.read<PreviewBloc>().state;

          if (currentState
              case PreviewStateLoaded(
                :final form,
                :final answers,
                :final errors
              )) {
            if (errors.isEmpty) {
              // Create response and submit
              final response = ResponseModel(
                id: const Uuid().v4(),
                answers: answers,
                submittedAt: DateTime.now(),
              );

              context.read<ResponsesBloc>().add(
                    AddResponseEvent(response, form),
                  );

              context.read<FormsBloc>().add(
                    FormsEvent.updateForm(
                      form.copyWith(responses: [...form.responses, response]),
                    ),
                  );
              context.router.navigate(const ResponsesRoute());
            } else {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill in all required fields'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        });
      },
    );
  }
}
