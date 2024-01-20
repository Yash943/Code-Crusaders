import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';
import 'package:flutter_app/src/features/screens/drawer/drawer_subparts/notificationsetting_view.dart';
import 'package:flutter_app/src/features/screens/drawer/drawer_subparts/support_view.dart';
import 'package:flutter_app/src/features/screens/drawer/drawer_subparts/terms_view.dart';
import 'package:flutter_app/src/features/screens/login_view/login_page.dart';
import 'package:flutter_app/src/provider/google_provider.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    bool _isSigningOut = false;
    List<IconData> iconList = [
      Icons.notifications,
      Icons.gavel,
      Icons.help,
      Icons.logout_outlined,
    ];

    List<String> titleList = [
      'Notifications Settings',
      'Terms & Conditions',
      'Support',
      'Logout'
    ];

    List<Color> colorList = [
      Colors.purple,
      Colors.grey,
      Colors.pink,
      Colors.red,
    ];

    List<Function()?> onTapList = [
      //Notifications Setting
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NotificationSettingPage(),
          ),
        );
      },
      //Terms and Conditons
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TermsAndConditionsScreen(),
          ),
        );
      },
      //Support
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SupportPage(),
          ),
        );
      },
      //Logout
      () async {
        setState(() {
          _isSigningOut = true;
        });
        await Authentication.signOut(context: context);
        setState(() {
          _isSigningOut = false;
        });
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: bckgnd,
        title: const Text(
          'My Account',
          style: TextStyle(
            fontSize: 23,
            color: Colors.black87,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15)),
            child: Stack(
              children: [
                Positioned(
                  top: 7,
                  left: 7,
                  child: user.photoURL != null
                      ? ClipOval(
                          child: Material(
                            color: Colors.grey,
                            child: Image.network(
                              user.photoURL!,
                              height: 80,
                              // fit: BoxFit.fitHeight,
                            ),
                          ),
                        )
                      : const Icon(
                          Icons.account_circle_rounded,
                          size: 85,
                          color: Colors.white,
                        ),
                ),
                Positioned(
                    top: 20,
                    left: 105,
                    child: Text(
                      user.displayName!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'ADLaMDisplay',
                      ),
                    )),
                Positioned(
                    top: 45,
                    left: 105,
                    child: Text(
                      user.email!,
                      // 'abc@gmail.com',
                      // userData.email,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: colorList.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  minVerticalPadding: 18,
                  onTap: onTapList[index],
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: colorList[index],
                    child: Icon(
                      iconList[index],
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    titleList[index],
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
