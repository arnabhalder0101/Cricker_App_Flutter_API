import 'dart:io';
import 'package:cricker_app/themes/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});

  void launchEmail() async {
    final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'harnab308@gmail.com',
        queryParameters: {'subject': 'Cricket App Review'});

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('About'),
        titleTextStyle: TextStyle(
          color: theme.inversePrimary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
        actions: [
          // Text("Theme", style: TextStyle(fontSize: 18),),
          GestureDetector(
            onTap: () {
              context.read<ThemeDataProvider>().toggleTheme();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.dark_mode_rounded),
            ),
          ),
        ],
        backgroundColor: theme.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              tileColor: theme.primary,
              title: Text(
                "About us:",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  "I'm Arnab Halder, Passionate for Android Developement in Flutter, aggressively Learning new Concepts, building different kinds of Projects to learn more, coloborating with other developers to explore more."),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: theme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: Text(
                "About This Project:",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "This is a Project to showcase my interest in cricket and Interest in Creating something that as a cricket fan i can use personally.\nI tried my best to make it look good. Did you like this app? \nLet me know",
                  ),
                  Text(
                    "harnab308@gmail.com",
                    style: TextStyle(color: Colors.blue),
                  ),

                  // GestureDetector(
                  //   onTap: launchEmail,
                  //   child: Text(
                  //     "harnab308@gmail.com",
                  //     style: TextStyle(color: Colors.blue),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
