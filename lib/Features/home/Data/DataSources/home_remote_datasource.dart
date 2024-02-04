import 'package:bookly/Features/home/Data/Models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/Api_service.dart';
import 'package:bookly/core/utils/Functions/SavaData.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        Endpoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getbooklist(data);
    SaveBooksData(books, KfeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        Endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = getbooklist(data);
    SaveBooksData(books, KnewestBox);
    return books;
  }

  List<BookEntity> getbooklist(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
