import 'dart:developer';

import 'package:design_patterns/design_patterns/adapter_pattern/models/user.dart';
import 'package:design_patterns/design_patterns/adapter_pattern/apis/user_api.dart';
import 'package:flutter/material.dart';

class AdapterPatternHomeScreen extends StatelessWidget {
  const AdapterPatternHomeScreen({super.key});
  static final _myUserApi = MyUserApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: _myUserApi.getUsers().length,
          itemBuilder: (context, index) {
            final user = _myUserApi.getUsers()[index];
            return userCard(user);
          },
        ),
      ),
    );
  }

  Widget userCard(User user) {
    log('$user');
    return Builder(builder: (context) {
      final width = MediaQuery.of(context).size.width;
      return Container(
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: width / 3, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.asset(
              user.imageUrl,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  user.name,
                ),
                Column(
                  children: [
                    const Text('contact : '),
                    Visibility(
                      visible: user.phoneNumber != null,
                      child: Text(
                        user.phoneNumber ?? '',
                      ),
                    ),
                    Visibility(
                      visible: user.email != null,
                      child: Text(
                        user.email ?? '',
                      ),
                    ),
                  ],
                )
              ],
            ),
            Visibility(
              visible: user.bio != null,
              child: Text(
                user.bio ?? '',
              ),
            ),
          ],
        ),
      );
    });
  }
}
