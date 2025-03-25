part of 'preview_bloc.dart';

@freezed
sealed class PreviewEvent with _$PreviewEvent {
  const factory PreviewEvent.loadForm(FormModel form) = LoadFormEvent;
  const factory PreviewEvent.updateAnswer(String questionId, dynamic answer) =
      UpdateAnswerEvent;
  const factory PreviewEvent.validateForm() = ValidateFormEvent;
  const factory PreviewEvent.submitForm({
    required void Function(FormModel form, Map<String, dynamic> answers)
        onSuccess,
  }) = SubmitFormEvent;
}
