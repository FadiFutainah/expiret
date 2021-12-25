import 'package:expiret/config/config.dart';
import 'package:expiret/view/widgets/bottom_nav_bar.dart';
import 'package:expiret/view/widgets/expiret_app_bar.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const ExpiretAppBar(
        icon: Icons.add,
        title: 'My Products',
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Dismissible(
          key: Key('$index'),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Theme.of(context).colorScheme.error,
            child: const Positioned(
              left: 30,
              child: Icon(Icons.delete_forever_outlined),
            ),
          ),
          onDismissed: (DismissDirection dirction) {
            if (dirction == DismissDirection.endToStart) {}
          },
          child: ListTile(
            leading: SizedBox(
              width: _width * 0.9,
              height: _height * 0.25,
              child: Card(
                  // child: Image.asset('assets\\images\\2.jpg'),
                  ),
            ),
            title: Text(''),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Container(
                      color: Theme.of(context).colorScheme.onSecondary,
                      width: _width * 0.1,
                      child: Card(
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        child: Row(
                          children: [
                            Text('Likes'),
                            Text('27'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Edit'))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(screen: Screen.prodcts),
    );
  }
}
