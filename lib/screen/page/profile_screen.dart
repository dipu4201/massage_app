import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/UserProfileProvider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileProvider>(context).userProfile;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: userProfile != null
              ? Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(File(userProfile.photoUrl)),
              ),
              SizedBox(height: 20),
              Text(
                userProfile.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                userProfile.email,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                userProfile.phoneNumber,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          )
              : Center(child: Text("No profile information available")),
        ),
      ),
    );
  }
}
