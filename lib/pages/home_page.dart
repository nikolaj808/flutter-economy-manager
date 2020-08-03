import 'package:flutter/material.dart';
import 'package:economy_manager/balance.dart';
import 'package:economy_manager/month.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double balance = 0;
  String month = '';
  bool changed = false;
  final TextEditingController addButton = TextEditingController();
  final TextEditingController removeButton = TextEditingController();

  @override

  void dispose() {
    addButton.dispose();
    removeButton.dispose();
    super.dispose();
  }

  init() async {
    balance = await Balance().getBalance();
    changed = await Month().getChange();
    month = await Month().getMonth();
  }

  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  month,
                  style: TextStyle(
                    fontSize: 48.0,
                    fontFamily: 'Solway',
                    letterSpacing: 1.25,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                child: Text(
                  '$balance',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontFamily: 'Solway',
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              SizedBox(height: 150.0),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      radius: 40.0,
                      child: IconButton(
                        /*onPressed: () {
                          Navigator.pushNamed(context, '/account');
                        },*/
                        icon: Icon(Icons.account_balance),
                        iconSize: 40.0,
                      ),
                    ),


                    CircleAvatar(
                      backgroundColor: Colors.green[500],
                      radius: 40.0,
                      child: IconButton(
                        onPressed: () async {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Enter amount to add to current month'),
                                content: TextField(
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  controller: addButton,
                                  onSubmitted: (String str) {
                                    addButton.clear();
                                    Navigator.pop(context);
                                    setState(() {
                                      balance += double.parse(double.parse(str).toStringAsFixed(2));
                                      Balance().addToBalance(double.parse(double.parse(str).toStringAsFixed(2)));
                                    });
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        addButton.clear();
                                      },
                                      icon: Icon(Icons.clear),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }
                          );
                        },
                        icon: Icon(Icons.add),
                        iconSize: 40.0,
                      ),
                    ),


                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 40.0,
                      child: IconButton(
                        onPressed: () async {
                          return showDialog(
                            context: context,
                            builder: (context) {
                             return AlertDialog(
                               title: Text('Enter amount to remove from current month'),
                               content: TextField(
                                 autofocus: true,
                                 keyboardType: TextInputType.number,
                                 controller: removeButton,
                                 onSubmitted: (String str) {
                                   removeButton.clear();
                                   Navigator.pop(context);
                                   setState(() {
                                     balance -= double.parse(double.parse(str).toStringAsFixed(2));
                                     Balance().addToBalance(-double.parse(double.parse(str).toStringAsFixed(2)));
                                   });
                                 },
                                 decoration: InputDecoration(
                                   suffixIcon: IconButton(
                                     onPressed: () {
                                       removeButton.clear();
                                     },
                                     icon: Icon(Icons.clear),
                                     color: Colors.black,
                                   ),
                                 ),
                               ),
                             );
                            }
                          );
                        },
                        icon: Icon(Icons.remove),
                        iconSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 40.0,
                  child: IconButton(
                    onPressed: () {
                      Balance().resetBalance();
                      setState(() {
                        balance = 0.0;
                      });
                    },
                    icon: Icon(Icons.refresh),
                    iconSize: 40.0,
                  ),
                ),
              ),
            ],
        ),
        ),
      ),
    );
  }
}
