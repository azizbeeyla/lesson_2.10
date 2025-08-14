import 'package:flutter/material.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';

class RecipeTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final String label;
  final TextEditingController controller;

  const RecipeTextField({
    super.key,
    required this.hintText,
    this.isPassword = false, required this.label, required this.controller,
  });

  @override
  State<RecipeTextField> createState() => _RecipeTextFieldState();
}

class _RecipeTextFieldState extends State<RecipeTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,style: TextStyle(color: Colors.white,fontSize: 15),),

SizedBox(height: 10,),
        TextFormField(
          controller: widget.controller,

          obscureText: widget.isPassword ? obscureText : false,
          decoration: InputDecoration(
            filled: true,
            fillColor:AppColors.pinkorig,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.textcolor),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textcolor,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            )
                : null,
          ),
        ),
      ],
    );
  }
}
