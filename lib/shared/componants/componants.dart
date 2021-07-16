import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 40.0,
  Color color = Colors.green,
  required VoidCallback function,
  required String text,
  bool toUpper = true,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        color: color,
        onPressed: function,
        child: Text(
          toUpper ? text.toUpperCase() : text,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );

Widget defaultTFF({
  required String label,
  required IconData prefix,
  IconData? suffix,
  required TextInputType inputType,
  bool isPassword = false,
  required TextEditingController controller,
  VoidCallback? suffuxPressed,
  required String? Function(String?) validate,
  Function()? ontap,
}) =>
    TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        //more specific
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffuxPressed,
              )
            : null,
      ),
      keyboardType: inputType,
      obscureText: isPassword,
      controller: controller,
      validator: validate,
      onTap: ontap,
    );

Widget defaultTaskItem({
  required String title,
  required String time,
  required String date,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 35.0,
          child: Text('$time'),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$title',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
              Text(
                '$date',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400]),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
