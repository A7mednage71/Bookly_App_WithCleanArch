import 'package:bookly/Features/home/Data/DataSources/home_Local_dataSource.dart';
import 'package:bookly/Features/home/Data/DataSources/home_remote_datasource.dart';
import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:bookly/Features/home/domain/repos/HomeRepo.dart';
import 'package:bookly/core/errors/Failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeLocalDataSource, this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var SavedBooks = homeLocalDataSource.fetchFeaturedBooks();
      if (SavedBooks.isNotEmpty) {
        return right(SavedBooks);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var SavedBooks = homeLocalDataSource.fetchNewestBooks();
      if (SavedBooks.isNotEmpty) {
        return right(SavedBooks);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
