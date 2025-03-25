part of 'form_editor_bloc.dart';

@freezed
sealed class FormEditorState with _$FormEditorState {
  const FormEditorState._();

  const factory FormEditorState.initial() = FormEditorStateInitial;
  const factory FormEditorState.loading() = FormEditorStateLoading;
  const factory FormEditorState.loaded(FormModel form) = FormEditorStateLoaded;
  const factory FormEditorState.error(String message) = FormEditorStateError;

  factory FormEditorState.fromJson(Map<String, dynamic> json) =>
      _$FormEditorStateFromJson(json);
}
