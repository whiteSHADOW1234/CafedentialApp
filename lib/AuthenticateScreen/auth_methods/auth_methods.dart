import 'package:flutter/material.dart';

final RegExp emailRegExp = RegExp(
  r'^[a-zA-Z0-9.!#$%&¡¦*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
);

Widget commonTextFormField({required String? labeltext,required String? Function(String?)? validator,required TextEditingController? controller}) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20,bottom: 15),
      child: TextFormField(
        obscureText: labeltext == 'Password' ? true : false,
        validator: validator,
        controller: controller,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 162, 157, 157),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 235, 101, 34),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 134, 169, 223),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 134, 169, 223),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      )
    );
  }
