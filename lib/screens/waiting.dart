import 'package:flutter/material.dart';
import 'package:iot_application/screens/authenticateScreen.dart';
import 'monthschedule.dart';
import 'package:iot_application/providers/applicationstate.dart';
import 'package:provider/provider.dart';

class Waiting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: new Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'I',
                  style: TextStyle(
                      color: Color(0xFFBED4DF),
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mali'),
                ),
                TextSpan(
                  text: 'o',
                  style: TextStyle(
                      color: Color(0xFFCCADA5),
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mali'),
                ),
                TextSpan(
                  text: 'T',
                  style: TextStyle(
                      color: Color(0xFFFFB9A3),
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mali'),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
            ),
            new Text(
              'Manage your time, \nevents and \nactivities',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'mali'),
            ),
            Padding(
              padding: EdgeInsets.all(35.0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (BuildContext context, _, __) {
                  return ChangeNotifierProvider(
                      create: (context) => ApplicationState(),
                      builder: (context, _) => Consumer<ApplicationState>(
                          builder: (ctx, auth, _) => MaterialApp(
                              home: auth.credentials != null
                                  ? MonthSchedule()
                                  : AuthenticateScreen())));
                }));
              },
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFFE17262),
                  padding: EdgeInsets.symmetric(
                    horizontal: 52,
                    vertical: 19,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0))),
              child: Text(
                'Let’s go',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'mali'),
              ),
            )
          ]),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/waiting-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
