import 'package:flutter/material.dart';

class MovieAppBarWidget extends StatelessWidget {
  final VoidCallback onClickBackButton;
  final VoidCallback onClickFavButton;

  const MovieAppBarWidget({
    Key? key,
    required this.onClickBackButton,
    required this.onClickFavButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onClickBackButton,
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          iconSize: 18,
        ),
        IconButton(
          onPressed: onClickFavButton,
          icon: const Icon(Icons.favorite_border),
          color: Colors.white,
          iconSize: 18,
        ),
      ],
    );
  }
}
