import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteServices {
  // http - Make http requests (Future-based)
  // Client() - Persistent connection for multiple requests
  static var client = http.Client();

  // Champions JSON URL
  static const championsJSONUrl =
      'http://ddragon.leagueoflegends.com/cdn/11.4.1/data/en_US/champion.json';

  // Champion Splash Image URL
  static const championLoadingImageDirectory =
      'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/';

  // Fetches lists of available champions
  static Future<List<dynamic>> fetchChampions() async {
    var response = await client.get(championsJSONUrl);

    // HTTP 200 OK
    if (response.statusCode == 200) {
      // Parse Response
      var jsonString = response.body;
      // JSON based on Response API
      Map<String, dynamic> jsonData = jsonDecode(jsonString);
      // JSON['data'] - Contains the actual data needed by application.
      // Unnecessary data includes type, format, and version. Only want data.
      Map<String, dynamic> data = jsonData['data'];
      // JSON formatted to be 'CHAMPION_NAME' : { INFO }
      // List<dynamic> -> List of { INFO }
      // dynamic -> Map<String, dynamic>
      return data.values.toList();
    }
    // Return null indicates that something other than HTTP 200 OK returned
    else {
      return null;
    }
  }

  // Fetches URL for champion's splash image
  String fetchChampionLoadingImageURL(String name) {
    return '${championLoadingImageDirectory + name}_0.jpg';
  }
}
