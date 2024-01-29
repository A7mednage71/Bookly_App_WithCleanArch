import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var Box = Hive.box<BookEntity>(KfeaturedBox);
    return Box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var Box = Hive.box<BookEntity>(KnewestBox);
    return Box.values.toList();
  }
}
