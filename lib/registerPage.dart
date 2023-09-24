import 'package:buku_kas_nusantara/loginPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
            child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[800],
                      Colors.blue[600],
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 36.0, horizontal: 24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                                child: Image.asset(
                      'lib/images/logo.png',
                      height: 60,
                    ),
                              ),
                    // SizedBox(height: 10,),
                              Text("Buku Kas Nusantara",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Daftar Jika Anda belum memiliki akun",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        )),
                        
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                // topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 20,),
                                Text("Daftar",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  )),
                                SizedBox(height: 40,),
                                TextField(
                                  controller: nameController,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 226, 226, 226),
                                    hintText: 'Nama Lengkap',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: usernameController,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 226, 226, 226),
                                    hintText: 'Username',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: passwordController,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 226, 226, 226),
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text("Sudah memiliki akun?? Silahkan"),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginPage()));
                                        },
                                        child: Text("Login",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold)))
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () {
                                        // setState(() {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                        // });
                                      },
                                      child: const Text('Daftar',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}