import 'package:flutter/material.dart';
import 'package:lesson2_10/features/categories/managers/category_view.dart';
import 'package:provider/provider.dart';

import 'bottomitem.dart';

class RecipeAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarBottom({
    super.key,
    required this.selectedIndex,
  });

  final num selectedIndex;

  @override
  Size get preferredSize => Size(double.infinity, 40);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>  CategoryView(),    child: Consumer<CategoryView>(
        builder: (context, vm, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: List.generate(
                  vm.categoies.length,
                      (index) => Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: BottomItem(
                      id: vm.categoies[index]['id'],
                      title: vm.categoies[index]['title'],
                      isSelected: vm.categoies[index]['id'] == selectedIndex,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
