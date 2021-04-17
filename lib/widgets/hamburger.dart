import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iot_application/providers/applicationstate.dart';
import 'package:iot_application/screens/monthschedule.dart';

void main() => runApp(MyApp());

const primaryColor = Color(0xFF6CAF97);

class MyApp extends StatelessWidget {
  final appTitle = 'Hamburger Bar';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Hamburgerja(title: appTitle),
    );
  }
}

class Hamburgerja extends StatelessWidget {
  final String title;

  Hamburgerja({Key key, this.title}) : super(key: key);

  get isSelected => null;

  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //     colors: <Color>[Color(0xff153970), Color(0xff153970)]),
                  color: Color(hexColor('#153970'))),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(padding: EdgeInsets.all(8.0)),
                      // child: Image.asset('name')
                    ),
                    Text('Name',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              )),
          CustomListTile(Icons.account_box, 'Profile', () => {}),
          CustomListTile(
              Icons.calendar_today,
              'My Schedule',
              () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MonthSchedule()),
                    )
                  }),
          CustomListTile(Icons.category, 'Categories', () => {}),
          // CustomListTile(Icons.report, 'Report Problem', () => {}),
          CustomListTile(Icons.settings, 'Change password', () => {}),
          CustomListTile(
              Icons.logout,
              'Logout',
              () => {
                    Provider.of<ApplicationState>(context, listen: false)
                        .logout()
                  }),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Color(0xffBED4DF),
        onTap: onTap,
        child: Container(
          height: 63,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(text,
                      style: TextStyle(color: Color(0xff153970), fontSize: 18)),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
