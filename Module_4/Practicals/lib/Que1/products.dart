import 'package:flutter/material.dart';

class myProducts extends StatelessWidget {
  const myProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
              "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA4LWNhLTIwYS5wbmc.png"),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
              "https://3dbrute.com/wp-content/uploads/full/2024/03/17814.jpg"),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
              "https://img.freepik.com/premium-photo/3d-render-3d-printer-isolated-white-background-computer-digital-drawing_1057-146769.jpg"),
        ),
      ],
    );
  }
}
