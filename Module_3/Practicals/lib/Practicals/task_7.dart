// Build a grid of images using the GridView widget. Load images from the network, and
// display four images per row.

// "https://dukaan.b-cdn.net/700x700/webp/upload_file_service/4e319084-944f-48b3-9e9a-c2cc54bbcc5c/unti-7-1024x1024-2x.webp",
//     "https://co-design.in/wp-content/uploads/2015/07/faburous.jpg",
//     "https://bluedotdesign.in/cdn/shop/products/2_42ca22c4-42e0-4f87-b53d-d27d2d6b788f_1445x.jpg?v=1724233086",
//     "https://i.pinimg.com/736x/dc/f8/7c/dcf87c059a5119ef8d2d695e8acc6482.jpg"

import 'package:flutter/material.dart';

class Task7 extends StatefulWidget {
  const Task7({super.key});

  @override
  State<Task7> createState() => _Task7State();
}

class _Task7State extends State<Task7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Example'),
        backgroundColor: Colors.teal,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
        ),
        children: [
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://dukaan.b-cdn.net/700x700/webp/upload_file_service/4e319084-944f-48b3-9e9a-c2cc54bbcc5c/unti-7-1024x1024-2x.webp'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://co-design.in/wp-content/uploads/2015/07/faburous.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://bluedotdesign.in/cdn/shop/products/2_42ca22c4-42e0-4f87-b53d-d27d2d6b788f_1445x.jpg?v=1724233086'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/dc/f8/7c/dcf87c059a5119ef8d2d695e8acc6482.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://dukaan.b-cdn.net/700x700/webp/upload_file_service/4e319084-944f-48b3-9e9a-c2cc54bbcc5c/unti-7-1024x1024-2x.webp'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://co-design.in/wp-content/uploads/2015/07/faburous.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://bluedotdesign.in/cdn/shop/products/2_42ca22c4-42e0-4f87-b53d-d27d2d6b788f_1445x.jpg?v=1724233086'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/dc/f8/7c/dcf87c059a5119ef8d2d695e8acc6482.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://dukaan.b-cdn.net/700x700/webp/upload_file_service/4e319084-944f-48b3-9e9a-c2cc54bbcc5c/unti-7-1024x1024-2x.webp'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://co-design.in/wp-content/uploads/2015/07/faburous.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://bluedotdesign.in/cdn/shop/products/2_42ca22c4-42e0-4f87-b53d-d27d2d6b788f_1445x.jpg?v=1724233086'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/dc/f8/7c/dcf87c059a5119ef8d2d695e8acc6482.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://dukaan.b-cdn.net/700x700/webp/upload_file_service/4e319084-944f-48b3-9e9a-c2cc54bbcc5c/unti-7-1024x1024-2x.webp'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://co-design.in/wp-content/uploads/2015/07/faburous.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://bluedotdesign.in/cdn/shop/products/2_42ca22c4-42e0-4f87-b53d-d27d2d6b788f_1445x.jpg?v=1724233086'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/dc/f8/7c/dcf87c059a5119ef8d2d695e8acc6482.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
