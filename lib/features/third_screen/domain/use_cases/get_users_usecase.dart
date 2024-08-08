import 'package:dartz/dartz.dart';
import 'package:km_test_suitmedia_resmaadi/shared/models/user_model.dart';

import '../repositories/user_repository.dart';

class GetUsersUsecase {
  final UserRepository _userRepository;

  GetUsersUsecase(this._userRepository);

  Future<Either<String, List<User>>> call({int? page, int? perPage}) async {
    return await _userRepository.getUsers(page: page, perPage: perPage);
  }
}
