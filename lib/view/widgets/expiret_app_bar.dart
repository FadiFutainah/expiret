import 'package:flutter/material.dart';

class ExpiretAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? icon;
  final bool hasPop;

  const ExpiretAppBar({
    Key? key,
    required this.title,
    this.icon,
    this.hasPop = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      leading: (hasPop)
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {},
            )
          : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          color: Theme.of(context).colorScheme.onSurface,
          icon: Icon(icon),
          onPressed: () {},
        ),
      ],
      elevation: 0.5,
    );
  }
}
