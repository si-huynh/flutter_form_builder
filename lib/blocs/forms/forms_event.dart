part of 'forms_bloc.dart';

@freezed
sealed class FormsEvent with _$FormsEvent {
  const factory FormsEvent.loadForms() = FormsEventLoads;
  const factory FormsEvent.addForm(FormModel form) = FormsEventAddForm;
  const factory FormsEvent.updateForm(FormModel form) = FormsEventUpdateForm;
  const factory FormsEvent.deleteForm(String formId) = FormsEventDeleteForm;
}
