// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:login_app/Model/sharemarket.dart';
import 'package:login_app/Utils/constant.dart';
import 'package:login_app/Utils/lodingIndicator.dart';
import 'package:login_app/Widget/bottomNavbar.dart';
import 'package:provider/provider.dart';

class CurrentIpoScreen extends StatefulWidget {
  const CurrentIpoScreen({Key? key}) : super(key: key);

  @override
  _CurrentIpoScreenState createState() => _CurrentIpoScreenState();
}

class _CurrentIpoScreenState extends State<CurrentIpoScreen> {
  @override
  Widget build(BuildContext context) {
    final ipos = Provider.of<List<IPO>?>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 10,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Current",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "Opeaning",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            Text(
              "IPO",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/HomeScreen');
          },
        ),
      ),
      body: ipos == null
          ? Loading()
          : ListView.builder(
              itemCount: ipos.length,
              itemBuilder: (context, index) => IpoTile(
                ipo: ipos[index],
              ),
            ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}

class IpoTile extends StatelessWidget {
  final IPO? ipo;
  IpoTile({this.ipo});
  @override
  Widget build(BuildContext context) {
    return ipo == null
        ? Text(' No data')
        : Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              shadowColor: Colors.black,
              elevation: 5,
              color: Colors.brown[50],
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ipo!.companyName.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: ipo!.status.toString() == 'Closed'
                            ? Text(
                                ipo!.status.toString(),
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            : Text(
                                ipo!.status.toString(),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Opeaning:',
                                style: KipotexDecoration,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Closing:',
                                style: KipotexDecoration,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Price per Unit',
                                style: KipotexDecoration,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Total Share Unit',
                                style: KipotexDecoration,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Issue manager',
                                style: KipotexDecoration,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ipo!.opeaningDate.toString(),
                                style: KipotexDecoration,
                              ),
                              SizedBox(height: 7),
                              Text(
                                ipo!.closingDate.toString(),
                                style: KipotexDecoration,
                              ),
                              SizedBox(height: 7),
                              Text(
                                ipo!.pricePerUnit.toString(),
                                style: KipotexDecoration,
                              ),
                              SizedBox(height: 7),
                              Text(
                                ipo!.totalShareUnit.toString(),
                                style: KipotexDecoration,
                              ),
                              SizedBox(height: 7),
                              Text(
                                ipo!.issueManager.toString(),
                                style: KipotexDecoration,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
