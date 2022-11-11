import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ptc_project/view/screens/search/search_view.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
         UserAccountsDrawerHeader(
          margin: EdgeInsets.zero,
          accountName: Text("PTC ADMIN"),
           accountEmail: Text("ptc@gmail.com"),
           currentAccountPicture: CircleAvatar(),
           ),
           ListTile(
            onTap: ()=>Navigator
            .push(context, MaterialPageRoute(builder: (ctx)=>SearchView())).then((value) => Navigator.pop(context)),
            leading: Icon(Icons.search),
            title: Text('Search'),
           )
          ],
        ),
      ),
body: ListView(
  padding: EdgeInsets.all(10.0),
    children: [
      TextFormField(
        decoration: InputDecoration(
          label: Text("First Name")
        ),
      )
    ],
   ),
    );
  }
}