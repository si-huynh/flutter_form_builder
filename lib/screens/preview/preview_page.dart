import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/form_editor_bloc/form_editor_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:gap/gap.dart';
import 'package:uuid/uuid.dart';

import '../../blocs/preview/preview_bloc.dart';
import '../../blocs/responses/responses_bloc.dart';
import '../../models/response_model.dart';
import '../../router/app_router.gr.dart';
import '../../widgets/preview_question_card.dart';

@RoutePage()
class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void initState() {
    super.initState();
    // Ensure form is loaded when page is created - will be called after first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadFormIfAvailable();
    });
  }

  void _loadFormIfAvailable() {
    final formState = context.read<FormEditorBloc>().state;
    if (formState case FormEditorStateLoaded(:final form)) {
      context.read<PreviewBloc>().add(LoadFormEvent(form));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormEditorBloc, FormEditorState>(
      listener: (context, state) {
        if (state case FormEditorStateLoaded(:final form)) {
          context.read<PreviewBloc>().add(LoadFormEvent(form));
        }
      },
      builder: (context, state) {
        if (state case FormEditorStateInitial()) {
          return const Center(
            child: Text('No form found'),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Preview Form'),
          ),
          body: BlocBuilder<PreviewBloc, PreviewState>(
            builder: (context, state) {
              return switch (state) {
                PreviewStateInitial() => const SizedBox.shrink(),
                PreviewStateLoading() =>
                  const Center(child: CircularProgressIndicator()),
                PreviewStateLoaded(
                  :final form,
                  :final answers,
                  :final errors
                ) =>
                  _buildPreviewListContent(form, context, answers, errors),
                PreviewStateError(:final message) =>
                  Center(child: Text(message)),
              };
            },
          ),
          floatingActionButton: _buildSubmitButton(context),
        );
      },
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
                    UpdateAnswerEvent(question.id, value),
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
      icon: const Icon(Icons.send),
      label: const Text('Submit'),
      onPressed: () {
        // Validate the form
        context.read<PreviewBloc>().add(const ValidateFormEvent());

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
                formId: form.id,
                answers: answers,
                submittedAt: DateTime.now(),
              );

              context.read<ResponsesBloc>().add(
                    AddResponseEvent(response, form),
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
