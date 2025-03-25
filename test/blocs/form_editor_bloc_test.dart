import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_form_builder/blocs/form_editor_bloc/form_editor_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:flutter_form_builder/models/question_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    HydratedBloc.storage = storage;

    // Setup mock storage methods
    when(() => storage.write(any(), any())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null);
    when(() => storage.delete(any())).thenAnswer((_) async {});
    when(() => storage.clear()).thenAnswer((_) async {});
  });

  group('FormEditorBloc', () {
    late FormEditorBloc formEditorBloc;

    setUp(() {
      formEditorBloc = FormEditorBloc();
    });

    tearDown(() {
      formEditorBloc.close();
    });

    test('initial state is FormEditorStateInitial', () {
      expect(formEditorBloc.state, const FormEditorState.initial());
    });

    blocTest<FormEditorBloc, FormEditorState>(
      'emits [loaded] when CreateFormEvent is added',
      build: () => formEditorBloc,
      act: (bloc) => bloc.add(const CreateFormEvent()),
      expect: () => [
        isA<FormEditorStateLoaded>().having(
          (state) => state.form.questions.length,
          'questions length',
          0,
        ),
      ],
    );

    blocTest<FormEditorBloc, FormEditorState>(
      'emits [loaded] with updated form when UpdateFormEvent is added',
      build: () => formEditorBloc,
      seed: () => const FormEditorState.loaded(
        FormModel(
          id: 'test',
          title: '',
        ),
      ),
      act: (bloc) => bloc.add(
        const UpdateFormEvent(
          FormModel(
            id: 'test',
            title: 'Updated Title',
            description: 'Updated Description',
          ),
        ),
      ),
      expect: () => [
        isA<FormEditorStateLoaded>()
            .having((state) => state.form.title, 'title', 'Updated Title')
            .having(
              (state) => state.form.description,
              'description',
              'Updated Description',
            ),
      ],
    );

    blocTest<FormEditorBloc, FormEditorState>(
      'emits [loaded] with new question when AddQuestionEvent is added',
      build: () => formEditorBloc,
      seed: () => const FormEditorState.loaded(
        FormModel(
          id: 'test',
          title: '',
        ),
      ),
      act: (bloc) => bloc.add(const AddQuestionEvent(MultipleChoice())),
      expect: () => [
        isA<FormEditorStateLoaded>().having(
          (state) => state.form.questions.length,
          'questions length',
          1,
        ),
      ],
    );

    blocTest<FormEditorBloc, FormEditorState>(
      'emits [loaded] with empty ID when updating form fails',
      build: () => formEditorBloc,
      act: (bloc) => bloc.add(
        const UpdateFormEvent(
          FormModel(
            id: '', // Invalid ID
            title: '',
          ),
        ),
      ),
      expect: () => [
        isA<FormEditorStateLoaded>().having(
          (state) => state.form.id,
          'id',
          '',
        ),
      ],
    );
  });
}
