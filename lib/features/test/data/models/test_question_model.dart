import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_question_model.g.dart';

@JsonSerializable()
class TestQuestionModel extends Equatable {
  final String question;
  final int correctAnswerIndex;
  final List<String> answers;

  const TestQuestionModel({
    required this.question,
    required this.correctAnswerIndex,
    required this.answers,
  });

  factory TestQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$TestQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestQuestionModelToJson(this);

  @override
  List<Object> get props => [
        question,
        correctAnswerIndex,
        answers,
      ];
}
