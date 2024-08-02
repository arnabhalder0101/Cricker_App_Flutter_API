import 'dart:convert';
import 'package:cricker_app/components/matchTiles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/match_info.dart';

class UpcomingMatches extends StatelessWidget {
  UpcomingMatches({super.key});

  List<MatchInfo> allMatches = [];

  Future getUpcomingMatches() async {
    String api_host = "cricket-live-line1.p.rapidapi.com";
    String api_key = "5e595fcbecmsha2cff63986a4013p1d42ccjsn3ea4adf348ad";
    List<MatchInfo> temp_list = [];
    var response =
        await http.get(Uri.https(api_host, "/upcomingMatches"), headers: {
      'x-rapidapi-key': api_key,
      'x-rapidapi-host': api_host,
    });
    var store_response = jsonDecode(response.body)['data'];

    for (var i in store_response) {
      MatchInfo match_data = MatchInfo(
        team_a_name: i["team_a"],
        team_b_name: i['team_b'],
        team_a_short: i['team_a_short'],
        team_b_short: i['team_b_short'],
        team_a_image: i["team_a_img"],
        team_b_image: i['team_b_img'],
        match_date: i['date_wise'],
        match_status: i['match_status'],
        match_type: i['match_type'],
        series: i['series'],
        venue: i['venue'],
        match_time: i['match_time'],
        series_type: i['series_type'],
      );
      temp_list.add(match_data);
    }
    // clear all pre exixting vlues --
    allMatches.clear();
    allMatches = temp_list;

    //print(store_response['data'][0]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUpcomingMatches(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Something Went Wrong!' +
                        '\n' +
                        snapshot.error.toString()),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: ListView.builder(
                      itemCount: allMatches.length,
                      itemBuilder: (context, index) {
                        MatchInfo individual_teams = allMatches[index];
                        return MatchTiles(
                          matchDetails: individual_teams,
                        );
                      },
                    ),
                  );
                } else {
                  return Center();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
