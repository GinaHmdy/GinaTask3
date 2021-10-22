// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gina Hamdy",
      theme: ThemeData(
        //appBarTheme: AppBarTheme(color: Colors.teal),
        primaryColor: Colors.purple,
      ),
      home: Home(),
      //debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.brown,
                backgroundImage: AssetImage("assets/images/gi.jpg"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                //padding: const EdgeInsets.only(top: 10.0, right: 20),
                child: Text(
                  "Gina Hamdy",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ContactCard(
                contactText: '+201117665503',
                ontap: () {
                  _launchURL("tel:+201117665503");
                },
                iconData: Icons.phone,
              ),
              ContactCard(
                contactText: 'ginahmdy@gmail.com',
                ontap: () {
                  _launchURL(
                      'mailto:ginahmdy@gmail.com?subject=News&body=New%20plugin');
                },
                iconData: Icons.email_outlined,
              ),
              ContactCard(
                contactText: 'Gina Hamdyy',
                ontap: () {
                  _launchURL("https://www.facebook.com/gina.hamdyy/");
                },
                iconData: EvaIcons.facebook,
              ),
              ContactCard(
                contactText: 'GinaHmdy',
                ontap: () {
                  _launchURL("https://github.com/GinaHmdy");
                },
                iconData: EvaIcons.github,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String contactText;
  final Function ontap;
  final IconData iconData;

  const ContactCard({
    required this.contactText,
    required this.iconData,
    required this.ontap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          ontap();
        },
        child: Card(
          elevation: 5,
          color: Colors.blueGrey,
          child: ListTile(
            leading: Icon(
              iconData,
              color: Colors.black,
              size: 30,
            ),
            title: Text(
              contactText,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ));
  }
}
