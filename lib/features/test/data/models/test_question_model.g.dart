// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestQuestionModel _$TestQuestionModelFromJson(Map<String, dynamic> json) =>
    TestQuestionModel(
      question: json['question'] as String,
      correctAnswerIndex: json['correctAnswerIndex'] as int,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TestQuestionModelToJson(TestQuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'correctAnswerIndex': instance.correctAnswerIndex,
      'answers': instance.answers,
    };
