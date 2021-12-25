import 'package:expiret/view/widgets/expiret_app_bar.dart';
import 'package:expiret/view/widgets/input_field.dart';
import 'package:flutter/material.dart';

class PostProductScreen extends StatelessWidget {
  const PostProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExpiretAppBar(
        title: 'Post Producrt',
      ),
      body: Column(
        children: [
          InputField(label: 'Product name'),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
