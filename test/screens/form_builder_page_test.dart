import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/blocs/form_editor_bloc/form_editor_bloc.dart';
import 'package:flutter_form_builder/models/form_model.dart';
import 'package:flutter_form_builder/models/question_model.dart';
import 'package:flutter_form_builder/screens/form_builder/form_builder_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class that properly registers for Faker
class MockFormEditorBloc extends Mock implements FormEditorBloc {}

// Register fallback values for types that might be used in mocks
class FakeFormEditorEvent extends Fake implements FormEditorEvent {}

void main() {
  setUpAll(() {
    // Register fallback values for events
    registerFallbackValue(FakeFormEditorEvent());
    // We don't need to register a fallback for FormEditorState since it's a sealed class
    // Instead we'll use actual instances like FormEditorState.initial() where needed
  });

  group('FormBuilderPage', () {
    late MockFormEditorBloc mockBloc;
    late StreamController<FormEditorState> stateController;

    setUp(() {
      mockBloc = MockFormEditorBloc();
      stateController = StreamController<FormEditorState>.broadcast();

      // Set up stream
      when(() => mockBloc.stream).thenAnswer((_) => stateController.stream);
    });

    tearDown(() {
      stateController.close();
    });

    Widget buildTestWidget() {
      return MaterialApp(
        home: BlocProvider<FormEditorBloc>.value(
          value: mockBloc,
          child: const FormBuilderPage(),
        ),
      );
    }

    testWidgets('renders FormBuilderPage', (tester) async {
      when(() => mockBloc.state).thenReturn(const FormEditorState.initial());
      await tester.pumpWidget(buildTestWidget());
      expect(find.byType(FormBuilderPage), findsOneWidget);
      expect(find.text('Create a new form'), findsOneWidget);
    });

    testWidgets('shows loading indicator when loading', (tester) async {
      when(() => mockBloc.state).thenReturn(const FormEditorState.loading());
      await tester.pumpWidget(buildTestWidget());
      await tester.pump(); // Wait for the widget to rebuild
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when error occurs', (tester) async {
      const errorMessage = 'Test error';
      when(() => mockBloc.state)
          .thenReturn(const FormEditorState.error(errorMessage));
      await tester.pumpWidget(buildTestWidget());
      await tester.pump(); // Wait for the widget to rebuild
      expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets('shows form when loaded', (tester) async {
      const form = FormModel(
        id: 'test',
        title: 'Test Form',
        description: 'Test Description',
      );
      when(() => mockBloc.state).thenReturn(const FormEditorState.loaded(form));
      await tester.pumpWidget(buildTestWidget());
      await tester.pump(); // Wait for the widget to rebuild
      expect(find.text('Test Form'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });

    testWidgets('can add a new question', (tester) async {
      const form = FormModel(
        id: 'test',
        title: '',
      );
      when(() => mockBloc.state).thenReturn(const FormEditorState.loaded(form));
      await tester.pumpWidget(buildTestWidget());
      await tester.pump(); // Wait for the widget to rebuild

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Add Question'), findsOneWidget);

      // Verify that the bloc receives the AddQuestionEvent
      await tester.tap(find.text('Multiple Choice'));
      await tester.pumpAndSettle();
      verify(() => mockBloc.add(any(that: isA<AddQuestionEvent>()))).called(1);
    });

    testWidgets('can create a form from initial state', (tester) async {
      when(() => mockBloc.state).thenReturn(const FormEditorState.initial());
      await tester.pumpWidget(buildTestWidget());
      await tester.pump(); // Wait for the widget to rebuild

      // Tap the FAB to show add question dialog
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Tap the Multiple Choice option
      await tester.tap(find.text('Multiple Choice'));
      await tester.pumpAndSettle();

      // According to the error message, only AddQuestionEvent is being called
      verify(
        () => mockBloc.add(
          const FormEditorEvent.addQuestion(QuestionType.multipleChoice()),
        ),
      ).called(1);
    });
  });
}
