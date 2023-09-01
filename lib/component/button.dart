
import 'package:flutter/material.dart';

Widget button({
  required void Function() onPressed,
  required String name,
})=> SizedBox(
  width: double.infinity,
  child: ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    backgroundColor: Colors.white,
  ),onPressed: onPressed,
  child: Text(name,style: const TextStyle(
      color: Colors.black
  )),
),);