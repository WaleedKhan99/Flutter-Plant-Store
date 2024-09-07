import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/screens/signin_page.dart';
import 'package:plant_app/ui/screens/widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(.5),
                  width: 5.0,
                ),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: ExactAssetImage('assets/images/profile.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: SizedBox(
                width: size.width * .5,
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // Ensures the Row takes only the needed space
                  children: [
                    Flexible(
                      child: Text(
                        'Waleed Ahmed Khan', // Remove trailing space after the name
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                        maxLines: 1, // Ensure it's a single line
                        softWrap: false, // Avoid text wrapping
                      ),
                    ),
                    const SizedBox(
                        width: 4), // Add a small spacing between text and image
                    SizedBox(
                      height: 24,
                      child: Image.asset("assets/images/verified.png"),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'waleedk1599@gmail.com',
              style: TextStyle(
                fontSize: 12,
                color: Constants.blackColor.withOpacity(.3),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: size.height * .7,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileWidget(
                    icon: Icons.person,
                    title: 'My Profile',
                    onTap: () {},
                  ),
                  ProfileWidget(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  ProfileWidget(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onTap: () {},
                  ),
                  ProfileWidget(
                    icon: Icons.chat,
                    title: 'FAQs',
                    onTap: () {},
                  ),
                  ProfileWidget(
                    icon: Icons.share,
                    title: 'Share',
                    onTap: () {},
                  ),
                  ProfileWidget(
                      icon: Icons.logout,
                      title: 'Log Out',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
