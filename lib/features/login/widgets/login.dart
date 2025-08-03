import 'package:flutter/material.dart';

class RecipiTextformfield extends StatefulWidget {
 final bool ispasword;
 final String label;
 final String hinttext;
  final VoidCallback onpressed;
  final TextEditingController controller;


  RecipiTextformfield({
    super.key,

    required this.hinttext,
    required this.label,
    this.ispasword = false,
    required this.onpressed, required this.controller,
  });

  @override
  State<RecipiTextformfield> createState() => _RecipiTextformfieldState();
}

class _RecipiTextformfieldState extends State<RecipiTextformfield> {
  bool isselected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),

          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(

              filled: true,
              fillColor: Color(0xFFFFC6C9),
              hintText: widget.hinttext,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19),
              ),
              suffixIcon: widget.ispasword
                  ? IconButton(
                      icon: Icon(
                        isselected ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isselected = !isselected;
                        });
                      },
                    )
                  : null,
            ),
            obscureText: widget.ispasword ? isselected : false,
          ),
        ],
      ),
    );
  }
}
