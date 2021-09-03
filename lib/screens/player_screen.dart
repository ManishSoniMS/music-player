import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../get_controller/lyrics_controller.dart';

class TrackDetailsScreen extends StatelessWidget {
  final data = Get.arguments;
  final lyricsController = Get.put(LyricsController());

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Track Details",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(deviceWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText("Name"),
              SubTitleText(data.trackName),
              TitleText("Artist"),
              SubTitleText(data.albumName),
              TitleText("Album Name"),
              SubTitleText(data.artistName),
              TitleText("Explicit"),
              SubTitleText(data.explicit == 1 ? "True" : "False"),
              TitleText("Rating"),
              SubTitleText(data.rating.toString()),
              Obx(
                () => lyricsController.isLoading.value
                    ? Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text("Loading lyrics...")
                          ],
                        ),
                      )
                    : SubTitleText(lyricsController.lyrics.value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          text,
          textScaleFactor: 1,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: deviceWidth * 0.02),
      ],
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  SubTitleText(this.text);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          text,
          textScaleFactor: 0.9,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: deviceWidth * 0.04),
      ],
    );
  }
}
