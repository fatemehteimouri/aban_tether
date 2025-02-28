import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  const CustomImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(backgroundImage: imageProvider,),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
