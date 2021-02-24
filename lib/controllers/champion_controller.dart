import 'package:get/get.dart';
import 'package:league_of_legends/network/remote_service.dart';

// Controller
// Contains functionality for Champion Data
class ChampionController extends GetxController {
  var championList = List<dynamic>().obs;

  // Initialization
  @override
  void onInit() {
    super.onInit();
    // Fetch List of Champions
    fetchChampionList();
  }

  // Fetches lists of available champions
  void fetchChampionList() async {
    var champions = await RemoteServices.fetchChampions();
    // If the response
    if (champions != null) {
      championList.assignAll(champions);
    }
  }

  // TODO: Fetch champion's JSON
  void fetchChampionJSON(String name) async {}

  // Fetches champion's splash image URL
  String fetchChampionLoadingImageURL(String name) {
    return RemoteServices().fetchChampionLoadingImageURL(name);
  }
}
