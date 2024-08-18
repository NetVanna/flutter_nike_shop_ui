import 'package:flutter/material.dart';

class CustomSnackBars {
  CustomSnackBars._();

  static successSnackBar() => SnackBar(
        backgroundColor: Colors.green[400],
        content: const Text("Successfully Added to your bag!"),
        action: SnackBarAction(
          label: "Got it",
          onPressed: () {},
        ),
      );

  static failSnackBar() => SnackBar(
    backgroundColor: Colors.red[400],
    content: const Text("You have added this item before!"),
    action: SnackBarAction(
      label: "Got it",
      onPressed: () {},
    ),
  );
}
