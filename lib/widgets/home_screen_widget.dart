import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key? key,
    required this.heading,
    required this.desc,
    required this.imageLoc,
    required this.containerColor,
  }) : super(key: key);

  final String heading;
  final String desc;
  final String imageLoc;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageLoc),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  heading,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  desc,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
