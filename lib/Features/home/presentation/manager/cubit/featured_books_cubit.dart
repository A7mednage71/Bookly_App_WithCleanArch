import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/presentation/manager/cubit/featured_books_state.dart';



class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
}
