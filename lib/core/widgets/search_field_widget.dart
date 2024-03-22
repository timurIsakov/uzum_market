import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFieldWidget extends StatelessWidget {
  final String hintText;
  final Function(String) onSubmitted;
  final TextEditingController controller;

  const SearchFieldWidget(
      {super.key,
      required this.hintText,
      required this.onSubmitted,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextField(
        onSubmitted: onSubmitted,
        controller: controller,
        cursorColor: Color(0xff7000FF),
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(0),
          fillColor: Color(0xffF2F4F7),
          filled: true,
          hintText: hintText,
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff8B8E99),
          ),
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff8B8E99),
          ),
        ),
      ),
    );
  }
}
