part of 'newest_books_cubit_cubit.dart';

@immutable
class NewestBooksCubitState {}

class NewestBooksSuccess extends NewestBooksCubitState {
  final List<BookEntity> books;
  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBooksCubitState {
  final String errorMessage;
  NewestBooksFailure(this.errorMessage);
}

class NewestBooksLoading extends NewestBooksCubitState {}

class NewestBooksInitial extends NewestBooksCubitState {}
