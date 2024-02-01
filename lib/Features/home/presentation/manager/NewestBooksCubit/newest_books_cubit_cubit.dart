import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/usecases/fetchnewestBooks_usecase.dart';
import 'package:meta/meta.dart';

import '../../../domain/entites/Book_Entites.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubitCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubitCubit(this.fetchNewestBooksUseCase)
      : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) => emit(NewestBooksFailure(failure.message)),
        (books) => emit(NewestBooksSuccess(books)));
  }
}
