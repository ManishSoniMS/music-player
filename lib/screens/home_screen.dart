import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marquee/marquee.dart';
import '../get_controller/music_track_controller.dart';
import '../screens/player_screen.dart';

class HomeScreen extends StatelessWidget {
  final moviesController = Get.put(MusicTrackController());

  Widget movingText(String text) {
    return Marquee(
      text: text,
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 30.0,
      velocity: 50.0,
      pauseAfterRound: Duration(seconds: 2),
    );
  }

  void storeTrackID(trackId) {
    GetStorage storage = GetStorage();
    storage.write("trackID", trackId);
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Music app",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Obx(
        () => moviesController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
                itemCount: moviesController.musicTracks.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.to(
                      () => TrackDetailsScreen(),
                      arguments: moviesController.musicTracks[index],
                    );
                    storeTrackID(
                        moviesController.musicTracks[index].trackId.toString());
                  },
                  child: Card(
                    child: Container(
                      height: deviceWidth * 0.22,
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth * 0.02,
                          vertical: deviceWidth * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: deviceWidth * 0.15,
                            width: deviceWidth * 0.15,
                            child: Center(
                              child: Icon(Icons.library_music_outlined),
                            ),
                          ),
                          Container(
                            height: deviceWidth * 0.18,
                            width: deviceWidth * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  moviesController.musicTracks[index].trackName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  moviesController.musicTracks[index].albumName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: deviceWidth * 0.06),
                            width: deviceWidth * 0.2,
                            height: deviceWidth * 0.18,
                            child: movingText(
                                moviesController.musicTracks[index].artistName),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
