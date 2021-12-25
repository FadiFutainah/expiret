import 'package:expiret/config/imports/buttons.dart';
import 'package:expiret/view/widgets/expiret_app_bar.dart';
import 'package:expiret/view/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddReviewScreen extends StatelessWidget {
  final String productName;

  const AddReviewScreen({Key? key, required this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExpiretAppBar(title: 'Write Review'),
      body: Column(
        children: [
          Text(productName),
          RatingBar(
            ratingWidget: RatingWidget(
              empty: Image.asset('./assets/images/Empty.png'),
              full: Image.asset('./assets/images/Shape.png'),
              half: Image.asset('./assets/images/Shape.png'),
            ),
            onRatingUpdate: (rate) {},
            allowHalfRating: false,
            glowColor: Colors.yellow,
            initialRating: 1,
            updateOnDrag: true,
          ),
          const InputField(
            hint: 'add your review',
            initialValue: '',
          ),
          SubmitButton(
            text: 'SEND',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
