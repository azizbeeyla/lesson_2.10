import 'package:flutter/material.dart';

import '../pages/DetailPage.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.id,
    required this.title,
    required this.image,
  });

  final num id;
  final String title, image;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryDetailPagee(categoryId: id, title: title,),
          ),
        );
      },
      child: Column(
        spacing: 6,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.network(
              image,
              width: 159,
              height: 145,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
