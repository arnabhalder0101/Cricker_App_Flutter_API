import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(top: 23, left: 15, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // header - logo -
                Image.asset(
                  r'lib\assets\cricket_loading.png',
                  width: 130,
                  height: 130,
                ),

                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () => Navigator.pop(context),
                  leading: Icon(Icons.home),
                  title: Text('H O M E'),
                ),
                // abous us --
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/about');
                  },
                  leading: Icon(Icons.info_outline_rounded),
                  title: Text("A B O U T  U S"),
                ),
              ],
            ),

            // exit button --
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Want to Exit?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          SystemNavigator.pop();
                        },
                        child: Text(
                          "Sure",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ),
                    ],
                  ),
                );
              },
              leading: Icon(Icons.exit_to_app_rounded),
              title: Text('E X I T  A P P'),
            ),
          ],
        ),
      ),
    );
  }
}
