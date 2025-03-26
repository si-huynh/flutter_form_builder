part of 'preview_bloc.dart';

@freezed
sealed class PreviewEvent with _$PreviewEvent {
  const factory PreviewEvent.loadForm(FormModel form) = PreviewEventLoadForm;
  const factory PreviewEvent.updateAnswer(String questionId, answer) =
      PreviewEventUpdateAnswer;
  const factory PreviewEvent.validateForm() = PreviewEventValidateForm;
  const factory PreviewEvent.submitForm({
    required void Function(FormModel form, Map<String, dynamic> answers)
        onSuccess,
  }) = PreviewEventSubmitForm;
}
