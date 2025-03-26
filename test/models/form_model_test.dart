import 'package:flutter_form_builder/models/form_model.dart';
import 'package:flutter_form_builder/models/question_model.dart';
import 'package:flutter_form_builder/models/response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FormModel', () {
    const testId = 'test-form-id';
    const testTitle = 'Test Form Title';
    const testDescription = 'Test form description';

    final testQuestions = [
      const QuestionModel.shortAnswer(
        id: 'q1',
        text: 'Short answer question',
        required: true,
      ),
      const QuestionModel.multipleChoice(
        id: 'q2',
        text: 'Multiple choice',
        options: ['Option 1', 'Option 2'],
        required: true,
      ),
    ];

    final testResponses = [
      ResponseModel(
        id: 'r1',
        answers: const {'q1': 'Answer 1', 'q2': 'Option 1'},
        submittedAt: DateTime(2023, 3, 15, 10),
      ),
    ];

    test('should create FormModel with required parameters only', () {
      const form = FormModel(
        id: testId,
        title: testTitle,
      );

      expect(form.id, testId);
      expect(form.title, testTitle);
      expect(form.description, isEmpty);
      expect(form.questions, isEmpty);
      expect(form.responses, isEmpty);
    });

    test('should create FormModel with all parameters', () {
      final form = FormModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        questions: testQuestions,
        responses: testResponses,
      );

      expect(form.id, testId);
      expect(form.title, testTitle);
      expect(form.description, testDescription);
      expect(form.questions, testQuestions);
      expect(form.responses, testResponses);
    });

    test('should properly convert FormModel to JSON', () {
      const form = FormModel(
        id: testId,
        title: testTitle,
        description: testDescription,
      );

      final json = form.toJson();

      expect(json['id'], testId);
      expect(json['title'], testTitle);
      expect(json['description'], testDescription);
      expect(json['questions'], []);
      expect(json['responses'], []);
    });

    test('should create FormModel from JSON', () {
      final json = {
        'id': testId,
        'title': testTitle,
        'description': testDescription,
        'questions': [],
        'responses': [],
      };

      final form = FormModel.fromJson(json);

      expect(form.id, testId);
      expect(form.title, testTitle);
      expect(form.description, testDescription);
      expect(form.questions, isEmpty);
      expect(form.responses, isEmpty);
    });

    test('should create FormModel from JSON with questions and responses', () {
      final questionsJson = [
        {
          'runtimeType': 'shortAnswer',
          'id': 'q1',
          'text': 'Question text',
          'required': true,
        }
      ];

      final responsesJson = [
        {
          'id': 'r1',
          'answers': {'q1': 'Answer text'},
          'submittedAt': '2023-03-15T10:00:00.000',
        }
      ];

      final json = {
        'id': testId,
        'title': testTitle,
        'description': testDescription,
        'questions': questionsJson,
        'responses': responsesJson,
      };

      final form = FormModel.fromJson(json);

      expect(form.id, testId);
      expect(form.title, testTitle);
      expect(form.description, testDescription);
      expect(form.questions.length, 1);
      expect(form.questions[0].id, 'q1');
      expect(form.responses.length, 1);
      expect(form.responses[0].id, 'r1');
    });

    test('should be immutable and use copyWith correctly', () {
      const form = FormModel(
        id: testId,
        title: testTitle,
      );

      final updatedForm = form.copyWith(
        title: 'Updated Title',
        description: 'Updated Description',
      );

      expect(form.id, testId);
      expect(form.title, testTitle);
      expect(form.description, isEmpty);

      expect(updatedForm.id, testId);
      expect(updatedForm.title, 'Updated Title');
      expect(updatedForm.description, 'Updated Description');
    });
  });
}
