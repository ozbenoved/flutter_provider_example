import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/state_management.dart';

class ImageContainer extends StatefulWidget {
  const ImageContainer({super.key});

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  Timer? timer;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void startImageTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      String eventToEmit;
      if (t.tick % 3 == 0) {
        eventToEmit = lisaImage;
      } else if (t.tick % 2 == 0) {
        eventToEmit = octopusImage;
      } else {
        eventToEmit = pinkPanther;
      }
      context.read<ThemeProvider>().toggleTheme(eventToEmit == octopusImage);
      context.read<ImagesProvider>().updateImage(eventToEmit);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPlaying = context.watch<ImagesPlayerProvider>().isPlaying;
    isPlaying ? startImageTimer() : timer?.cancel();
    return Consumer<ImagesProvider>(
      builder: (context, provider, widget) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CachedNetworkImage(
                useOldImageOnUrlChange: true,
                cacheKey: provider.currentImage,
                imageUrl: provider.currentImage,
                fit: BoxFit.scaleDown,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  "${timer?.tick ?? 0}",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: provider.currentImage == octopusImage
                          ? context.read<ThemeProvider>().theme.colorScheme.primary
                          : context.read<ThemeProvider>().theme.colorScheme.error),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
