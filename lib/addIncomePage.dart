import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({Key key}) : super(key: key);

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nominalController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
          title: Text("Tambah Pemasukan", style: TextStyle(color: Colors.green, fontSize: 15, fontWeight: FontWeight.bold),),
          // toolbarHeight: 30,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              TextField(
                controller: dateController,
                onChanged: (value) => setState(() => null),
                readOnly: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.date_range),
                  labelText: 'Tanggal',
                ),
                onTap: () async {
                  DateTime pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      dateController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              TextField(
                controller: nominalController,
                onChanged: (value) => setState(() => null),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  prefixText: 'Rp. ',
                  labelText: 'Nominal',
                ),
              ),
              TextField(
                controller: detailController,
                onChanged: (value) => setState(() => null),
                decoration: InputDecoration(
                  labelText: 'Keterangan',
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () => {
                          dateController.clear(),
                          nominalController.clear(),
                          detailController.clear(),
                        },
                    child: const Text('Reset',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () => null,
                    child: const Text('Simpan',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('<< Kembali',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))),
              ),
            ]),
          ),
        ));
  }
}
