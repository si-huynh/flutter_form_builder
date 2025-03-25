part of 'responses_bloc.dart';

@freezed
sealed class ResponsesState with _$ResponsesState {
  const ResponsesState._();

  const factory ResponsesState.initial() = ResponsesStateInitial;
  const factory ResponsesState.loading() = ResponsesStateLoading;
  const factory ResponsesState.loaded({
    required List<ResponseModel> responses,
    required Map<String, dynamic> aggregation,
  }) = ResponsesStateLoaded;
  const factory ResponsesState.error(String message) = ResponsesStateError;

  factory ResponsesState.fromJson(Map<String, dynamic> json) =>
      _$ResponsesStateFromJson(json);
}
