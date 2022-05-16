import 'package:flutter/material.dart';

Widget inputForm(
    String title, TextEditingController Controller, String hintText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            color: Color(0xff324367),
            fontSize: 17,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 50,
        width: 310,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff324367), spreadRadius: 0.5, blurRadius: 1)
            ]),
        child: TextField(
          controller: Controller,
          cursorColor: Color(0xff324367),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    ],
  );
}

// Row(
// children: [
// Text(
// 'Interest Rate *',
// style: TextStyle(
// color: Color(0xff324367),
// fontSize: 17,
// fontWeight: FontWeight.bold,
// letterSpacing: 0.5),
// ),
// Text(
// '(max: 50% per annum)',
// style: TextStyle(
// color: Colors.grey,
// fontSize: 12,
// fontWeight: FontWeight.bold,
// letterSpacing: 0.5),
// ),
// ],
// ),
// SizedBox(
// height: 10,
// ),
// Container(
// height: 50,
// width: 310,
// decoration: BoxDecoration(
// color: Colors.grey[100],
// borderRadius: BorderRadius.circular(15),
// boxShadow: [
// BoxShadow(
// color: Color(0xff324367), spreadRadius: 0.5, blurRadius: 1)
// ]),
// child: TextField(
// controller: interestRate,
// cursorColor: Color(0xff324367),
// keyboardType: TextInputType.number,
// decoration: InputDecoration(
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(15),
// borderSide: BorderSide.none),
// disabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(15),
// borderSide: BorderSide.none),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(15),
// borderSide: BorderSide.none),
// ),
// ),
// ),
// SizedBox(
// height: 15,
// ),
// Row(
// children: [
// Text(
// 'Loan Tenure *',
// style: TextStyle(
// color: Color(0xff324367),
// fontSize: 17,
// fontWeight: FontWeight.bold,
// letterSpacing: 0.5),
// ),
// Text(
// '(max: 30 yr)',
// style: TextStyle(
// color: Colors.grey,
// fontSize: 12,
// fontWeight: FontWeight.bold,
// letterSpacing: 0.5),
// ),
// SizedBox(
// width: 40,
// ),
// Column(
// children: [
// Text(TenureTypes, style: TextStyle(fontWeight: FontWeight.bold)),
// Switch(
// activeColor: Color(0xff324367),
// value: switchValue,
// onChanged: (bool value) {
// print(value);
//
// if (value) {
// TenureTypes = TenureType[1];
// } else {
// TenureTypes = TenureType[0];
// }
//
// setState(() {
// switchValue = value;
// });
// })
// ],
// )
// ],
// ),
// SizedBox(
// height: 10,
// ),
// Container(
// height: 50,
// width: 310,
// decoration: BoxDecoration(
// color: Colors.grey[100],
// borderRadius: BorderRadius.circular(15),
// boxShadow: [
// BoxShadow(
// color: Color(0xff324367), spreadRadius: 0.5, blurRadius: 1)
// ]),
// child: TextField(
// controller: tenure,
// cursorColor: Color(0xff324367),
// keyboardType: TextInputType.number,
// decoration: InputDecoration(
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(15),
// borderSide: BorderSide.none),
// disabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(15),
// borderSide: BorderSide.none),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(15),
// borderSide: BorderSide.none),
// ),
// ),
// ),
