import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baige,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: MyPrersinTentHeaderDelegate()),

          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            delegate: SliverChildListDelegate(
              [
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyPrersinTentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return getWidget(shrinkOffset);
  }

  Widget getWidget(double shrinkOffset) {
    if (shrinkOffset <= 100 && shrinkOffset >= 0) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 140,
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image.network(
                "https://i.pravatar.cc/150?img=3",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("@Username",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 10),
              Text("FirstName Lastname",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(height: 10),
              Text("Description",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
        ],
      );
    } else if (shrinkOffset <= 200 && shrinkOffset > 10) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                "https://i.pravatar.cc/150?img=3",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("@Username",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 10),
              Text("FirstName Lastname",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 70,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.network(
                "https://i.pravatar.cc/150?img=3",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("@Username",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
        ],
      );
    }

  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
