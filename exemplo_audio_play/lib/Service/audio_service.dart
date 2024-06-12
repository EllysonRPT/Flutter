import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/audio_model.dart';

class AudioService {
  List<AudioModel> _list = [];
  List<AudioModel> get list => _list;

//url
  String url = 'http://10.109.204.27:3000/audios';

  //fetch
  Future<void> fetchAudio() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // _list = json
      //     .decode(response.body)
      //     .map((e) => AudioModel.fromMap(e))
      //     .toList();
      _list.clear();
      final List<dynamic> data = json.decode(response.body);
      _list = data.map((e) => AudioModel.fromMap(e)).toList();
    }
  }
}
