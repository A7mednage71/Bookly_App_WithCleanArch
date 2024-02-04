import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:bookly/core/errors/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
