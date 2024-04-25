import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget backCard(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.50,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: const Color(0xFF00C2FF).withOpacity(0.05),
      borderRadius:
          const BorderRadius.only(bottomRight: Radius.circular(110.0)),
    ),
  );
}
