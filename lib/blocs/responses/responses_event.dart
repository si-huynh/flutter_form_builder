part of 'responses_bloc.dart';

@freezed
sealed class ResponsesEvent with _$ResponsesEvent {
  const factory ResponsesEvent.loadResponses(FormModel form) =
      LoadResponsesEvent;
  const factory ResponsesEvent.addResponse(
    ResponseModel response,
    FormModel form,
  ) = AddResponseEvent;
  const factory ResponsesEvent.deleteResponse(
    String responseId,
    FormModel form,
  ) = DeleteResponseEvent;
}
