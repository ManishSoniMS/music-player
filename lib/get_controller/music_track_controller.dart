import 'package:get/state_manager.dart';
import 'package:music_player/services/api.dart';
import '../model/data_model.dart';

class MusicTrackController extends GetxController {
  var musicTracks = <DataModel>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    isLoading(true);
    try {
      var musics = await API().getData();
      if (musics.isNotEmpty) {
        musicTracks.value = musics;
      }
    } catch (e) {
      throw e;
    } finally {
      isLoading(false);
    }
  }
}
