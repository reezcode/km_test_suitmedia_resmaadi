import 'package:dartz/dartz.dart';

import '../repositories/palindrome_repository.dart';

class IsPalindromeUsecase {
  final PalindromeRepository _palindromeRepository;

  IsPalindromeUsecase(this._palindromeRepository);
  Future<Either<String, bool>> call(String text) async =>
      _palindromeRepository.isPalindrome(text);
}
