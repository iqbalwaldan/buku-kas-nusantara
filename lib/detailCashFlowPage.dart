import 'dart:math';

import 'package:flutter/material.dart';

class DetailCashFlowPage extends StatefulWidget {
  const DetailCashFlowPage({Key key}) : super(key: key);

  @override
  State<DetailCashFlowPage> createState() => _DetailCashFlowPageState();
}

class _DetailCashFlowPageState extends State<DetailCashFlowPage> {
  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Cash Flow",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          // toolbarHeight: 30,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: ListView(
              children: <Widget>[
                cardCashFlow(Icons.arrow_forward,Colors.red.shade400,"-", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
                cardCashFlow(Icons.arrow_back,Colors.green.shade400,"+", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
                cardCashFlow(Icons.arrow_forward,Colors.red.shade400,"-", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
                cardCashFlow(Icons.arrow_back,Colors.green.shade400,"+", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
                cardCashFlow(Icons.arrow_forward,Colors.red.shade400,"-", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
                cardCashFlow(Icons.arrow_back,Colors.green.shade400,"+", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
                cardCashFlow(Icons.arrow_forward,Colors.red.shade400,"-", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
                cardCashFlow(Icons.arrow_back,Colors.green.shade400,"+", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
                cardCashFlow(Icons.arrow_forward,Colors.red.shade400,"-", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
                cardCashFlow(Icons.arrow_back,Colors.green.shade400,"+", "250000", "Pemasukan dari semua jenis usaha yang aku punya", "2021-03-16"),
              ],
            )),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('<< Kembali',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
          ),
        ),
      ),
    );
  }

  Card cardCashFlow(IconData icon, Color color,String sign, String nominal, String description, String date) {
    return Card(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("[ "+sign+" ] Rp. " + nominal,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            Container(
                              width: 200,
                              child: Text(
                                description,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              date,
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        Icon(icon,color: color),
                      ]),
                ),
              );
  }
}
