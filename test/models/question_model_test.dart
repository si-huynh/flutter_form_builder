import 'package:flutter_form_builder/models/question_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QuestionModel', () {
    const testId = 'test-question-id';
    const testText = 'Test question text';

    group('ShortAnswerQuestion', () {
      test('should create ShortAnswerQuestion with minimal parameters', () {
        const question = QuestionModel.shortAnswer(
          id: testId,
          text: testText,
        );

        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, false);
      });

      test('should create ShortAnswerQuestion with all parameters', () {
        const question = QuestionModel.shortAnswer(
          id: testId,
          text: testText,
          required: true,
        );

        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, true);
      });

      test('should convert ShortAnswerQuestion to JSON', () {
        const question = QuestionModel.shortAnswer(
          id: testId,
          text: testText,
          required: true,
        );

        final json = question.toJson();

        expect(json['runtimeType'], 'shortAnswer');
        expect(json['id'], testId);
        expect(json['text'], testText);
        expect(json['required'], true);
      });

      test('should create ShortAnswerQuestion from JSON', () {
        final json = {
          'runtimeType': 'shortAnswer',
          'id': testId,
          'text': testText,
          'required': true,
        };

        final question = QuestionModel.fromJson(json);

        expect(question, isA<ShortAnswerQuestion>());
        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, true);
      });

      test('should correctly use copyWith', () {
        const question = QuestionModel.shortAnswer(
          id: testId,
          text: testText,
        );

        final updatedQuestion = question.copyWith(
          text: 'Updated text',
          required: true,
        );

        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, false);

        expect(updatedQuestion.id, testId);
        expect(updatedQuestion.text, 'Updated text');
        expect(updatedQuestion.required, true);
      });
    });

    group('LongAnswerQuestion', () {
      test('should create LongAnswerQuestion with minimal parameters', () {
        const question = QuestionModel.longAnswer(
          id: testId,
          text: testText,
        );

        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, false);
      });

      test('should create LongAnswerQuestion with all parameters', () {
        const question = QuestionModel.longAnswer(
          id: testId,
          text: testText,
          required: true,
        );

        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, true);
      });

      test('should convert LongAnswerQuestion to JSON', () {
        const question = QuestionModel.longAnswer(
          id: testId,
          text: testText,
          required: true,
        );

        final json = question.toJson();

        expect(json['runtimeType'], 'longAnswer');
        expect(json['id'], testId);
        expect(json['text'], testText);
        expect(json['required'], true);
      });

      test('should create LongAnswerQuestion from JSON', () {
        final json = {
          'runtimeType': 'longAnswer',
          'id': testId,
          'text': testText,
          'required': true,
        };

        final question = QuestionModel.fromJson(json);

        expect(question, isA<LongAnswerQuestion>());
        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, true);
      });

      test('should correctly use copyWith', () {
        const question = QuestionModel.longAnswer(
          id: testId,
          text: testText,
        );

        final updatedQuestion = question.copyWith(
          text: 'Updated text',
          required: true,
        );

        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, false);

        expect(updatedQuestion.id, testId);
        expect(updatedQuestion.text, 'Updated text');
        expect(updatedQuestion.required, true);
      });
    });

    group('MultipleChoiceQuestion', () {
      const testOptions = ['Option 1', 'Option 2', 'Option 3'];

      test('should create MultipleChoiceQuestion with minimal parameters', () {
        const question = QuestionModel.multipleChoice(
          id: testId,
          text: testText,
        );

        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, false);

        const typedQuestion = question as MultipleChoiceQuestion;
        expect(typedQuestion.options, isEmpty);
        expect(typedQuestion.other, false);
      });

      test('should create MultipleChoiceQuestion with all parameters', () {
        const question = QuestionModel.multipleChoice(
          id: testId,
          text: testText,
          required: true,
          options: testOptions,
          other: true,
        );

        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, true);

        const typedQuestion = question as MultipleChoiceQuestion;
        expect(typedQuestion.options, testOptions);
        expect(typedQuestion.other, true);
      });

      test('should convert MultipleChoiceQuestion to JSON', () {
        const question = QuestionModel.multipleChoice(
          id: testId,
          text: testText,
          required: true,
          options: testOptions,
          other: true,
        );

        final json = question.toJson();

        expect(json['runtimeType'], 'multipleChoice');
        expect(json['id'], testId);
        expect(json['text'], testText);
        expect(json['required'], true);
        expect(json['options'], testOptions);
        expect(json['other'], true);
      });

      test('should create MultipleChoiceQuestion from JSON', () {
        final json = {
          'runtimeType': 'multipleChoice',
          'id': testId,
          'text': testText,
          'required': true,
          'options': testOptions,
          'other': true,
        };

        final question = QuestionModel.fromJson(json);

        expect(question, isA<MultipleChoiceQuestion>());
        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, true);

        final typedQuestion = question as MultipleChoiceQuestion;
        expect(typedQuestion.options, testOptions);
        expect(typedQuestion.other, true);
      });

      test('should correctly use copyWith for MultipleChoiceQuestion', () {
        const question = QuestionModel.multipleChoice(
          id: testId,
          text: testText,
        );

        const mcQuestion = question as MultipleChoiceQuestion;
        final updatedQuestion = mcQuestion.copyWith(
          text: 'Updated text',
          required: true,
          options: testOptions,
          other: true,
        );

        expect(question.id, testId);
        expect(question.text, testText);
        expect(question.required, false);
        expect(mcQuestion.options, isEmpty);
        expect(mcQuestion.other, false);

        expect(updatedQuestion.id, testId);
        expect(updatedQuestion.text, 'Updated text');
        expect(updatedQuestion.required, true);
        expect(updatedQuestion.options, testOptions);
        expect(updatedQuestion.other, true);
      });
    });
  });

  group('QuestionType', () {
    test('should create MultipleChoice type', () {
      const type = QuestionType.multipleChoice();
      expect(type, isA<MultipleChoice>());
    });

    test('should create Paragraph type', () {
      const type = QuestionType.paragraph();
      expect(type, isA<Paragraph>());
    });

    test('should convert MultipleChoice to JSON', () {
      const type = QuestionType.multipleChoice();
      final json = type.toJson();
      expect(json['runtimeType'], 'multipleChoice');
    });

    test('should convert Paragraph to JSON', () {
      const type = QuestionType.paragraph();
      final json = type.toJson();
      expect(json['runtimeType'], 'paragraph');
    });

    test('should create MultipleChoice from JSON', () {
      final json = {'runtimeType': 'multipleChoice'};
      final type = QuestionType.fromJson(json);
      expect(type, isA<MultipleChoice>());
    });

    test('should create Paragraph from JSON', () {
      final json = {'runtimeType': 'paragraph'};
      final type = QuestionType.fromJson(json);
      expect(type, isA<Paragraph>());
    });
  });
}
