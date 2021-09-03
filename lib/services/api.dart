import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/data_model.dart';

class API {
  getData() async {
    final url = Uri.parse(
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=b1d33b492cc211631f6f666280133acf");
    try {
      http.Response response = await http.get(url);
      // print(response.body);
      var data = jsonDecode(response.body) as Map;
      var trackList = data["message"]["body"]["track_list"] as List;
      // print(trackList);
      final List<DataModel> loadedList = [];
      trackList.forEach((value) {
        loadedList.add(DataModel(
          trackId: value["track"]["track_id"],
          trackName: value["track"]["track_name"],
          albumName: value["track"]["album_name"],
          artistName: value["track"]["artist_name"],
          explicit: value["track"]["explicit"],
          rating: value["track"]["track_rating"],
          trackShareUrl: value["track"]["track_share_url"],
        ));
      });
      return loadedList;
    } catch (error) {
      print(error);
      throw error;
    }
  }

 getLyricsData(String? trackID) async {
    final url = Uri.parse(
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackID&apikey=b1d33b492cc211631f6f666280133acf");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body);
      var lyricsData = data["message"]["body"]["lyrics"]["lyrics_body"];
      print("Music Lyrics :"+lyricsData);
      return lyricsData;
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
