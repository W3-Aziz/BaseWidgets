import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageUtil {
  static CachedNetworkImage loadImage({
    required String url,
    width = 0.0,
    height = 0.0,
    radius = 5.0,
  }) {
    if (width == 0.0 && height == 0.0) {
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => const CupertinoActivityIndicator(),
        errorWidget: (context, url, error) => const Icon(
          Icons.photo,
          size: 100,
          color: Colors.amber,
        ),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,

              ///Change fit value to set image properly.
            ),
          ),
        ),
        placeholder: (context, url) => const CupertinoActivityIndicator(),

        /// Set your error place holder image here
        errorWidget: (context, url, error) => const Icon(
          Icons.photo,
          size: 100,
          color: Colors.amber,
        ),
      );
    }
  }

  static CircleAvatar showAvatar({
    String? assetImg,
    String? netImg,
    Color bgColor = Colors.transparent,
    Color forGround = Colors.black,
    double radius = 50.0,
    Widget? child,
  }) {
    if (assetImg != null) {
      return CircleAvatar(
        backgroundImage: AssetImage(assetImg),
        backgroundColor: Colors.transparent,
        radius: radius,
        child: child,
      );
    } else if (netImg != null) {
      return CircleAvatar(
        backgroundImage: NetworkImage(netImg),
        backgroundColor: bgColor,
        radius: radius,
        child: child,
      );
    } else {
      return CircleAvatar(
        backgroundColor: bgColor,
        foregroundColor: forGround, /// Child color
        child: child,
        radius: radius,
      );
    }
  }
}

/*extension NetImage on CachedNetworkImage {
  showImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => const Icon(
        Icons.photo,
        size: 100,
        color: Colors.amber,
      ),
    );
  }
}*/
