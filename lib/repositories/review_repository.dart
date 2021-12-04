import 'package:expiret/models/review_model.dart';
import 'package:expiret/services/data_service.dart';

class ReviewRepository {
  final DataService _dataService = DataService();

  Future<String> addReview(Review review) async {
    Map<String, dynamic> data =
        await _dataService.postRequest('products/review/add', review.toJson());
    return data['message'];
  }
}
