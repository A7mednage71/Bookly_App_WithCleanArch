import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/usecases/fetchFeaturedBooks_usecase.dart';
import 'package:bookly/Features/home/presentation/manager/featuredBooksCubit/featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturdBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBookPaginationLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold((Failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(Failure.message));
      } else {
        emit(FeaturedBookPaginationFailure(Failure.message));
      }
    }, (books) => emit(FeaturedBooksSuccess(books)));
  }
}
