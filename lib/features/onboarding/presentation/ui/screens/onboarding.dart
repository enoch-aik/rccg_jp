import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rccg_jp/core/service_exceptions/src/api_exceptions.dart';
import 'package:rccg_jp/features/onboarding/presentation/ui/custom_clipper/curve_clipper.dart';
import 'package:rccg_jp/features/onboarding/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/res/assets/svg/svg.dart';

@RoutePage(name: 'onboarding')
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    //if current user is already signed in, navigate to home screen
    bool isSignedIn = ref.read(currentUserProvider) != null;
    print(isSignedIn);
    if (isSignedIn) {
      AppNavigator.of(context).replace(const Home());
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      const Color(0xff180c62).withOpacity(0.7),
                      const Color(0xff180c62),
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
            const ColSpacing(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                      width: double.maxFinite,
                      child: OutlinedButton(
                          onPressed: () async {
                            Loader.show(context);
                            final result = await ref
                                .read(onboardingRepoProvider)
                                .signInWithGoogle();

                            if (context.mounted) {
                              Loader.hide(context);
                            }
                            result.when(success: (data) {
                              AppNavigator.of(context).replace(const Home());
                            }, apiFailure: (e, _) {
                              Toast.error(e.message, context);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(googleLogo),
                              const RowSpacing(8),
                              const KText('Sign in with Google', fontSize: 15),
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
