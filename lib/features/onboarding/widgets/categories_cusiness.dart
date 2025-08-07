import 'package:flutter/material.dart';


class CategoryCusiness extends StatelessWidget {
  const CategoryCusiness({
    super.key,
    required this.id,
    required this.title,
    required this.image,
  });

  final num id;
  final String title, image;


  @override
  Widget build(BuildContext context) {
    return
      Column(
          spacing: 6,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                image,
                width: 110,
                height: 108,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),


          ] );
  }
}
