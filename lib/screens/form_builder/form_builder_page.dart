import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../blocs/form_editor_bloc/form_editor_bloc.dart';
import '../../models/form_model.dart';
import '../../models/question_model.dart';
import '../../widgets/question_card.dart';
import '../../widgets/debounced_text_field.dart';

@RoutePage()
class FormBuilderPage extends StatelessWidget {
  const FormBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FormBuilderView();
  }
}

class FormBuilderView extends StatefulWidget {
  const FormBuilderView({super.key});

  @override
  State<FormBuilderView> createState() => _FormBuilderViewState();
}

class _FormBuilderViewState extends State<FormBuilderView> {
  Timer? _titleDebounce;
  Timer? _descriptionDebounce;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleDebounce?.cancel();
    _descriptionDebounce?.cancel();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Form'),
      ),
      body: BlocBuilder<FormEditorBloc, FormEditorState>(
        builder: (context, state) {
          return switch (state) {
            FormEditorStateInitial() =>
              const Center(child: Text('Create a new form')),
            FormEditorStateLoading() =>
              const Center(child: CircularProgressIndicator()),
            FormEditorStateLoaded(:final form) => _buildForm(context, form),
            FormEditorStateError(:final message) =>
              Center(child: Text(message)),
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddQuestionDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildForm(BuildContext context, FormModel form) {
    // Update controllers if form data changes
    if (_titleController.text != form.title) {
      _titleController.text = form.title;
    }
    if (_descriptionController.text != form.description) {
      _descriptionController.text = form.description;
    }

    return Column(
      children: [
        const Gap(16),
        _buildFormHeader(context, form),
        const Gap(16),
        Expanded(
          child: _buildQuestionsList(context, form.questions),
        ),
      ],
    );
  }

  Widget _buildFormHeader(BuildContext context, FormModel form) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          DebouncedTextField(
            initialValue: form.title,
            decoration: const InputDecoration(
              hintText: 'Form Title',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              context.read<FormEditorBloc>().add(
                    UpdateFormEvent(
                      form.copyWith(title: value),
                    ),
                  );
            },
          ),
          const Gap(8),
          DebouncedTextField(
            initialValue: form.description,
            decoration: const InputDecoration(
              hintText: 'Form Description',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            onChanged: (value) {
              context.read<FormEditorBloc>().add(
                    UpdateFormEvent(
                      form.copyWith(description: value),
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsList(
      BuildContext context, List<QuestionModel> questions) {
    return ReorderableListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: questions.length,
      onReorder: (oldIndex, newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        context.read<FormEditorBloc>().add(
              ReorderQuestionsEvent(
                oldIndex,
                newIndex,
              ),
            );
      },
      itemBuilder: (context, index) {
        final question = questions[index];
        return QuestionCard(
          key: ValueKey(question.id),
          question: question,
          onDelete: () {
            context.read<FormEditorBloc>().add(
                  DeleteQuestionEvent(question.id),
                );
          },
          onTextChanged: (value) {
            final updatedQuestion = question.copyWith(text: value);
            final updatedQuestions = List<QuestionModel>.from(questions);
            updatedQuestions[index] = updatedQuestion;
            final state = context.read<FormEditorBloc>().state;
            if (state case FormEditorStateLoaded(:final form)) {
              context.read<FormEditorBloc>().add(
                    UpdateFormEvent(
                      form.copyWith(questions: updatedQuestions),
                    ),
                  );
            }
          },
          onRequiredChanged: (value) {
            final updatedQuestion = question.copyWith(required: value);
            final updatedQuestions = List<QuestionModel>.from(questions);
            updatedQuestions[index] = updatedQuestion;
            final state = context.read<FormEditorBloc>().state;
            if (state case FormEditorStateLoaded(:final form)) {
              context.read<FormEditorBloc>().add(
                    UpdateFormEvent(
                      form.copyWith(questions: updatedQuestions),
                    ),
                  );
            }
          },
          onOptionsChanged: (options) {
            if (question case MultipleChoiceQuestion()) {
              final updatedQuestion = question.copyWith(options: options);
              final updatedQuestions = List<QuestionModel>.from(questions);
              updatedQuestions[index] = updatedQuestion;
              final state = context.read<FormEditorBloc>().state;
              if (state case FormEditorStateLoaded(:final form)) {
                context.read<FormEditorBloc>().add(
                      UpdateFormEvent(
                        form.copyWith(questions: updatedQuestions),
                      ),
                    );
              }
            }
          },
          onOtherOptionChanged: (hasOther) {
            if (question case MultipleChoiceQuestion()) {
              final updatedQuestion = question.copyWith(
                other: hasOther,
              );
              final updatedQuestions = List<QuestionModel>.from(questions);
              updatedQuestions[index] = updatedQuestion;
              final state = context.read<FormEditorBloc>().state;
              if (state case FormEditorStateLoaded(:final form)) {
                context.read<FormEditorBloc>().add(
                      UpdateFormEvent(
                        form.copyWith(questions: updatedQuestions),
                      ),
                    );
              }
            }
          },
        );
      },
    );
  }

  void _showAddQuestionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Question'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Multiple Choice'),
              onTap: () {
                final state = context.read<FormEditorBloc>().state;
                if (state case FormEditorStateInitial()) {
                  context.read<FormEditorBloc>().add(const CreateFormEvent());
                }
                context.read<FormEditorBloc>().add(
                      AddQuestionEvent(QuestionType.multipleChoice()),
                    );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Paragraph'),
              onTap: () {
                final state = context.read<FormEditorBloc>().state;
                if (state case FormEditorStateInitial()) {
                  context.read<FormEditorBloc>().add(const CreateFormEvent());
                }
                context.read<FormEditorBloc>().add(
                      AddQuestionEvent(QuestionType.paragraph()),
                    );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
