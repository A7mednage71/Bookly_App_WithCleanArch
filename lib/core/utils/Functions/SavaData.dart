import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:hive/hive.dart';

void SaveBooksData(List<BookEntity> books, String Boxname) {
  var Box = Hive.box<BookEntity>(Boxname);
  Box.addAll(books);
}
