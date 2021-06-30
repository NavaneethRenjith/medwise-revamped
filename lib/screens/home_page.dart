import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/theme.dart';
import './task_screen.dart';
import './connect_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medwise',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: blue,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_sharp,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              left: 16,
            ),
            child: Text(
              'Hello,',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(67, 67, 67, 1),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 50,
              bottom: MediaQuery.of(context).size.height * (1 / 30),
            ),
            child: Text(
              'Jacob!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              //height: MediaQuery.of(context).size.height / 3,
              child: SvgPicture.asset(
                'assets/images/doctor_image.svg',
                alignment: Alignment.centerRight,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * (1 / 20),
              left: 16,
            ),
            child: Text(
              'How can I help you?',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: MediaQuery.of(context).size.width * (1 / 10),
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 2.2, // ( width/height)
              children: [
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        ConnectScreen.routeName,
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text('Connect'),
                    style: ElevatedButton.styleFrom(
                      primary: green,
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        TaskScreen.routeName,
                      );
                    },
                    icon: Icon(Icons.alarm),
                    label: Text('Task'),
                    style: ElevatedButton.styleFrom(
                      primary: blue,
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.book),
                    label: Text('History'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: orange,
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.leaderboard),
                    label: Text('Analysis'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: purple,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
