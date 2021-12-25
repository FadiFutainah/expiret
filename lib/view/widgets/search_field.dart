import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 12, 5, 16),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: CupertinoSearchTextField(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
