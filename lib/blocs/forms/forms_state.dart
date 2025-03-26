part of 'forms_bloc.dart';

@freezed
sealed class FormsState with _$FormsState {
  const FormsState._();

  const factory FormsState.initial() = FormsStateInitial;
  const factory FormsState.loading() = FormsStateLoading;
  const factory FormsState.loaded({required List<FormModel> forms}) =
      FormsStateLoaded;
  const factory FormsState.error(String message) = FormsStateError;

  factory FormsState.fromJson(Map<String, dynamic> json) =>
      _$FormsStateFromJson(json);
}
