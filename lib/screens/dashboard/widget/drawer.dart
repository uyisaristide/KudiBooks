import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/background.dart';

class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: BackgroundScreen(
      paddingSize: 0.0,
      screens: Container(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: SizedBox(
          height: 800,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                          "assets/images/splash/kudibooksLogo2.png"),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "User Name",
                            style: TextStyle(fontSize: 17.0),
                          ),
                          Text("useremail@email.com")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart_outlined),
                      title: Text("Products"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text("Clients"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text("Transaction"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_bag_rounded),
                      title: Text("Vendors"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.bar_chart_outlined),
                      title: Text("Reports"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text("Settings"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text("Help"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text("About"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: LoginButton(
                  text: 'Logout',
                  actionField: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
