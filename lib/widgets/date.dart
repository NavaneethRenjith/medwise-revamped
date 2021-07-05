import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  const Date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Center(
      child: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('d').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('MMM').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      DateFormat('E').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
