import 'dart:convert';

import 'package:cricker_app/Pages_/LiveMatches.dart';
import 'package:cricker_app/Pages_/UpcomingMatches.dart';
import 'package:cricker_app/Pages_/settings_page.dart';
import 'package:cricker_app/components/matchTiles.dart';
import 'package:cricker_app/components/nav_bar.dart';
import 'package:cricker_app/models/match_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../themes/themeProvider.dart';
import 'myDrawer.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> allPages = [
    UpcomingMatches(),
    LiveMatches(),
    SettingsPage(),

  ];

  List<Text> appbar_titles = [
    Text("U P C O M I N G S"),
    Text("L I V E"),
    Text("S E T T I N G S"),
    
  ];

  int selected_index = 0;

  void onTabChange(int index) {
    setState(() {
      print(selected_index.toString() + " -> " + index.toString());
      selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // watch --
    var theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: appbar_titles[selected_index],
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: theme.inversePrimary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: theme.secondary,
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
      ),
      drawer: AppDrawer(),
      body: allPages[selected_index],
      bottomNavigationBar: MyNavBar(
        currentIndex: selected_index,
        onTap: (index) => onTabChange(index),
      ),
    );
  }
}
