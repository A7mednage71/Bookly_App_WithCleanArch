

import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:bookly/Features/home/domain/repos/HomeRepo.dart';
import 'package:bookly/core/errors/Failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoimp extends HomeRepo{
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
  
}