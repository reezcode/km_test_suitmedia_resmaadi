import 'package:dartz/dartz.dart';

abstract class PalindromeRepository {
  Future<Either<String, bool>> isPalindrome(String text);
}
