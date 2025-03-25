part of 'preview_bloc.dart';

@freezed
sealed class PreviewState with _$PreviewState {
  const PreviewState._();

  const factory PreviewState.initial() = PreviewStateInitial;
  const factory PreviewState.loading() = PreviewStateLoading;
  const factory PreviewState.loaded({
    required FormModel form,
    required Map<String, dynamic> answers,
    required Map<String, String?> errors,
  }) = PreviewStateLoaded;
  const factory PreviewState.error(String message) = PreviewStateError;

  factory PreviewState.fromJson(Map<String, dynamic> json) =>
      _$PreviewStateFromJson(json);
}
