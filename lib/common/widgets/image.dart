import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_ducafecat/common/index.dart';

class ImageWidget extends StatelessWidget {
  final String? url;
  final ImageProvider? image;
  final double? radius;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;

  const ImageWidget({
    Key? key,
    this.url,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.image,
  }) : super(key: key);

  const ImageWidget.url(
    this.url, {
    Key? key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.image,
  }) : super(key: key);

  const ImageWidget.asset(
    this.image, {
    Key? key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.url,
  }) : super(key: key);

  Widget get _placeholder =>
      placeholder ??
      IconWidget.image(
        'assets/images/default.png',
        size: 36,
      );

  Widget get _error => IconWidget.icon(
        Icons.info_outline,
        color: AppColors.surfaceVariant,
      );

  @override
  Widget build(BuildContext context) {
    return url != null
        ? CachedNetworkImage(
            width: width,
            height: height,
            imageUrl: url!,
            placeholder: (context, url) => _placeholder,
            fit: fit,
            errorWidget: (context, url, error) => _error,
            // color: backgroundColor ?? AppColors.primary,
          ).borderRadius(all: radius)
        : image != null
            ? FadeInImage(
                image: image!,
                width: width,
                height: height,
                fit: fit,
                placeholder: const AssetImage('assets/images/default.png'),
                placeholderErrorBuilder: (_, __, ___) => _placeholder,
                imageErrorBuilder: (_, __, ___) => _error,
              ).decorated(
                borderRadius: radius != null
                    ? BorderRadius.all(
                        Radius.circular(radius ?? AppRadius.card))
                    : null,
              )
            : _error;
  }
}
