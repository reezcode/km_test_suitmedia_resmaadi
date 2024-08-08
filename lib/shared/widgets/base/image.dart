import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RsImageButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String image;
  final Function() onTap;
  const RsImageButton(
      {super.key,
      this.width,
      this.height,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class RsImgCircle extends StatelessWidget {
  final double? width;
  final double? height;
  final String? image;
  const RsImgCircle({
    super.key,
    this.width,
    this.height,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 30.w,
      height: height ?? 30.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.w),
          image: DecorationImage(
              image: NetworkImage(image ?? 'https://via.placeholder.com/150'),
              fit: BoxFit.cover)),
    );
  }
}
