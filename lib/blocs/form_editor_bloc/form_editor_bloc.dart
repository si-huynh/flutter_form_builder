import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../models/form_model.dart';
import '../../models/question_model.dart';

part 'form_editor_bloc.freezed.dart';
part 'form_editor_bloc.g.dart';
part 'form_editor_event.dart';
part 'form_editor_state.dart';

class FormEditorBloc extends HydratedBloc<FormEditorEvent, FormEditorState> {
  FormEditorBloc() : super(const FormEditorState.initial()) {
    on<CreateFormEvent>(_onCreateForm);
    on<UpdateFormEvent>(_onUpdateForm);
    on<AddQuestionEvent>(_onAddQuestion);
    on<DeleteQuestionEvent>(_onDeleteQuestion);
    on<ReorderQuestionsEvent>(_onReorderQuestions);
    on<AddOptionEvent>(_onAddOption);
    on<DeleteOptionEvent>(_onDeleteOption);
    on<ToggleOtherOptionEvent>(_onToggleOtherOption);
  }

  void _onCreateForm(CreateFormEvent event, Emitter<FormEditorState> emit) {
    final form = FormModel(
      id: const Uuid().v4(),
      title: '',
    );
    emit(FormEditorState.loaded(form));
  }

  void _onUpdateForm(UpdateFormEvent event, Emitter<FormEditorState> emit) {
    emit(FormEditorState.loaded(event.form));
  }

  void _onAddQuestion(AddQuestionEvent event, Emitter<FormEditorState> emit) {
    switch (state) {
      case FormEditorStateLoaded(:final form):
        final question = switch (event.type) {
          MultipleChoice() => QuestionModel.multipleChoice(
              id: const Uuid().v4(),
              text: '',
            ),
          Paragraph() => QuestionModel.longAnswer(
              id: const Uuid().v4(),
              text: '',
            ),
        };
        final updatedForm = form.copyWith(
          questions: [...form.questions, question],
        );
        emit(FormEditorState.loaded(updatedForm));
      case _:
        return;
    }
  }

  void _onDeleteQuestion(
      DeleteQuestionEvent event, Emitter<FormEditorState> emit,) {
    switch (state) {
      case FormEditorStateLoaded(:final form):
        final updatedForm = form.copyWith(
          questions:
              form.questions.where((q) => q.id != event.questionId).toList(),
        );
        emit(FormEditorState.loaded(updatedForm));
      case _:
        return;
    }
  }

  void _onReorderQuestions(
      ReorderQuestionsEvent event, Emitter<FormEditorState> emit,) {
    switch (state) {
      case FormEditorStateLoaded(:final form):
        final questions = List<QuestionModel>.from(form.questions);
        final item = questions.removeAt(event.oldIndex);
        questions.insert(event.newIndex, item);
        final updatedForm = form.copyWith(
          questions: questions,
        );
        emit(FormEditorState.loaded(updatedForm));
      case _:
        return;
    }
  }

  void _onAddOption(AddOptionEvent event, Emitter<FormEditorState> emit) {
    switch (state) {
      case FormEditorStateLoaded(:final form):
        final updatedQuestions = form.questions.map((question) {
          if (question.id == event.questionId) {
            if (question case MultipleChoiceQuestion(:final options)) {
              return question.copyWith(options: [...options, event.option]);
            }
          }
          return question;
        }).toList();
        final updatedForm = form.copyWith(questions: updatedQuestions);
        emit(FormEditorState.loaded(updatedForm));
      case _:
        return;
    }
  }

  void _onDeleteOption(DeleteOptionEvent event, Emitter<FormEditorState> emit) {
    switch (state) {
      case FormEditorStateLoaded(:final form):
        final updatedQuestions = form.questions.map((question) {
          if (question.id == event.questionId) {
            if (question case MultipleChoiceQuestion(:final options)) {
              final updatedOptions = List<String>.from(options);
              updatedOptions.removeAt(event.optionIndex);
              return question.copyWith(options: updatedOptions);
            }
          }
          return question;
        }).toList();
        final updatedForm = form.copyWith(questions: updatedQuestions);
        emit(FormEditorState.loaded(updatedForm));
      case _:
        return;
    }
  }

  void _onToggleOtherOption(
      ToggleOtherOptionEvent event, Emitter<FormEditorState> emit,) {
    switch (state) {
      case FormEditorStateLoaded(:final form):
        final updatedQuestions = form.questions.map((question) {
          if (question.id == event.questionId) {
            if (question case MultipleChoiceQuestion()) {
              return question.copyWith(other: event.hasOther);
            }
          }
          return question;
        }).toList();
        final updatedForm = form.copyWith(questions: updatedQuestions);
        emit(FormEditorState.loaded(updatedForm));
      case _:
        return;
    }
  }

  @override
  FormEditorState? fromJson(Map<String, dynamic> json) {
    return FormEditorState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(FormEditorState state) {
    return state.toJson();
  }
}
