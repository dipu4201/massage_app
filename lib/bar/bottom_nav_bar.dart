import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/UserProfileProvider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(
          icon: Consumer<UserProfileProvider>(
            builder: (context, userProfileProvider, child) {
              final userProfile = userProfileProvider.userProfile;
              return CircleAvatar(
                radius: 14,
                backgroundImage: userProfile != null
                    ? FileImage(File(userProfile.photoUrl))
                    : AssetImage("assets/images/user_2.png") as ImageProvider,
              );
            },
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
