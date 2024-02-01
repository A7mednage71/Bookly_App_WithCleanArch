import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';

class FeaturedBooksStates {}

class FeaturedBooksSuccess extends FeaturedBooksStates {
  final List<BookEntity> books;
  FeaturedBooksSuccess(this.books);
}

class FeaturedBooksFailure extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBooksFailure(this.errorMessage);
}

class FeaturedBooksLoading extends FeaturedBooksStates {}

class FeaturedBooksInitial extends FeaturedBooksStates {}
