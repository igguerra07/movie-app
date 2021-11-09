import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("MoviesApp"),
      actions: [
        IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.search_outlined),
        ),
      ],
    );
  }
}
