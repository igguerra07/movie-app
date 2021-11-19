import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: const Text(
            "Trending Movies",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.search_outlined, size: 18,),
        )
      ],
    );
  }
}
