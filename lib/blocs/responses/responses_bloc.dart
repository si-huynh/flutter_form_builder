import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/form_model.dart';
import '../../models/response_model.dart';
import '../../utils/response_aggregator.dart';

part 'responses_bloc.freezed.dart';
part 'responses_bloc.g.dart';
part 'responses_event.dart';
part 'responses_state.dart';

class ResponsesBloc extends HydratedBloc<ResponsesEvent, ResponsesState> {
  ResponsesBloc() : super(const ResponsesState.initial()) {
    on<LoadResponsesEvent>(_onLoadResponses);
    on<AddResponseEvent>(_onAddResponse);
    on<DeleteResponseEvent>(_onDeleteResponse);
  }

  void _onLoadResponses(
      LoadResponsesEvent event, Emitter<ResponsesState> emit,) {
    emit(const ResponsesState.loading());

    switch (state) {
      case ResponsesStateLoaded(:final responses):
        final aggregation = ResponseAggregator.aggregateResponses(
          responses,
          event.form,
        );
        emit(ResponsesState.loaded(
          responses: responses,
          aggregation: aggregation,
        ),);
      case _:
        emit(const ResponsesState.loaded(
          responses: [],
          aggregation: {},
        ),);
    }
  }

  void _onAddResponse(AddResponseEvent event, Emitter<ResponsesState> emit) {
    switch (state) {
      case ResponsesStateLoaded(:final responses):
        final updatedResponses = [...responses, event.response];
        final updatedAggregation = ResponseAggregator.aggregateResponses(
          updatedResponses,
          event.form,
        );
        emit(ResponsesState.loaded(
          responses: updatedResponses,
          aggregation: updatedAggregation,
        ),);
      case _:
        emit(ResponsesState.loaded(
          responses: [event.response],
          aggregation: ResponseAggregator.aggregateResponses(
            [event.response],
            event.form,
          ),
        ),);
    }
  }

  void _onDeleteResponse(
      DeleteResponseEvent event, Emitter<ResponsesState> emit,) {
    switch (state) {
      case ResponsesStateLoaded(:final responses):
        final updatedResponses = responses
            .where((response) => response.id != event.responseId)
            .toList();
        final updatedAggregation = ResponseAggregator.aggregateResponses(
          updatedResponses,
          event.form,
        );
        emit(ResponsesState.loaded(
          responses: updatedResponses,
          aggregation: updatedAggregation,
        ),);
      case _:
        return;
    }
  }

  @override
  ResponsesState? fromJson(Map<String, dynamic> json) {
    return ResponsesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ResponsesState state) {
    return state.toJson();
  }
}
