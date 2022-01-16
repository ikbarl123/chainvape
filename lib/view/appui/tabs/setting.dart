import 'package:flutter/material.dart';

class SettingTabs extends StatefulWidget {
  const SettingTabs({ Key? key }) : super(key: key);

  @override
  _SettingTabsState createState() => _SettingTabsState();
}

class _SettingTabsState extends State<SettingTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
          children: [
            SizedBox(height: 50,),
            Text("Settings"),
            
            ListView(
              shrinkWrap: true,
              children: [
                Divider(color: Colors.black,),
                ListTile(
                  title: Text("About"),
                  subtitle: Text("solo"),   
                  trailing: Icon(Icons.info),     
                  onTap: () {},         
                ),
                Divider(color: Colors.black,),
                
              ],
              ),
          ],
        ),
      
      
    );
  }
}