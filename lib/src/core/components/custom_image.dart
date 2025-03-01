import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedSvgImage extends StatefulWidget {
  final String? imageUrl;
  final double size;

  const CachedSvgImage({super.key, required this.imageUrl, this.size = 50});

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
      final file = await cacheManager.getSingleFile(widget.imageUrl ?? "");
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
    if (widget.imageUrl == null || widget.imageUrl == "") {
      return SizedBox(
        height: widget.size,
        width: widget.size,
        child: const Icon(Icons.photo),
      );
    }
    if (cachedFile != null) {
      return SvgPicture.file(
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        height: widget.size,
        width: widget.size,
        cachedFile!,
        placeholderBuilder: (context) => const CircularProgressIndicator(),
      );
    } else {
      return SvgPicture.network(
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        widget.imageUrl!,
        height: widget.size,
        width: widget.size,
        placeholderBuilder: (context) => const CircularProgressIndicator(),
      );
    }
  }
}
