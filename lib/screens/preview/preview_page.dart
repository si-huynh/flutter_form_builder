import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/form_editor_bloc/form_editor_bloc.dart';
import '../../blocs/preview/preview_bloc.dart';
import '../../widgets/preview_question_card.dart';
import '../../blocs/responses/responses_bloc.dart';
import '../../models/response_model.dart';
import 'package:uuid/uuid.dart';
import '../../router/app_router.gr.dart';

@RoutePage()
class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormEditorBloc, FormEditorState>(
        listener: (context, state) {
      if (state case FormEditorStateLoaded(:final form)) {
        context.read<PreviewBloc>().add(LoadFormEvent(form));
      }
    }, builder: (context, state) {
      if (state case FormEditorStateInitial()) {
        return const Center(
          child: Text('No form found'),
        );
      }
      return Scaffold(
        body: BlocBuilder<PreviewBloc, PreviewState>(
          builder: (context, state) {
            return switch (state) {
              PreviewStateInitial() => const SizedBox.shrink(),
              PreviewStateLoading() =>
                const Center(child: CircularProgressIndicator()),
              PreviewStateLoaded(:final form, :final answers, :final errors) =>
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
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
                    const SizedBox(height: 16),
                  ],
                ),
              PreviewStateError(:final message) => Center(child: Text(message)),
            };
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.send),
          onPressed: () => context.read<PreviewBloc>().add(
            SubmitFormEvent(
              onSuccess: (form, answers) {
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
              },
            ),
          ),
        ),
      );
    });
  }
}
