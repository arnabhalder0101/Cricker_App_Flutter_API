import 'package:cricker_app/models/player_info.dart';
import 'package:flutter/material.dart';

class PlayerTile extends StatelessWidget {
  PlayerInfo players;
  PlayerTile({super.key, required this.players});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: theme.primary,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FadeInImage(
            // width: double.infinity,
            // height: double.infinity,
            image: NetworkImage(players.image),
            placeholder: AssetImage(r'lib\assets\cricket_loading.png'),
          ),
        ),
        subtitle: Column(
          children: [
            Text(
              players.player_name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: theme.inversePrimary,
              ),
            ),
            Text(
              players.role,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.inversePrimary,
              ),
            ),
            Text(
              players.team_name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
