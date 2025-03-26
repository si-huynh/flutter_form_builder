import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../models/form_model.dart';

part 'preview_event.dart';
part 'preview_state.dart';
part 'preview_bloc.freezed.dart';
part 'preview_bloc.g.dart';

class PreviewBloc extends Bloc<PreviewEvent, PreviewState> {
  PreviewBloc() : super(const PreviewState.initial()) {
    on<PreviewEventLoadForm>(_onLoadForm);
    on<PreviewEventUpdateAnswer>(_onUpdateAnswer);
    on<PreviewEventValidateForm>(_onValidateForm);
    on<PreviewEventSubmitForm>(_onSubmitForm);
  }

  void _onLoadForm(PreviewEventLoadForm event, Emitter<PreviewState> emit) {
    emit(const PreviewState.loading());
    emit(
      PreviewState.loaded(
        form: event.form,
        answers: const {},
        errors: const {},
      ),
    );
  }

  void _onUpdateAnswer(
    PreviewEventUpdateAnswer event,
    Emitter<PreviewState> emit,
  ) {
    switch (state) {
      case PreviewStateLoaded(:final form, :final answers, :final errors):
        final updatedAnswers = Map<String, dynamic>.from(answers);
        updatedAnswers[event.questionId] = event.answer;

        emit(
          PreviewState.loaded(
            form: form,
            answers: updatedAnswers,
            errors: errors,
          ),
        );
      case _:
        return;
    }
  }

  void _onValidateForm(
    PreviewEventValidateForm event,
    Emitter<PreviewState> emit,
  ) {
    switch (state) {
      case PreviewStateLoaded(:final form, :final answers):
        final updatedErrors = <String, String?>{};

        for (final question in form.questions) {
          if (question.required) {
            final answer = answers[question.id];
            if (answer == null || answer.toString().trim().isEmpty) {
              updatedErrors[question.id] = 'This field is required';
            }
          }
        }

        emit(
          PreviewState.loaded(
            form: form,
            answers: answers,
            errors: updatedErrors,
          ),
        );
      case _:
        return;
    }
  }

  void _onSubmitForm(
    PreviewEventSubmitForm event,
    Emitter<PreviewState> emit,
  ) {
    switch (state) {
      case PreviewStateLoaded(:final form, :final answers, :final errors):
        if (errors.isEmpty) {
          event.onSuccess(form, answers);
        }
      case _:
        return;
    }
  }
}
