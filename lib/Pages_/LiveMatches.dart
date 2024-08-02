import 'dart:convert';

import 'package:cricker_app/models/player_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LiveMatches extends StatelessWidget {
  LiveMatches({super.key});
  List<PlayerInfo> allplayers = [];

  Future getLiveMatches() async {
    String api_host = "cricket-live-line1.p.rapidapi.com";
    String api_key = "5e595fcbecmsha2cff63986a4013p1d42ccjsn3ea4adf348ad";

    List<PlayerInfo> player = [];

    var response =
        await http.get(Uri.https(api_host, "/series/336/squads"), headers: {
      'x-rapidapi-key': api_key,
      'x-rapidapi-host': api_host,
    });
    var store_response = jsonDecode(response.body)['data'];
    int num = 0;
    for (var i in store_response[num]) {
      for (var j in i['player']) {
        int access_each_player = 0;
        for (var k in j[access_each_player]) {
          PlayerInfo p = PlayerInfo(
            image: k['image'],
            player_name: k['name'],
            role: k['play_role'],
            team_name: i['team']['name'],
          );
          player.add(p);
          access_each_player++;
        }
      }
      num++;
    }

    allplayers.clear();
    allplayers = player;

    print(store_response);
    print(store_response[0]['player']);
    print(store_response[0]['player'][0]['name']);
    print(store_response[0]['team']['name']);
    // print(store_response);
  }

  @override
  Widget build(BuildContext context) {
    // getLiveMatches();
    return Scaffold();
  }
}
