import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String name;
  final String img;
  final VoidCallback onTap;

  const CategoryButton({
    Key? key,
    required this.name,
    required this.img,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                child: Image.asset('assets\\images\\' + img + '.png'),
                radius: 35,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(name),
        ],
      ),
    );
  }
}
