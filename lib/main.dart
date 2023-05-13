import 'package:bookly_app/Constents.dart';
import 'package:bookly_app/Core/utils/api_service.dart';
import 'package:bookly_app/Core/utils/approuter.dart';
import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/Home/data/model/book_model/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/Home/presentation/manager/featuredBooks_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
            create: (context) => NewsetBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchNewsetBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
