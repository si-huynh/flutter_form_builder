import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/form_model.dart';

part 'forms_bloc.freezed.dart';
part 'forms_bloc.g.dart';
part 'forms_event.dart';
part 'forms_state.dart';

class FormsBloc extends HydratedBloc<FormsEvent, FormsState> {
  FormsBloc() : super(const FormsState.initial()) {
    on<FormsEventLoads>(_onLoadForms);
    on<FormsEventAddForm>(_onAddForm);
    on<FormsEventUpdateForm>(_onUpdateForm);
    on<FormsEventDeleteForm>(_onDeleteForm);
  }

  void _onLoadForms(FormsEventLoads event, Emitter<FormsState> emit) {
    // Nothing to do here
    if (state is FormsStateInitial) {
      emit(const FormsState.loading());
      emit(const FormsState.loaded(forms: []));
    }
  }

  void _onAddForm(FormsEventAddForm event, Emitter<FormsState> emit) {
    switch (state) {
      case FormsStateLoaded(:final forms):
        final updatedForms = [...forms, event.form];
        emit(FormsState.loaded(forms: updatedForms));
      case _:
        emit(FormsState.loaded(forms: [event.form]));
    }
  }

  void _onUpdateForm(FormsEventUpdateForm event, Emitter<FormsState> emit) {
    switch (state) {
      case FormsStateLoaded(:final forms):
        final updatedForms = forms.map((form) {
          return form.id == event.form.id ? event.form : form;
        }).toList();
        emit(FormsState.loaded(forms: updatedForms));
      case _:
        return;
    }
  }

  void _onDeleteForm(FormsEventDeleteForm event, Emitter<FormsState> emit) {
    switch (state) {
      case FormsStateLoaded(:final forms):
        final updatedForms =
            forms.where((form) => form.id != event.formId).toList();
        emit(FormsState.loaded(forms: updatedForms));
      case _:
        return;
    }
  }

  @override
  FormsState? fromJson(Map<String, dynamic> json) {
    try {
      return FormsState.fromJson(json);
    } catch (e) {
      debugPrint('Error deserializing FormsState: $e');
      return const FormsState.initial();
    }
  }

  @override
  Map<String, dynamic>? toJson(FormsState state) {
    try {
      return state.toJson();
    } catch (e) {
      debugPrint('Error serializing FormsState: $e');
      return null;
    }
  }
}
