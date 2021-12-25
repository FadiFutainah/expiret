import 'package:expiret/config/config.dart';
import 'package:expiret/view/widgets/bottom_nav_bar.dart';
import 'package:expiret/view/widgets/category_button.dart';
import 'package:expiret/view/widgets/expiret_app_bar.dart';
import 'package:expiret/view/widgets/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const ExpiretAppBar(title: 'Expiret', hasPop: false),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const SearchField(),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: SizedBox(
                width: _width,
                height: 35,
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            SizedBox(
              height: _height * 0.17,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryButton(
                    img: 'can',
                    name: 'food',
                    onTap: () {},
                  ),
                  CategoryButton(
                    img: 'veg',
                    name: 'vegetables',
                    onTap: () {},
                  ),
                  CategoryButton(
                    img: 'book',
                    name: 'books',
                    onTap: () {},
                  ),
                  CategoryButton(
                    img: 'lamp',
                    name: 'devices',
                    onTap: () {},
                  ),
                  CategoryButton(
                    img: 'games',
                    name: 'gaming',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'see all',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: _width,
                height: _height * 0.4,
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => Card(
                    child: SizedBox(
                      height: _height * 0.2,
                      child: Column(
                        children: [
                          Image.asset('assets\\images\\p1.png'),
                          const Text('Black watch'),
                          const Text('days left : 9'),
                          Row(
                            children: const [
                              Text('500\$'),
                              Text(
                                '550\$',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(screen: Screen.explore),
      ),
    );
  }
}
