import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Utilites/colors.dart';
import '../../../Provider/provider.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData.light(),
      // Light theme
      darkTheme: ThemeData.dark(),
      // Dark theme
      themeMode: appProvider.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light,
      // Use themeMode to switch between light and dark mode
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
                children: <Widget>[
                  Container(
                    height: 140.0,
                    decoration: BoxDecoration(
                      color: ToolsUtilites.mainColor,
                      boxShadow: const [BoxShadow(blurRadius: 50.0)],
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery
                                  .of(context)
                                  .size
                                  .width, 150.0)),
                    ),),
                  const Padding(
                    padding: EdgeInsets.only(top: 55.0, bottom: 1),
                    child: Center(
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(
                          "lib/assets/images/profile.png",),
                      ),
                    ),
                  ),
                ]),
            const SizedBox(height: 30),
            itemProfile('Name', 'Sondos', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '03107085816', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'abc address, xyz city',
                CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', 'Flutterdeveloper@gmail.com',
                CupertinoIcons.mail_solid),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),

    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Consumer<AppProvider>(
        builder: (context, appProvider, _) {
          final theme = Theme.of(context);
          final isDarkMode = theme.brightness == Brightness.dark;
          final tileColor = isDarkMode ? Colors.black : Colors.white;
          final textColor = isDarkMode ? Colors.black : Colors.indigo.withOpacity(.2);

          return Container(
            decoration: BoxDecoration(
                color: tileColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      color: textColor,
                      spreadRadius: 2,
                      blurRadius: 10)
                ]),
            child: ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              leading: Icon(iconData),
              trailing: const Icon(
                  Icons.arrow_forward, color: ToolsUtilites.theardColor),
              tileColor: tileColor ,
            ),
          );
        }
    );
  }
}
