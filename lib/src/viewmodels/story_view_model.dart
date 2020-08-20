import 'package:flutter_shopee_clone_ui/src/models/story_model.dart';

class StoryViewModel {
  List<StoryModel> getStories() {
    return [
      StoryModel(
        image: "https://image.flaticon.com/icons/svg/174/174883.svg",
        title: "youtube",
      ),
      StoryModel(
        image: "https://image.flaticon.com/icons/svg/2111/2111463.svg",
        title: "instagram",
      ),
      StoryModel(
        image: "https://image.flaticon.com/icons/svg/174/174848.svg",
        title: "twitter",
      ),
      StoryModel(
        image: "https://image.flaticon.com/icons/svg/733/733579.svg",
        title: "facebook",
      ),
      StoryModel(
        image: "https://image.flaticon.com/icons/svg/281/281764.svg",
        title: "google",
      ),
    ];
  }
}
