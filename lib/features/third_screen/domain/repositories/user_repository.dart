import 'package:dartz/dartz.dart';
import 'package:km_test_suitmedia_resmaadi/shared/models/user_model.dart';

abstract class UserRepository {
  Future<Either<String, List<User>>> getUsers({int? page, int? perPage});
}
