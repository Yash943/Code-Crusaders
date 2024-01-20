import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';

class NotificationSettingPage extends StatefulWidget{
  const NotificationSettingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationSettingPageState createState() => _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage>{
  bool valNotify1 = true;
  bool valNotify2 = true;

  onChangeFunc1(bool newValue1){
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunc2(bool newValue2){
    setState(() {
      valNotify2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bckgnd,
          title: const Text("Notifications",style: TextStyle(fontSize: 22)),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            buildNotificationOption("App Notifications", valNotify1, onChangeFunc1),
            const Divider(thickness: 2, indent: 17,endIndent: 30,),
            buildNotificationOption("E-mail Notifications", valNotify2, onChangeFunc2),
          ],
        ),
      ),
    );
  }

  Padding buildNotificationOption(String title , bool value , Function onChangeMethod){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8 , horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title , style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7)
          )),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              }
            ),
          )
        ],
      ),
    );
  }
}