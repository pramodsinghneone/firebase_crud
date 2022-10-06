import 'package:flutter/material.dart';

import '../../widgets/dotted_line_view.dart';

class UserProfileView extends StatefulWidget {
  UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 135, 66, 226),
              ),
              child: Column(
                children: [
                  Text(
                    'user@gmail.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  heightSizedBox(30),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/seed/picsum/200/300',
                      ),
                    ),
                  ),
                  heightSizedBox(30),
                  Text(
                    'John Dev',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  heightSizedBox(30),
                ],
              ),
            ),
          ),
          heightSizedBox(20),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: dottedLine(),
          ),
          commonRow(),
        ],
      ),
    );
  }

  Widget commonRow() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 108, 54, 244),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            rowItems('Name', 'John Dev'),
            rowItems('Email', 'dev@gmail.com'),
            rowItems('UserID', '111'),
            rowItems('Name', 'John Dev'),
            rowItems('Email', 'dev@gmail.com'),
            rowItems('UserID', '111'),
            rowItems('Name', 'John Dev'),
            rowItems('Email', 'dev@gmail.com'),
            rowItems('UserID', '111'),
          ],
        ),
      ),
    );
  }

  Padding rowItems(String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          widthSizedBox(10),
          Text(
            ':',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          widthSizedBox(10),
          Text(
            subTitle,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

SizedBox heightSizedBox(double height) {
  return SizedBox(height: height);
}

SizedBox widthSizedBox(double width) {
  return SizedBox(width: width);
}
