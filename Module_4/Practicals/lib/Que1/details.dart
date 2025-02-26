import 'package:flutter/material.dart';

class myDetails extends StatelessWidget {
  const myDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 500,
          width: 500,
          child: Image.network(
              "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA4LWNhLTIwYS5wbmc.png"),
        ),
      ],
    );
  }
}