import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rccg_jp/features/onboarding/presentation/ui/custom_clipper/curve_clipper.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/res/assets/svg/svg.dart';
import 'package:rccg_jp/src/widgets/margin.dart';
import 'package:rccg_jp/src/widgets/text.dart';

@RoutePage(name: 'onboarding')
class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipPath(
              clipper: CurveImage(),
              child: Container(
                width: double.maxFinite,
                height: 600,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff180c62).withOpacity(0.7),
                      Color(0xff180c62),
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      rccgLogo,
                      height: 340,
                    ),
                    const ColSpacing(32),
                    KText(
                      'Welcome to RCCG Jesus Partner',
                      color: context.onPrimary,
                    ).animate(
                      onPlay: (controller) => controller.repeat(),
                      effects: [
                        ShimmerEffect(
                            color: context.secondary,
                            duration: const Duration(seconds: 3))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ColSpacing(40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                      width: double.maxFinite,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(googleLogo),
                              RowSpacing(8),
                              KText('Sign in with Google', fontSize: 15.sp),
                            ],
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
