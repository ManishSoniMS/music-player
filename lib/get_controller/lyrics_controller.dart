import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:music_player/services/api.dart';

class LyricsController extends GetxController {
  var lyrics = "".obs;
  var isLoading = true.obs;
  var trackId = "".obs;

  @override
  void onInit() {
    super.onInit();
    getTrackID();
    fetchData();
  }

  getTrackID() {
    GetStorage storage = GetStorage();
    trackId.value = storage.read("trackID");
  }

  fetchData() async {
    isLoading(true);
    try {
      var getLyrics = await API().getLyricsData(trackId.value);
      if (getLyrics.isNotEmpty) {
        lyrics.value = getLyrics;
      }
    } catch (e) {
      throw e;
    } finally {
      isLoading(false);
    }
  }
}
