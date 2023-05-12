import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
}
