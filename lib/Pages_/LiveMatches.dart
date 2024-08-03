import 'dart:convert';

import 'package:cricker_app/models/player_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/player_tile.dart';

class LiveMatches extends StatelessWidget {
  LiveMatches({super.key});
  List<PlayerInfo> allplayers = [];

  Future getLiveMatches() async {
    String api_host = "cricket-live-line1.p.rapidapi.com";
    String api_key = "API_KEY";

    List<PlayerInfo> player = [];

    var response =
        await http.get(Uri.https(api_host, "/series/336/squads"), headers: {
      'x-rapidapi-key': api_key,
      'x-rapidapi-host': api_host,
    });
    var store_response = jsonDecode(response.body)['data'];

    for (var i in store_response) {
      for (var j in i['player']) {
        // for (var k in j) {
        PlayerInfo p = PlayerInfo(
          image: j['image'],
          player_name: j['name'],
          role: j['play_role'],
          team_name: i['team']['name'],
        );
        player.add(p);

        // }
      }
    }

    allplayers.clear();
    allplayers = player;

    // print(store_response);
    // print(store_response[0]['player']);
    // print(store_response[0]['player'][0]['name']);
    // print(store_response[0]['team']['name']);
    // print(store_response);
  }

  @override
  Widget build(BuildContext context) {
    // getLiveMatches();
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 12),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getLiveMatches(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: ListView.builder(
                      itemCount: allplayers.length,
                      itemBuilder: (context, index) {
                        PlayerInfo individual_player = allplayers[index];
                        return PlayerTile(players: individual_player);
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Some Error Occured!"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
