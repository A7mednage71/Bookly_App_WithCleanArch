  import 'package:bookly/Features/home/presentation/manager/featuredBooksCubit/featured_books_state.dart';
import 'package:flutter/material.dart';

SnackBar SnackBarErrorMethod(FeaturedBookPaginationFailure state) {
    return SnackBar(
      content: Text(
        state.errorMessage.toString(),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      duration: const Duration(seconds: 3),
    );
  }

