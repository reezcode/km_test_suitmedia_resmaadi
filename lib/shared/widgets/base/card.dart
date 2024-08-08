import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';

class RsCard extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? radius;
  final Color? color;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final String? imageAsset;
  final String? imageUrl;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final bool? autoSlide;
  final bool? carrousel;
  final List<String>? carrouselImage;
  final List<Widget>? carrouselWidget;
  const RsCard(
      {super.key,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.child,
      this.radius,
      this.color,
      this.boxShadow,
      this.border,
      this.onTap,
      this.imageAsset,
      this.imageUrl,
      this.borderRadius,
      this.carrousel,
      this.carrouselImage,
      this.carrouselWidget,
      this.autoSlide});

  @override
  State<RsCard> createState() => _RsCardState();
}

class _RsCardState extends State<RsCard> {
  PageController controller = PageController();
  int idx = 0;

  @override
  void initState() {
    // TODO: implement initState
    if ((widget.carrousel ?? false) && (widget.autoSlide ?? false)) {
      autoSlide();
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void autoSlide() {
    Future.delayed(const Duration(seconds: 5), () {
      if (idx < widget.carrouselImage!.length - 1) {
        controller.animateToPage(idx + 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
        setState(() {
          idx++;
        });
      } else {
        controller.animateToPage(0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
        setState(() {
          idx = 0;
        });
      }
      autoSlide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutQuad,
            width: widget.width,
            height: widget.height,
            margin: widget.margin,
            padding: widget.padding,
            decoration: BoxDecoration(
                color: widget.color ?? Colors.white,
                borderRadius: widget.borderRadius ??
                    BorderRadius.circular(widget.radius ?? 10),
                image: widget.imageAsset != null || widget.imageUrl != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.imageAsset != null
                            ? AssetImage(widget.imageAsset!)
                            : widget.imageUrl != null
                                ? NetworkImage(widget.imageUrl!)
                                : AssetImage(
                                    'assets/images/img_placeholder.png'))
                    : null,
                border: widget.border,
                boxShadow: widget.boxShadow),
            child: widget.carrousel ?? false
                ? Stack(alignment: Alignment.bottomCenter, children: [
                    PageView.builder(
                      itemCount: widget.carrouselImage!.length,
                      controller: controller,
                      onPageChanged: (value) {
                        setState(() {
                          idx = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          width: widget.width,
                          height: widget.height,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(widget.radius ?? 10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      widget.carrouselImage![index]))),
                          child: Container(
                            padding: EdgeInsets.all(16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.carrouselWidget != null)
                                  widget.carrouselWidget![index],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      child: Row(
                        children: [
                          for (int i = 0;
                              i < widget.carrouselImage!.length;
                              i++)
                            Container(
                              margin: EdgeInsets.all(2.w),
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                  color: i == idx
                                      ? context.colorScheme.primary
                                      : Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle),
                            )
                        ],
                      ),
                    )
                  ])
                : widget.child));
  }
}
