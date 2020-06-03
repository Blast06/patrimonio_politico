import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/imgs/drawer.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blueGrey,),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),ListTile(
            leading: Icon(Icons.pages, color: Colors.blueGrey,),
            title: Text('Categories'),
            onTap: () => Navigator.pushReplacementNamed(context, 'categories'),
          ),ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blueGrey,),
            title: Text('Upload group'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'upload_group');
            },
          ),ListTile(
            leading: Icon(Icons.people, color: Colors.blueGrey,),
            title: Text('Privacy Policy'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'information');
            },
          ),ListTile(
            leading: Icon(Icons.settings, color: Colors.blueGrey,),
            title: Text('About'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'information');
            },
          ),
        ],
      ),
    );
  }
}