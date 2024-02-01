import 'package:bookly/Features/home/Data/repos/HomeRepo_imp.dart';
import 'package:bookly/Features/home/domain/entites/Book_Entites.dart';
import 'package:bookly/Features/home/domain/usecases/fetchFeaturedBooks_usecase.dart';
import 'package:bookly/Features/home/domain/usecases/fetchnewestBooks_usecase.dart';
import 'package:bookly/Features/home/presentation/manager/NewestBooksCubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/featuredBooksCubit/featured_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/Bloc%20Observer.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/get_it_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(KfeaturedBox);
  await Hive.openBox<BookEntity>(KnewestBox);

  Bloc.observer = MyBlocObserver();
  Getservicelocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(getit.get<HomeRepoImpl>()),
          ),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubitCubit(
              FetchNewestBooksUseCase(getit.get<HomeRepoImpl>())),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
