import 'package:flutter/material.dart';
import 'package:transitspot/utils/app_color.dart';

class UserCard extends StatelessWidget {
  final String img;
  final String uname;
  final String role;

  const UserCard(
      {Key? key, required this.uname, required this.role, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/assets/home/card-bg.png'), // must constant image path
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(img),
              radius: 30.0,
            ),
            title: Text(
              uname,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.content,
              ),
            ),
            subtitle: Text(
              role,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
