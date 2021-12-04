import 'package:expiret/models/like_model.dart';
import 'package:expiret/services/data_service.dart';

class LikeRepository {
  final DataService _dataService = DataService();

  Future<String> addLike(Like like) async {
    Map<String, dynamic> data =
        await _dataService.postRequest('products/like/add', like.toJson());
    return data['message'];
  }

  Future<String> removeLike(Like like) async {
    Map<String, dynamic> data =
        await _dataService.deleteRequest('products/like/remove', like.toJson());
    return data['message'];
  }
}
