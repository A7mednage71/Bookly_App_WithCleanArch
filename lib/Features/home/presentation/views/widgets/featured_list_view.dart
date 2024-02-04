import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:bookly/Features/home/presentation/manager/featuredBooksCubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/featuredBooksCubit/featured_books_state.dart';
import 'package:bookly/core/utils/Functions/SnakBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController _scrollController;
  var pagenumber = 1;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    var currentPositions = _scrollController.position.pixels;
    var maxScrolllength = _scrollController.position.maxScrollExtent;

    if (currentPositions >= 0.7 * maxScrolllength) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturdBooks(pageNumber: pagenumber++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  List<BookEntity> Books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksStates>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          Books.addAll(state.books);
        }
        if (state is FeaturedBookPaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarErrorMethod(state));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBookPaginationLoading ||
            state is FeaturedBookPaginationFailure) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: Books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(books: Books[index]),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return SizedBox(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
