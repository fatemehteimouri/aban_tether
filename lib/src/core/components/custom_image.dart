import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedSvgImage extends StatefulWidget {
  final String imageUrl;

  const CachedSvgImage({super.key, required this.imageUrl});

  @override
  _CachedSvgImageState createState() => _CachedSvgImageState();
}

class _CachedSvgImageState extends State<CachedSvgImage> {
  final BaseCacheManager cacheManager = DefaultCacheManager();
  File? cachedFile;

  @override
  void initState() {
    super.initState();
    _loadCachedSvg();
  }

  Future<void> _loadCachedSvg() async {
    try {
      final file = await cacheManager.getSingleFile(widget.imageUrl);
      if (mounted) {
        setState(() {
          cachedFile = file;
        });
      }
    } catch (e) {
      debugPrint('Error loading cached SVG: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cachedFile != null) {
      return SvgPicture.file(
        cachedFile!,
        placeholderBuilder: (context) => const CircularProgressIndicator(),
      );
    } else {
      return SvgPicture.network(
        widget.imageUrl,
        placeholderBuilder: (context) => const CircularProgressIndicator(),
      );
    }
  }
}
