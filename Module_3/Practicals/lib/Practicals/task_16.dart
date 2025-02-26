// Build an image carousel that displays a different image every 3 seconds using PageView and
// an auto-slide feature.

import 'dart:async';

import 'package:flutter/material.dart';

class Task16 extends StatefulWidget {
  const Task16({super.key});

  @override
  State<Task16> createState() => _Task16State();
}

class _Task16State extends State<Task16> {
  List<String> _imgUrls = [
    "https://5.imimg.com/data5/SELLER/Default/2021/1/SB/KG/KM/121668266/new-product-500x500.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6ycswZ28yz8HqC7kF8ex7F3qLW4vuSSBjqv3otUqPxuGfvp_c-1i0FAg6azJKZy3w4KA&usqp=CAU",
    "https://img.freepik.com/premium-photo/3d-model-freeflowing-chaise-lounge-with-blue-cushions_636537-123887.jpg",
    "https://image.made-in-china.com/318f0j00rQqftagIjikb/20230722-28b7c9da8112c14f-420597291887-mp4-264-hd-taobao-mp4.webp",
    "https://images.woodenstreet.de/image/cache/data%2Fdressing-tables%2Fselena-engineered-wood-dressing-table-with-cabinet-and-pull-out-drawers%2Fexotic-teak-frosty-white%2Fupdated%2Fupdated%2Fnew-logo%2F10-750x650.jpg",
    "https://www.ulcdn.net/images/products/920359/product/Fidora_Dressing_Table_With_Stool_-_Color_Mahogany_LP.jpg?1722318898",
    "https://cdn.shopify.com/s/files/1/0096/4594/9013/files/Dressing_Table_Design_Dressing_Table_New_Design_Wardrobe_With_Dressing_Table-14.jpg?v=1651389224"
  ];

  late PageController _pageController;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Initialize PageController
    _pageController = PageController(initialPage: _currentIndex);

    // Start the timer to auto slide every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < _imgUrls.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Loop back to the first image
      }

      // Animate to the next page
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.bounceOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 16'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _imgUrls.length,
            itemBuilder: (context, index) {
              return Image.network(
                _imgUrls[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}
