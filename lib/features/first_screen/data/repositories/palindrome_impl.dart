import 'package:dartz/dartz.dart';
import 'package:km_test_suitmedia_resmaadi/features/first_screen/domain/repositories/palindrome_repository.dart';

class PalindromeImpl extends PalindromeRepository {
  @override
  Future<Either<String, bool>> isPalindrome(String text) {
    try {
      final textLower = text.toLowerCase();
      final textReversed = textLower.split('').reversed.join('');
      return Future.value(Right(textLower == textReversed));
    } catch (e) {
      return Future.value(Left(e.toString()));
    }
  }
}
