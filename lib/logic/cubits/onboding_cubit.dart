import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_store_app/business/domain/models/slider_model.dart';
import 'package:tut_store_app/logic/cubits/onbording_state.dart';
import 'package:tut_store_app/presentaion/resources/assets_manager.dart';
import 'package:tut_store_app/presentaion/resources/strings_manager.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit()
      : super(
          SliderState(
            sliderObject: getSliderData(),
            numOfSlides: 4,
            currentIndex: 0,
          ),
        );
  void goNext() {
    emit(
      SliderState(
        sliderObject: state.sliderObject,
        numOfSlides: state.numOfSlides,
        currentIndex: state.currentIndex == state.sliderObject.length - 1
            ? 0
            : state.currentIndex++,
      ),
    );
  }

  void goPrevious() {
    emit(
      SliderState(
        sliderObject: state.sliderObject,
        numOfSlides: state.numOfSlides,
        currentIndex: state.currentIndex == 0
            ? state.sliderObject.length - 1
            : state.currentIndex--,
      ),
    );
  }

  void onPageChange(int index) {
    emit(SliderState(
      sliderObject: state.sliderObject,
      numOfSlides: state.numOfSlides,
      currentIndex: index,
    ));
  }
}

List<SliderObject> getSliderData() => [
      const SliderObject(
          title: AppStrings.onBoardingTitle1,
          subTitle: AppStrings.onBoardingSubTitle1,
          image: ImageAssets.onboardingLogo1),
      const SliderObject(
          title: AppStrings.onBoardingTitle2,
          subTitle: AppStrings.onBoardingSubTitle2,
          image: ImageAssets.onboardingLogo2),
      const SliderObject(
          title: AppStrings.onBoardingTitle3,
          subTitle: AppStrings.onBoardingSubTitle3,
          image: ImageAssets.onboardingLogo3),
      const SliderObject(
          title: AppStrings.onBoardingTitle4,
          subTitle: AppStrings.onBoardingSubTitle4,
          image: ImageAssets.onboardingLogo4)
    ];
