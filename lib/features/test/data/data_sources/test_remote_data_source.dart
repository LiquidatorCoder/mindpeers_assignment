import 'package:data_channel/data_channel.dart';
import 'package:mindpeers/common/api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:mindpeers/features/test/data/models/test_question_model.dart';

@LazySingleton()
class TestRemoteDataSource {
  final ApiClient _apiClient;

  TestRemoteDataSource(this._apiClient);

  Future<DC<Exception, List<TestQuestionModel>>> getQuestionBank() async {
    try {
      // Get questions data from server
      await Future.delayed(const Duration(seconds: 2));
      final data = [
        {
          'question': 'Which statements best correspond to your career goals:',
          'correctAnswerIndex': -1,
          'answers': [
            'I know what my goals are and I am actively working towards them',
            'Its getting slightly difficult to have a consistent version of what goals I want to achieve',
            'I struggle alot with what I want to do and how I want to achieve it',
          ],
        },
        {
          'question':
              'Which statement best corresponds to your level of confidence',
          'correctAnswerIndex': -1,
          'answers': [
            'I am confident person',
            'I struggle with confidence quite often',
            'I am always nervous and unsure of myself',
          ],
        },
        {
          'question':
              'Which statement best corresponds to your financial fitness:',
          'correctAnswerIndex': -1,
          'answers': [
            'I am always on top of my game when it comes to financial planning',
            'I often worry about my present and future finances',
            'I let financial stress effect me daily',
          ],
        },
        {
          'question':
              'Which statement best corresponds to your spending habits:',
          'correctAnswerIndex': -1,
          'answers': [
            'I worry about every single purchase',
            'I prioritize bills and savings and spend on as- needed-basis',
            'I am impulsive in my spending and rarely keep a track of it',
          ],
        },
        {
          'question': 'Which statement best corresponds to your energy levels:',
          'correctAnswerIndex': -1,
          'answers': [
            'I am energized to tackle my day',
            'I can get tired easily',
            'I don’t know why I’m always exhausted',
          ],
        }
      ];

      return DC.data(
        data.map((e) => TestQuestionModel.fromJson(e)).toList(),
      );
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }
}
