import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hub_app/features/home/presentation/widgets/banner_button.dart';
import 'package:gap/gap.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: width * .5,
                child: SvgPicture.asset(
                  Assets.imagesPageViewItem2Image,
                ),
              ),
              Container(
                width: width * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: svg.Svg(
                      Assets.imagesFeaturedItemBackground,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Gap(25),
                    Opacity(
                      opacity: 0.80,
                      child: Text(
                        'عروض العيد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          height: 1.60,
                        ),
                      ),
                    ),
                    Spacer(),

                    Text(
                      'خصم 25%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 35),
                      child: BannerButton(),
                    ),
                    Gap(29),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
