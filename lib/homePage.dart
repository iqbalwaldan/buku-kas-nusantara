import 'package:buku_kas_nusantara/addIncomePage.dart';
import 'package:buku_kas_nusantara/addOutcomePage.dart';
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
  var income = 500000;
  var outcome = 1500000;
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
                      Text("Pengeluaran: Rp. " + outcome.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.red)),
                      Text("Pemasukan: Rp. " + income.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.green)),
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
                                      builder: (context) =>
                                          const AddIncomePage())),
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
                                      builder: (context) =>
                                          const AddOutcomePage())),
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
                                      builder: (context) =>
                                          const DetailCashFlowPage())),
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
