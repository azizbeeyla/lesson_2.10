import 'package:flutter/material.dart';

class LunchPagetext extends StatelessWidget {
  const LunchPagetext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "Fluffy pancakes served with silky whipped cream, a classic breakfast indulgence perfect for a leisurely morning treat.",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        maxLines: 2,
      ),
    );
  }
}
