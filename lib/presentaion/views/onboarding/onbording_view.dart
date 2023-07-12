import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tut_store_app/business/domain/models/slider_model.dart';
import 'package:tut_store_app/logic/cubits/onboding_cubit.dart';
import 'package:tut_store_app/logic/cubits/onbording_state.dart';
import 'package:tut_store_app/presentaion/resources/assets_manager.dart';
import 'package:tut_store_app/presentaion/resources/color_manager.dart';
import 'package:tut_store_app/presentaion/resources/route_manager.dart';
import 'package:tut_store_app/presentaion/resources/strings_manager.dart';
import 'package:tut_store_app/presentaion/resources/value_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // final sliderState = context.watch<SliderCubit>().state;
    return BlocProvider(
      create: (_) => SliderCubit(),
      child: Scaffold(body: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, sliderState) {
          return _getContentWidget(sliderState, context);
        },
      )),
    );
  }

  Widget _getContentWidget(
    SliderState? sliderState,
    BuildContext context,
  ) {
    if (sliderState == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderState.numOfSlides,
            onPageChanged: (index) {
              context.read<SliderCubit>().onPageChange(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(sliderState.sliderObject[index]);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                    },
                    child: Text(
                      AppStrings.skip,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.end,
                    ),
                  )),
              // add layout for indicator and arrows
              _getBottomSheetWidget(
                sliderState,
                context,
              )
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderState sliderState, BuildContext context) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                context.read<SliderCubit>().goPrevious();
                _pageController.animateToPage(sliderState.currentIndex,
                    duration:
                        const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),

          // circles indicator
          Row(
            children: [
              for (int i = 0; i < sliderState.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, sliderState.currentIndex),
                )
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightarrowIc),
              ),
              onTap: () {
                // go to next slide
                context.read<SliderCubit>().goNext();
                _pageController.animateToPage(sliderState.currentIndex,
                    duration:
                        const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc); // selected slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc); // unselected slider
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
        // image widget
      ],
    );
  }
}
