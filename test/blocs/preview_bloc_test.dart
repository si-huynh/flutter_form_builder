import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_form_builder/blocs/preview/preview_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:flutter_form_builder/models/question_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;
  late FormModel testForm;

  setUp(() {
    storage = MockStorage();
    HydratedBloc.storage = storage;

    // Setup mock storage methods
    when(() => storage.write(any(), any())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null);
    when(() => storage.delete(any())).thenAnswer((_) async {});
    when(() => storage.clear()).thenAnswer((_) async {});

    // Create a test form with required and non-required questions
    testForm = const FormModel(
      id: 'test-form',
      title: 'Test Form',
      description: 'Test Description',
      questions: [
        QuestionModel.multipleChoice(
          id: 'q1',
          text: 'Required Question',
          required: true,
          options: ['Option 1', 'Option 2'],
        ),
        QuestionModel.longAnswer(
          id: 'q2',
          text: 'Optional Question',
        ),
      ],
    );
  });

  group('PreviewBloc', () {
    late PreviewBloc previewBloc;

    setUp(() {
      previewBloc = PreviewBloc();
    });

    tearDown(() {
      previewBloc.close();
    });

    test('initial state is PreviewStateInitial', () {
      expect(previewBloc.state, const PreviewState.initial());
    });

    blocTest<PreviewBloc, PreviewState>(
      'emits [loading, loaded] when LoadFormEvent is added',
      build: () => previewBloc,
      act: (bloc) => bloc.add(PreviewEventLoadForm(testForm)),
      expect: () => [
        const PreviewState.loading(),
        isA<PreviewStateLoaded>()
            .having((state) => state.form.id, 'form.id', 'test-form')
            .having((state) => state.answers, 'answers', {}).having(
          (state) => state.errors,
          'errors',
          {},
        ),
      ],
    );

    blocTest<PreviewBloc, PreviewState>(
      'emits state with updated answers when UpdateAnswer is added',
      build: () => previewBloc,
      seed: () => PreviewState.loaded(
        form: testForm,
        answers: const {},
        errors: const {},
      ),
      act: (bloc) => bloc.add(const PreviewEventUpdateAnswer('q1', 'Option 1')),
      expect: () => [
        isA<PreviewStateLoaded>().having(
          (state) => state.answers,
          'answers',
          {'q1': 'Option 1'},
        ),
      ],
    );

    blocTest<PreviewBloc, PreviewState>(
      'validates required fields correctly',
      build: () => previewBloc,
      seed: () => PreviewState.loaded(
        form: testForm,
        answers: const {},
        errors: const {},
      ),
      act: (bloc) => bloc.add(const PreviewEventValidateForm()),
      expect: () => [
        isA<PreviewStateLoaded>().having(
          (state) => state.errors,
          'errors',
          containsPair('q1', 'This field is required'),
        ),
      ],
    );

    blocTest<PreviewBloc, PreviewState>(
      'validates form with all required fields filled correctly',
      build: () => previewBloc,
      seed: () => PreviewState.loaded(
        form: testForm,
        answers: const {'q1': 'Option 1'},
        errors: {'q1': 'This field is required'},
      ),
      act: (bloc) => bloc.add(const PreviewEventValidateForm()),
      expect: () => [
        isA<PreviewStateLoaded>().having(
          (state) => state.errors,
          'errors',
          {},
        ),
      ],
    );
  });
}
