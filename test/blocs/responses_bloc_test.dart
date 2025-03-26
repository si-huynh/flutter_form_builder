import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_form_builder/blocs/responses/responses_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:flutter_form_builder/models/question_model.dart';
import 'package:flutter_form_builder/models/response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

class MockCallback extends Mock {
  void call(FormModel form);
}

// Since FormModel and ResponseModel are sealed classes, we need to use concrete implementations
// for our fallback values
const dummyFormModel = FormModel(
  id: 'dummy-id',
  title: 'Dummy Form',
);

final dummyResponseModel = ResponseModel(
  id: 'dummy-id',
  submittedAt: DateTime(2000),
  answers: const {},
);

void main() {
  late Storage storage;
  late FormModel testForm;
  late ResponseModel testResponse;
  late MockCallback mockOnSuccess;

  setUpAll(() {
    registerFallbackValue(dummyFormModel);
    registerFallbackValue(dummyResponseModel);
  });

  setUp(() {
    storage = MockStorage();
    HydratedBloc.storage = storage;
    mockOnSuccess = MockCallback();

    // Setup mock storage methods
    when(() => storage.write(any(), any())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null);
    when(() => storage.delete(any())).thenAnswer((_) async {});
    when(() => storage.clear()).thenAnswer((_) async {});

    // Create a test form
    testForm = const FormModel(
      id: 'test-form',
      title: 'Test Form',
      description: 'Test Description',
      questions: [
        QuestionModel.multipleChoice(
          id: 'q1',
          text: 'Multiple Choice Question',
          options: ['Option 1', 'Option 2'],
        ),
      ],
    );

    // Create a test response
    testResponse = ResponseModel(
      id: 'response-1',
      submittedAt: DateTime(2023),
      answers: const {'q1': 'Option 1'},
    );

    // Setup the mock onSuccess callback
    when(() => mockOnSuccess(any())).thenReturn(null);
  });

  group('ResponsesBloc', () {
    late ResponsesBloc responsesBloc;

    setUp(() {
      responsesBloc = ResponsesBloc();
    });

    tearDown(() {
      responsesBloc.close();
    });

    test('initial state is ResponsesStateInitial', () {
      expect(responsesBloc.state, const ResponsesState.initial());
    });

    blocTest<ResponsesBloc, ResponsesState>(
      'emits [loading, loaded] when LoadResponsesEvent is added',
      build: () => responsesBloc,
      act: (bloc) => bloc.add(ResponsesEvent.loadResponses(testForm)),
      expect: () => [
        const ResponsesState.loading(),
        isA<ResponsesStateLoaded>()
            .having((state) => state.form.id, 'form.id', 'test-form')
            .having(
              (state) => state.aggregation,
              'aggregation',
              isA<Map<String, dynamic>>(),
            ),
      ],
    );

    blocTest<ResponsesBloc, ResponsesState>(
      'emits [loading, loaded] with updated form when AddResponseEvent is added',
      build: () => responsesBloc,
      seed: () => ResponsesState.loaded(
        form: testForm,
        aggregation: {},
      ),
      act: (bloc) =>
          bloc.add(ResponsesEvent.addResponse(testResponse, testForm)),
      expect: () => [
        const ResponsesState.loading(),
        isA<ResponsesStateLoaded>()
            .having(
              (state) => state.form.responses.length,
              'responses length',
              1,
            )
            .having(
              (state) => state.form.responses[0].id,
              'response id',
              'response-1',
            ),
      ],
    );

    blocTest<ResponsesBloc, ResponsesState>(
      'emits state with response deleted when DeleteResponseEvent is added',
      build: () => responsesBloc,
      seed: () => ResponsesState.loaded(
        form: testForm.copyWith(responses: [testResponse]),
        aggregation: {},
      ),
      act: (bloc) => bloc.add(
        ResponsesEvent.deleteResponse(
          'response-1',
          testForm.copyWith(responses: [testResponse]),
          mockOnSuccess,
        ),
      ),
      expect: () => [
        isA<ResponsesStateLoaded>().having(
          (state) => state.form.responses.length,
          'responses length',
          0,
        ),
      ],
      verify: (_) {
        verify(() => mockOnSuccess(any())).called(1);
      },
    );
  });
}
