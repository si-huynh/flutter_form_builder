import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/form_model.dart';
import '../../models/response_model.dart';
import '../../utils/response_aggregator.dart';

part 'responses_bloc.freezed.dart';
part 'responses_bloc.g.dart';
part 'responses_event.dart';
part 'responses_state.dart';

class ResponsesBloc extends Bloc<ResponsesEvent, ResponsesState> {
  ResponsesBloc() : super(const ResponsesState.initial()) {
    on<LoadResponsesEvent>(_onLoadResponses);
    on<AddResponseEvent>(_onAddResponse);
    on<DeleteResponseEvent>(_onDeleteResponse);
    //on<DeleteResponsesEvent>(_onDeleteResponses);
  }

  void _onLoadResponses(
    LoadResponsesEvent event,
    Emitter<ResponsesState> emit,
  ) {
    emit(const ResponsesState.loading());

    final aggregation = ResponseAggregator.aggregateResponses(
      event.form.responses,
      event.form,
    );

    emit(
      ResponsesState.loaded(
        aggregation: aggregation,
        form: event.form,
      ),
    );
  }

  void _onAddResponse(AddResponseEvent event, Emitter<ResponsesState> emit) {
    switch (state) {
      case ResponsesStateLoaded(:final form):
        emit(const ResponsesState.loading());
        final updatedResponses = [...form.responses, event.response];

        final updatedAggregation = ResponseAggregator.aggregateResponses(
          updatedResponses,
          event.form,
        );

        emit(
          ResponsesState.loaded(
            aggregation: updatedAggregation,
            form: event.form.copyWith(responses: updatedResponses),
          ),
        );
      case _:
        emit(
          ResponsesState.loaded(
            aggregation: ResponseAggregator.aggregateResponses(
              [event.response],
              event.form,
            ),
            form: event.form,
          ),
        );
    }
  }

  void _onDeleteResponse(
    DeleteResponseEvent event,
    Emitter<ResponsesState> emit,
  ) {
    switch (state) {
      case ResponsesStateLoaded(:final form):
        final updatedResponses = form.responses
            .where((response) => response.id != event.responseId)
            .toList();

        final updatedAggregation = ResponseAggregator.aggregateResponses(
          updatedResponses,
          event.form,
        );

        final newForm = event.form.copyWith(responses: updatedResponses);

        event.onSuccess(newForm);

        emit(
          ResponsesState.loaded(
            aggregation: updatedAggregation,
            form: newForm,
          ),
        );
      case _:
        return;
    }
  }
}
