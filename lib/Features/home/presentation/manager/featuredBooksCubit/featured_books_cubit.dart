import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/usecases/fetchFeaturedBooks_usecase.dart';
import 'package:bookly/Features/home/presentation/manager/featuredBooksCubit/featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturdBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.call();
    result.fold((Failure) => emit(FeaturedBooksFailure(Failure.message)),
        (books) => emit(FeaturedBooksSuccess(books)));
  }
}
