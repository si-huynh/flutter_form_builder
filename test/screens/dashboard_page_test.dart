import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/forms/forms_bloc.dart';
import 'package:flutter_form_builder/blocs/responses/responses_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:flutter_form_builder/screens/dashboard/dashboard_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFormsBloc extends Mock implements FormsBloc {}

class MockResponsesBloc extends Mock implements ResponsesBloc {}

class MockTabsRouter extends Mock implements TabsRouter {}

class MockAutoRouter extends Mock implements StackRouter {}

// Since FormsEvent is a sealed class, we use a concrete implementation for the fallback value
const dummyFormsEvent = FormsEvent.loadForms();

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  setUpAll(() {
    registerFallbackValue(dummyFormsEvent);
  });

  group('DashboardPage', () {
    late MockFormsBloc mockFormsBloc;
    late MockResponsesBloc mockResponsesBloc;
    late StreamController<FormsState> stateController;
    late MockNavigatorObserver mockObserver;

    setUp(() {
      mockFormsBloc = MockFormsBloc();
      mockResponsesBloc = MockResponsesBloc();
      stateController = StreamController<FormsState>.broadcast();
      mockObserver = MockNavigatorObserver();

      // Set up stream
      when(() => mockFormsBloc.stream)
          .thenAnswer((_) => stateController.stream);
    });

    tearDown(() {
      stateController.close();
    });

    Widget buildTestWidget() {
      return MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<FormsBloc>.value(value: mockFormsBloc),
            BlocProvider<ResponsesBloc>.value(value: mockResponsesBloc),
          ],
          child: const DashboardPage(),
        ),
        navigatorObservers: [mockObserver],
      );
    }

    testWidgets('renders DashboardPage', (tester) async {
      when(() => mockFormsBloc.state).thenReturn(const FormsState.initial());
      await tester.pumpWidget(buildTestWidget());
      expect(find.byType(DashboardPage), findsOneWidget);
      expect(find.text('Form Dashboard'), findsOneWidget);
    });

    testWidgets('shows loading indicator when loading', (tester) async {
      when(() => mockFormsBloc.state).thenReturn(const FormsState.loading());
      await tester.pumpWidget(buildTestWidget());
      await tester.pump(); // Wait for the widget to rebuild
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when error occurs', (tester) async {
      const errorMessage = 'Test error';
      when(() => mockFormsBloc.state)
          .thenReturn(const FormsState.error(errorMessage));
      await tester.pumpWidget(buildTestWidget());
      await tester.pump(); // Wait for the widget to rebuild
      expect(find.text('Error: Test error'), findsOneWidget);
    });

    testWidgets('shows forms when loaded', (tester) async {
      final forms = [
        const FormModel(
          id: 'test-1',
          title: 'Test Form 1',
          description: 'Test Description 1',
        ),
        const FormModel(
          id: 'test-2',
          title: 'Test Form 2',
          description: 'Test Description 2',
        ),
      ];

      when(() => mockFormsBloc.state)
          .thenReturn(FormsState.loaded(forms: forms));
      await tester.pumpWidget(buildTestWidget());
      await tester.pump(); // Wait for the widget to rebuild

      expect(find.text('Test Form 1'), findsOneWidget);
      expect(find.text('Test Form 2'), findsOneWidget);
      expect(find.text('Test Description 1'), findsOneWidget);
      expect(find.text('Test Description 2'), findsOneWidget);
    });

    testWidgets('shows empty state when no forms', (tester) async {
      when(() => mockFormsBloc.state)
          .thenReturn(const FormsState.loaded(forms: []));
      await tester.pumpWidget(buildTestWidget());
      await tester.pump(); // Wait for the widget to rebuild

      expect(find.text('No forms yet'), findsOneWidget);
      expect(
          find.text('Tap the + button to create a new form'), findsOneWidget);
    });

    testWidgets('triggers LoadFormsEvent on init', (tester) async {
      when(() => mockFormsBloc.state).thenReturn(const FormsState.initial());
      await tester.pumpWidget(buildTestWidget());

      // Wait for post-frame callback
      await tester.pumpAndSettle();

      // Verify the event was dispatched
      verify(() => mockFormsBloc.add(const FormsEventLoads())).called(1);
    });
  });
}
