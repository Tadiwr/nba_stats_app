import 'package:flutter/material.dart';
import 'package:nba_stats_app/styles/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = '';

  void getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username") ?? "Welcome bro!";
  }

  @override
  void initState() {
    setState(() {
      getUsername();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      getUsername();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome $username!",
          softWrap: true,
          maxLines: 3,
        ),
        centerTitle: true,
        titleTextStyle: h3,
        toolbarHeight: 80,
      ),
      body: ListView(
        
        children: const [
          Center(
            child: Text("Favourite Team!"),

          ),
          
        ],
      )
    );
  }
}