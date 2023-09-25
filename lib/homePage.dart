import 'package:buku_kas_nusantara/addIncomePage.dart';
import 'package:buku_kas_nusantara/addOutcomePage.dart';
import 'package:buku_kas_nusantara/database_instance.dart';
import 'package:buku_kas_nusantara/detailCashFlowPage.dart';
import 'package:buku_kas_nusantara/editUserPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int id_user;
  const HomePage({Key key, @required this.id_user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<int> income;
  Future<int> outcome;

  @override
  void initState() {
    super.initState();
    income = DatabaseInstance().totalIncome(id_user: widget.id_user);
    outcome = DatabaseInstance().totalOutcome(id_user: widget.id_user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
              child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Rangkuman Bulan Ini",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder<int>(
                        future: income,
                        builder: (context, incomeSnapshot) {
                          if (incomeSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (incomeSnapshot.hasError) {
                            return Text("Error: ${incomeSnapshot.error}");
                          } else {
                            return FutureBuilder<int>(
                              future: outcome,
                              builder: (context, outcomeSnapshot) {
                                if (outcomeSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (outcomeSnapshot.hasError) {
                                  return Text(
                                      "Error: ${outcomeSnapshot.error}");
                                } else {
                                  return Column(
                                    children: [
                                      Text(
                                        "Pengeluaran: Rp. ${outcomeSnapshot.data}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        "Pemasukan: Rp. ${incomeSnapshot.data}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('lib/images/chart.gif', height: 200),
                      GridView.count(
                        crossAxisCount: 2, // Jumlah kolom (2 kolom)
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        mainAxisSpacing: 20, // Spasi vertikal antara kotak
                        crossAxisSpacing: 20, // Spasi horizontal antara kotak
                        children: <Widget>[
                          Container(
                            width: 150,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddIncomePage(
                                            id_user: widget.id_user,
                                          ))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Image.asset('lib/images/income.png',
                                  //     height: 100),
                                  Icon(
                                    Icons.add_circle_outline_rounded,
                                    size: 100,
                                    color: Colors.green,
                                  ),
                                  Text("Pemasukan",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddOutcomePage(
                                            id_user: widget.id_user,
                                          ))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Image.asset('lib/images/outcome.png',
                                  //     height: 100),
                                  Icon(
                                    Icons.remove_circle_outline_rounded,
                                    size: 100,
                                    color: Colors.red,
                                  ),

                                  Text("Pengeluaran",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailCashFlowPage(
                                            id_user: widget.id_user,
                                          ))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Image.asset('lib/images/cashFlow.png',
                                  //     height: 80),
                                  Icon(
                                    Icons.swap_horizontal_circle_outlined,
                                    size: 100,
                                    color: Colors.blue,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Detail Cash Flow",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditUserPage(
                                            id_user: widget.id_user,
                                          ))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Image.asset('lib/images/setting.png',
                                  //     height: 80),
                                  Icon(
                                    Icons.settings_outlined,
                                    size: 100,
                                    color: Colors.blueGrey,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Pengaturan",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
