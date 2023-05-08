import 'package:bookly_app/Core/utils/assets.dart';
import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Core/widgets/custom_button.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/box_action.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custombookdetails_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const CustomBookImage(),
          ),
          const SizedBox(
            height: 43,
          ),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: 0.7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 18),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 37),
          const BoxAction(),
        ],
      ),
    );
  }
}
