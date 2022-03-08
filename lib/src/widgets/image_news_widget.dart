import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNewsWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const ImageNewsWidget(
      {Key? key, required this.imageUrl, this.height = 50, this.width = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        alignment: Alignment.center,
        fit: BoxFit.fill,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
