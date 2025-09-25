// ignore_for_file: body_might_complete_normally_catch_error

import 'package:the_exchange_online/data/models/feedback_model.dart';
import 'package:the_exchange_online/data/repository/feedback_repository/feedback_repo.dart';

/// Feedbacks is collection type in each product
class FirebaseFeedbackRepository implements FeedbackRepository {
  /// Stream of feedback
  /// [pid] is product id

  @override
  Stream<List<FeedBackModel>>? fetchFeedbacks(String pid) async* {}

  /// Add new doc to feedbacks collection
  /// [pid] is product id
  /// [newItem] is data of new feedback

  @override
  Future<List<FeedBackModel>> getFeedbacksByStar(String pid, int star) async {
    return [];
  }

  /// Get feedbacks by star
  /// [pid] is product id
  /// [star] is number of stars

  @override
  Future<void> addNewFeedback(String pid, FeedBackModel newItem) async {}

  ///Singleton factory
  static final FirebaseFeedbackRepository _instance =
      FirebaseFeedbackRepository._internal();

  factory FirebaseFeedbackRepository() {
    return _instance;
  }

  FirebaseFeedbackRepository._internal();
}
