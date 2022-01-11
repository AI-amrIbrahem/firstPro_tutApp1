import 'package:firstapp_fiftychanllenge/resourses/app_assets.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_strings.dart';

class SliderModel{
  String title,subTitle,image;

  SliderModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  static final List<SliderModel> sliderList = [
    SliderModel(title: AppStrings.noBoardingTitle1, subTitle: AppStrings.noBoardingTSubitle1, image: AppImageAssets.onBoardingLogo1),
    SliderModel(title: AppStrings.noBoardingTitle2, subTitle: AppStrings.noBoardingTSubitle2, image: AppImageAssets.onBoardingLogo2),
    SliderModel(title: AppStrings.noBoardingTitle3, subTitle: AppStrings.noBoardingTSubitle3, image: AppImageAssets.onBoardingLogo3),
    SliderModel(title: AppStrings.noBoardingTitle4, subTitle: AppStrings.noBoardingTSubitle4, image: AppImageAssets.onBoardingLogo4),
  ];


}