import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LazyCachedImage extends StatelessWidget {
  const LazyCachedImage({super.key, required this.imageUrl, this.height, this.width, this.fit});

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
