import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/forms/forms_bloc.dart';
import 'package:flutter_form_builder/blocs/responses/responses_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:flutter_form_builder/models/response_model.dart';
import 'package:flutter_form_builder/router/app_router.gr.dart';
import 'package:flutter_form_builder/screens/responses/responses_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockResponsesBloc extends Mock implements ResponsesBloc {}

class MockFormsBloc extends Mock implements FormsBloc {}

class MockStackRouter extends Mock implements StackRouter {}

class MockTabsRouter extends Mock implements TabsRouter {}

class MockRouteData extends Mock implements RouteData {}

class MockPageRouteInfo extends Mock implements PageRouteInfo {}

class MockHomeRouteArgs extends Mock implements HomeRouteArgs {}

// Use concrete event instances for fallback values
const dummyResponsesEvent = ResponsesEvent.loadResponses(
    FormModel(id: 'test', title: 'Test', description: 'Test'));
const dummyFormsEvent = FormsEvent.loadForms();

void main() {
  setUpAll(() {
    registerFallbackValue(dummyResponsesEvent);
    registerFallbackValue(dummyFormsEvent);
  });

  group('ResponsesView', () {
    late MockResponsesBloc mockResponsesBloc;
    late StreamController<ResponsesState> stateController;

    const testForm = FormModel(
      id: 'form-id',
      title: 'Test Form',
      description: 'Test Description',
    );

    final testResponses = [
      ResponseModel(
        id: 'response-1',
        answers: const {'q1': 'Answer 1'},
        submittedAt: DateTime(2023),
      ),
      ResponseModel(
        id: 'response-2',
        answers: const {'q1': 'Answer 2'},
        submittedAt: DateTime(2023, 1, 2),
      ),
    ];

    final formWithResponses = testForm.copyWith(responses: testResponses);

    setUp(() {
      mockResponsesBloc = MockResponsesBloc();
      stateController = StreamController<ResponsesState>.broadcast();

      // Set up stream
      when(() => mockResponsesBloc.stream)
          .thenAnswer((_) => stateController.stream);
    });

    tearDown(() {
      stateController.close();
    });

    Widget buildTestWidget() {
      return MaterialApp(
        home: BlocProvider<ResponsesBloc>.value(
          value: mockResponsesBloc,
          child: const ResponsesView(),
        ),
      );
    }

    testWidgets('renders ResponsesView in initial state', (tester) async {
      when(() => mockResponsesBloc.state)
          .thenReturn(const ResponsesState.initial());
      await tester.pumpWidget(buildTestWidget());

      // Should show no responses message in initial state
      expect(find.text('No responses yet'), findsOneWidget);
    });

    testWidgets('renders ResponsesView in loading state', (tester) async {
      when(() => mockResponsesBloc.state)
          .thenReturn(const ResponsesState.loading());
      await tester.pumpWidget(buildTestWidget());

      // Should show loading indicator in loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders ResponsesView with responses', (tester) async {
      when(() => mockResponsesBloc.state).thenReturn(
        ResponsesState.loaded(
          aggregation: const {},
          form: formWithResponses,
        ),
      );
      await tester.pumpWidget(buildTestWidget());

      // Should show the Individual Responses header
      expect(find.text('Individual Responses'), findsOneWidget);

      // Should show the Summary header
      expect(find.text('Summary'), findsOneWidget);
    });

    testWidgets('renders ResponsesView with no responses', (tester) async {
      when(() => mockResponsesBloc.state).thenReturn(
        const ResponsesState.loaded(
          aggregation: {},
          form: testForm,
        ),
      );
      await tester.pumpWidget(buildTestWidget());

      // Should show no responses message
      expect(find.text('No responses yet'), findsOneWidget);
    });

    testWidgets('renders ResponsesView with error', (tester) async {
      when(() => mockResponsesBloc.state).thenReturn(
        const ResponsesState.error('Failed to load responses'),
      );
      await tester.pumpWidget(buildTestWidget());

      // Should show error message
      expect(find.text('Failed to load responses'), findsOneWidget);
    });
  });
}
