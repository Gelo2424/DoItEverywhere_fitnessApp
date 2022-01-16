import 'package:die_app/widgets/user_page/stats_chart.dart';
import 'package:flutter/material.dart';
import 'package:die_app/addidtional/globals.dart' as globals;
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserStatsPage extends StatefulWidget {
  const UserStatsPage({Key? key}) : super(key: key);

  @override
  _UserStatsPageState createState() => _UserStatsPageState();
}

class _UserStatsPageState extends State<UserStatsPage> {
  ParseUser? currentUser;
  List<int> points = List<int>.empty();
  List<String> dates = List<String>.empty();

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background/bg_01_2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // part with avatar //
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: SizedBox(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            "Your week score",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'SourceCodePro',
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              if (!globals.isRedundentClick(DateTime.now())) {
                                Navigator.pop(context);
                              }
                            },
                            child: const Icon(Icons.insert_chart_outlined_sharp,
                                size: 60),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  const CircleBorder()),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(40)),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.deepPurple[800]), // <-- Button color
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.amber[800];
                                  } // <-- Splash color
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // part with buttons //
              SizedBox(
                  child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: StatsChart(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
