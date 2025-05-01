import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/me.jpg'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 10.0),
              Text(
                'Arvin C. San Andres',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Fullstack Developer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 2.5,
                  fontFamily: 'Source Sans Pro',
                ),
              ),
              Text(
                'System Administrator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 2.5,
                  fontFamily: 'Source Sans Pro',
                ),
              ),
              SizedBox(height: 10.0),
              ContactInfoWidget(
                icon: Icons.call,
                text: '+63 967 365 0439',
                onCopyText: '+639673650439',
              ),
              SizedBox(height: 10.0,),
              ContactInfoWidget(
                icon: Icons.email,
                text: 'arvinsanandres@gmail.com',
                onCopyText: 'arvinsanandres@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInfoWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String onCopyText;

  const ContactInfoWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onCopyText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.teal, size: 18.0),
          Text(text, style: TextStyle(color: Colors.teal, fontFamily: 'Source Sans Pro'),),
          CopyableTextIcon(textToCopy: text, onCopyText: onCopyText),
        ],
      ),
    );

    //   Container(
    //   margin: EdgeInsets.only(left: 20.0, right: 20.0),
    //   padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 5.0, bottom: 5.0),
    //   child: ListTile(
    //     tileColor: Colors.white,
    //     leading: Icon(icon, color: Colors.teal, size: 18.0),
    //     title: Text(
    //       text,
    //       style: TextStyle(color: Colors.teal, fontFamily: 'Source Sans Pro'),
    //     ),
    //     trailing: CopyableTextIcon(textToCopy: text, onCopyText: onCopyText),
    //   ),
    // );
  }
}

class CopyableTextIcon extends StatelessWidget {
  final String textToCopy;
  final String onCopyText;

  const CopyableTextIcon({
    super.key,
    required this.textToCopy,
    required this.onCopyText,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.copy, color: Colors.teal, size: 16.0),
      onPressed:
          () =>
              Clipboard.setData(ClipboardData(text: onCopyText)).then((value) {
                final snackBar = SnackBar(content: Text('Copied to Clipboard'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
    );
  }
}
