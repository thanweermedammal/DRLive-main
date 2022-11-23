import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DocMedicineText(
  @required controllermed,
  @required controllerdos,
  @required controllerdays,
  @required controllertime,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            controller: controllermed,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            controller: controllerdos,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            // keyboardType: TextInputType.number,
            controller: controllerdays,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            controller: controllertime,
          ),
        ),
      ],
    ),
  );
}
