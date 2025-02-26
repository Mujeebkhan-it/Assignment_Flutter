// Develop a photo gallery app using GridView to display multiple images from URLs. Include a
// loading indicator while images are loading.

// cached_network_image: For efficient loading and caching of images.
// flutter_spinkit: For the loading spinner.

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Task14 extends StatelessWidget {
  Task14({super.key});

  final List<String> imageUrls = [
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fouchcart.com%2Fcollections%2Fsofa-chairs&psig=AOvVaw0zewwcdcOZS2V8gqZwlGKI&ust=1734788243760000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKj2zv67tooDFQAAAAAdAAAAABAE",
    "https://5.imimg.com/data5/SELLER/Default/2021/1/SB/KG/KM/121668266/new-product-500x500.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6ycswZ28yz8HqC7kF8ex7F3qLW4vuSSBjqv3otUqPxuGfvp_c-1i0FAg6azJKZy3w4KA&usqp=CAU",
    "https://img.freepik.com/premium-photo/3d-model-freeflowing-chaise-lounge-with-blue-cushions_636537-123887.jpg",
    "https://image.made-in-china.com/318f0j00rQqftagIjikb/20230722-28b7c9da8112c14f-420597291887-mp4-264-hd-taobao-mp4.webp",
    "https://images.woodenstreet.de/image/cache/data%2Fdressing-tables%2Fselena-engineered-wood-dressing-table-with-cabinet-and-pull-out-drawers%2Fexotic-teak-frosty-white%2Fupdated%2Fupdated%2Fnew-logo%2F10-750x650.jpg",
    "https://www.ulcdn.net/images/products/920359/product/Fidora_Dressing_Table_With_Stool_-_Color_Mahogany_LP.jpg?1722318898",
    "https://cdn.shopify.com/s/files/1/0096/4594/9013/files/Dressing_Table_Design_Dressing_Table_New_Design_Wardrobe_With_Dressing_Table-14.jpg?v=1651389224"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 14'),
        backgroundColor: Colors.teal,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: imageUrls[index],
            placeholder: (context, url) => const Center(
              child: SpinKitFadingCircle(
                color: Colors.teal,
                size: 50.0,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
