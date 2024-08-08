import 'package:dartz/dartz.dart';
import 'package:km_test_suitmedia_resmaadi/config/endpoint.dart';
import 'package:km_test_suitmedia_resmaadi/core/services/rs_api.dart';
import 'package:km_test_suitmedia_resmaadi/features/third_screen/domain/repositories/user_repository.dart';
import 'package:km_test_suitmedia_resmaadi/shared/models/user_model.dart';

class UserImpl extends UserRepository {
  @override
  Future<Either<String, List<User>>> getUsers({int? page, int? perPage}) async {
    try {
      final res =
          await RsAPI.instance.get(endpoint: Endpoint.users, queryParameters: {
        'page': page.toString(),
        'per_page': perPage.toString(),
      });
      final data = (res.data as List).map((e) => User.fromJson(e)).toList();
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
