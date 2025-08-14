import 'package:lesson2_10/features/categories/managers/category_view.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../appbars/appbarcus_toms.dart';
import '../widgets/CategoryItem.dart';

class Categorysourse extends StatelessWidget {
  Categorysourse({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryView()..getCategory(),
      child: Scaffold(
        backgroundColor: AppColors.baige,
        appBar: AppbarcusToms(
          icon: 'assets/back.svg',
          title: "Breakfast",
          iconaction1: "assets/notification.svg",
          iconaction2: "assets/find.svg",
          background: Color(0xFFFFC6C9),
          foreground: AppColors.mainpink,
        ),
        body: Consumer<CategoryView>(
          builder: (context, cv, child) {
            if (cv.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: cv.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 171,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final item = cv.categories[index];
                  return CategoryItem(
                    id: item.id,
                    title: item.title,
                    image: item.image,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
