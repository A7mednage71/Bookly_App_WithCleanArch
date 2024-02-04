import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:bookly/Features/home/domain/repos/HomeRepo.dart';
import 'package:bookly/core/errors/Failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
}
