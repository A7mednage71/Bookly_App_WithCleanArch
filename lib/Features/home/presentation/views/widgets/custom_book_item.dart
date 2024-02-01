import 'package:bookly/Features/home/Data/Models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.books}) : super(key: key);
  final BookEntity books;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:2.6/4 ,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: books.image!,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
