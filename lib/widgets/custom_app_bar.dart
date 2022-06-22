import 'package:flutter/material.dart';
import 'package:livet_mobile/constans/image_routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Image.asset(logo),
            const Spacer(),
            const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person_outline, color: Colors.white, size: 60),
              maxRadius: 35,
            ),
          ],
        ),
      ),
    );
  }
}
