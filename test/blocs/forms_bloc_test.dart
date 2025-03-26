import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_form_builder/blocs/forms/forms_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;
  final testForms = [
    const FormModel(
      id: 'form-1',
      title: 'Form 1',
      description: 'Description 1',
    ),
    const FormModel(
      id: 'form-2',
      title: 'Form 2',
      description: 'Description 2',
    ),
  ];

  setUp(() {
    storage = MockStorage();
    HydratedBloc.storage = storage;

    // Setup mock storage methods
    when(() => storage.write(any(), any())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null);
    when(() => storage.delete(any())).thenAnswer((_) async {});
    when(() => storage.clear()).thenAnswer((_) async {});
  });

  group('FormsBloc', () {
    late FormsBloc formsBloc;

    setUp(() {
      formsBloc = FormsBloc();
    });

    tearDown(() {
      formsBloc.close();
    });

    test('initial state is FormsStateInitial', () {
      expect(formsBloc.state, const FormsState.initial());
    });

    blocTest<FormsBloc, FormsState>(
      'emits [loading, loaded] when LoadFormsEvent is added',
      build: () => formsBloc,
      act: (bloc) => bloc.add(const FormsEvent.loadForms()),
      expect: () => [
        const FormsState.loading(),
        isA<FormsStateLoaded>()
            .having((state) => state.forms.length, 'forms length', 0),
      ],
    );

    blocTest<FormsBloc, FormsState>(
      'emits [loading, loaded] with forms when AddFormEvent is added',
      build: () => formsBloc,
      seed: () => const FormsState.loaded(forms: []),
      act: (bloc) => bloc.add(FormsEvent.addForm(testForms[0])),
      expect: () => [
        isA<FormsStateLoaded>().having(
          (state) => state.forms.length,
          'forms length',
          1,
        ),
      ],
    );

    blocTest<FormsBloc, FormsState>(
      'emits [loaded] with updated forms when UpdateFormEvent is added',
      build: () => formsBloc,
      seed: () => FormsState.loaded(forms: testForms),
      act: (bloc) => bloc.add(
        FormsEvent.updateForm(
          testForms[0].copyWith(title: 'Updated Form 1'),
        ),
      ),
      expect: () => [
        isA<FormsStateLoaded>().having(
          (state) => state.forms[0].title,
          'updated form title',
          'Updated Form 1',
        ),
      ],
    );

    blocTest<FormsBloc, FormsState>(
      'emits [loaded] with form removed when DeleteFormEvent is added',
      build: () => formsBloc,
      seed: () => FormsState.loaded(forms: testForms),
      act: (bloc) => bloc.add(const FormsEvent.deleteForm('form-1')),
      expect: () => [
        isA<FormsStateLoaded>()
            .having((state) => state.forms.length, 'forms length', 1)
            .having(
                (state) => state.forms[0].id, 'remaining form id', 'form-2'),
      ],
    );
  });
}
