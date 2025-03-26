import 'package:flutter_form_builder/models/response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResponseModel', () {
    const testId = 'test-response-id';
    final testAnswers = {
      'q1': 'Answer 1',
      'q2': 'Option 2',
      'q3': ['Option 1', 'Option 3'],
    };
    final testDate = DateTime(2023, 3, 15, 10, 30);

    test('should create ResponseModel with required parameters', () {
      final response = ResponseModel(
        id: testId,
        answers: testAnswers,
        submittedAt: testDate,
      );

      expect(response.id, testId);
      expect(response.answers, testAnswers);
      expect(response.submittedAt, testDate);
    });

    test('should properly convert ResponseModel to JSON', () {
      final response = ResponseModel(
        id: testId,
        answers: testAnswers,
        submittedAt: testDate,
      );

      final json = response.toJson();

      expect(json['id'], testId);
      expect(json['answers'], testAnswers);
      expect(json['submittedAt'], testDate.toIso8601String());
    });

    test('should create ResponseModel from JSON', () {
      final json = {
        'id': testId,
        'answers': testAnswers,
        'submittedAt': testDate.toIso8601String(),
      };

      final response = ResponseModel.fromJson(json);

      expect(response.id, testId);
      expect(response.answers, testAnswers);
      expect(response.submittedAt.year, testDate.year);
      expect(response.submittedAt.month, testDate.month);
      expect(response.submittedAt.day, testDate.day);
      expect(response.submittedAt.hour, testDate.hour);
      expect(response.submittedAt.minute, testDate.minute);
    });

    test('should be immutable and use copyWith correctly', () {
      final response = ResponseModel(
        id: testId,
        answers: testAnswers,
        submittedAt: testDate,
      );

      final newDate = DateTime(2023, 4, 20, 15, 45);
      final newAnswers = {
        'q1': 'Updated answer',
        'q2': 'Option 3',
      };

      final updatedResponse = response.copyWith(
        answers: newAnswers,
        submittedAt: newDate,
      );

      // Original should be unchanged
      expect(response.id, testId);
      expect(response.answers, testAnswers);
      expect(response.submittedAt, testDate);

      // Updated should have new values
      expect(updatedResponse.id, testId); // ID doesn't change
      expect(updatedResponse.answers, newAnswers);
      expect(updatedResponse.submittedAt, newDate);
    });

    test('should handle equality correctly', () {
      final response1 = ResponseModel(
        id: testId,
        answers: testAnswers,
        submittedAt: testDate,
      );

      final response2 = ResponseModel(
        id: testId,
        answers: Map.from(testAnswers),
        submittedAt: DateTime(2023, 3, 15, 10, 30),
      );

      final response3 = ResponseModel(
        id: 'different-id',
        answers: testAnswers,
        submittedAt: testDate,
      );

      expect(response1, response2);
      expect(response1, isNot(response3));
    });

    test('should handle answer value retrieval correctly', () {
      final response = ResponseModel(
        id: testId,
        answers: testAnswers,
        submittedAt: testDate,
      );

      expect(response.answers['q1'], 'Answer 1');
      expect(response.answers['q2'], 'Option 2');
      expect(response.answers['q3'], ['Option 1', 'Option 3']);
      expect(response.answers['q4'], isNull);
    });
  });
}
