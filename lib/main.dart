
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:pandabar/main.view.dart';
import 'package:pandabar/pandabar.dart';

void main() {
  runApp(const PandaBottomBar());
}

class PandaBottomBar extends StatelessWidget {
  const PandaBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String page = 'Blue';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PandaBar(
        buttonColor: Colors.red.shade900,
        buttonSelectedColor: Colors.red.shade500,
        fabColors: [Colors.red.shade900, Colors.red],
        buttonData: [
          PandaBarButtonData(
            id: 'Blue',
            icon: Icons.dashboard,
            title: 'Blue',
          ),
          PandaBarButtonData(
              id: 'Green',
              icon: Icons.book,
              title: 'Green'
          ),
          PandaBarButtonData(
              id: 'Red',
              icon: Icons.account_balance_wallet,
              title: 'Red'
          ),
          PandaBarButtonData(
              id: 'Yellow',
              icon: Icons.notifications,
              title: 'Yellow'
          ),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  content: const Text('Fab Button Pressed :)'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    )
                  ],
                );
              }
          );
        },
      ),
      body: Builder(
        builder: (context) {

          switch (page) {
            case 'Green':
              return Container(color: Colors.green.shade500);
            case 'Blue':
              return Container(color: Colors.blue.shade900);
            case 'Red':
              return Container(color: Colors.red.shade900);
            case 'Yellow':
              return Container(color: Colors.yellow.shade700);
            default:
              return Container();

          }

        },
      ),
    );
  }}