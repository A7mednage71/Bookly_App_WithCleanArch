import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int start = pageNumber * 10;
    int end = (pageNumber + 1) * 10;
    var Box = Hive.box<BookEntity>(KfeaturedBox);
    int length = Box.values.length;
    if (start >= length || end >= length) {
      return [];
    }
    return Box.values.toList().sublist(start, end);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var Box = Hive.box<BookEntity>(KnewestBox);
    return Box.values.toList();
  }
}
