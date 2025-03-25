part of 'form_editor_bloc.dart';

@freezed
class FormEditorEvent with _$FormEditorEvent {
  const factory FormEditorEvent.create() = CreateFormEvent;
  const factory FormEditorEvent.update(FormModel form) = UpdateFormEvent;
  const factory FormEditorEvent.addQuestion(QuestionType type) =
      AddQuestionEvent;
  const factory FormEditorEvent.deleteQuestion(String questionId) =
      DeleteQuestionEvent;
  const factory FormEditorEvent.reorderQuestions(int oldIndex, int newIndex) =
      ReorderQuestionsEvent;
  const factory FormEditorEvent.addOption(String questionId, String option) =
      AddOptionEvent;
  const factory FormEditorEvent.deleteOption(
      String questionId, int optionIndex,) = DeleteOptionEvent;
  const factory FormEditorEvent.toggleOtherOption(
      String questionId, bool hasOther,) = ToggleOtherOptionEvent;
}
