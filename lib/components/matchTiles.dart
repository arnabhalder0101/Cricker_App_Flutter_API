import 'package:cricker_app/models/match_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchTiles extends StatelessWidget {
  MatchInfo matchDetails;
  MatchTiles({
    super.key,
    required this.matchDetails,
  });
  @override
  Widget build(BuildContext context) {
    // watch --
    var theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: theme.primary,
        title: Text(
          matchDetails.team_a_name + " VS " + matchDetails.team_b_name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // images --
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: theme.tertiary,
              ),
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // used in cases where images are retrived from - Network --
                  FadeInImage(
                    width: 110,
                    height: 120,
                    placeholder: AssetImage(r'lib\assets\cricket_loading.png'),
                    image: NetworkImage(matchDetails.team_a_image),
                  ),
                  SizedBox(width: 10),
                  Text("Vs"),
                  SizedBox(width: 10),
                  FadeInImage(
                    width: 110,
                    height: 120,
                    placeholder: AssetImage(r'lib\assets\cricket_loading.png'),
                    image: NetworkImage(matchDetails.team_b_image),
                  ),
                  // Image.network(matchDetails.team_b_image),
                ],
              ),
            ),

            // details -
            Text(
                matchDetails.team_a_short + " vs " + matchDetails.team_b_short),

            Text("Date: " + matchDetails.match_date),
            Text("Time: " + matchDetails.match_time),
            Text("Venue: " + matchDetails.venue),
            Text("Status: " + matchDetails.match_status),
            Text("Match Type: " + matchDetails.match_type),
            Text("Series: " + matchDetails.series),
            Text("Series Type: " + matchDetails.series_type),
          ],
        ),
      ),
    );
  }
}
