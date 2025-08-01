import 'package:flutter/material.dart';

import 'bottomitem.dart';
import '../pages/CategorySourse.dart';

class RecipeAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarBottom({
    super.key,
    required this.selectedIndex,
  });

  final num selectedIndex;

  @override
  Size get preferredSize => Size(double.infinity, 25);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 39, vertical: 7),
              child: Row(
                spacing: 19,
                children: List.generate(
                  snapshot.data!.length,
                      (index) => BottomItem(
                    id: snapshot.data![index]['id'],
                    title: snapshot.data![index]['title'],
                    isSelected: snapshot.data![index]['id'] == selectedIndex,
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
