
import 'dart:developer';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/homePage.dart';
import 'package:ecommerce_app/registration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';




class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  late String username,password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn')??false;
    log("isLoggedIn = " + isLoggedIn.toString());
    if(isLoggedIn){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
    }
}

  login(String username,String password) async {
    print('webservice');
    print(username);
    print(password);
    var result;
    final Map<String,dynamic> loginData = {
      'username' : username,
      'password' : password
    };

    
    final response = await http.post(
      Uri.parse("http://bootcamp.cyralearnings.com/login.php"
        // webservice.mainurl + "login.jsp"
        ),
      body: loginData,
    );

   print(response.statusCode);
    if(response.statusCode == 200){
      if(response.body.contains('success')){
        log("login sucessfully completed");
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        prefs.setString("username", username);
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const HomePage();
        },
        ));
      }else{
        log("login failed");
      }
    }else{
    }
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                 const Text("Welcome Back",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black
                ),),
                 const Text("Login with your username and password",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black
                ),),
                const SizedBox(height: 10,),
                Container(
                  decoration:   BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10),),
                     color: greyBD
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextFormField(
                        style:  const TextStyle(
                          fontSize: 15,
                          
                        ),
                        decoration: const InputDecoration.collapsed(hintText: 'Username'),
                        onChanged: (text) => setState(() {
                          username = text;
                        },),
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Enter your username text';
                          }
                          return null;
                        },
                      ),
                    ),
                  )),
                  const SizedBox(height: 10,),
                   Container(
                  decoration:   BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10),),
                     color:greyBD
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextFormField(
                        style:  const TextStyle(
                          fontSize: 15,
                          
                        ),
                        decoration: const InputDecoration.collapsed(hintText: 'Username'),
                        onChanged: (text) => setState(() {
                          password = text;
                        },),
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Enter your Password text';
                          }
                          return null;
                        },
                      ),
                    ),
                  )),
                  const SizedBox(height: 10,),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      backgroundColor: primaryColor
                    ),
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        log(("username = "+ username.toString()));
                            log(("password = "+password.toString()));
                            login(username.toString(), password.toString());
                      }
                            
                  }, 
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Login'),
                  )),
                  const SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't you have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            // ignore: prefer_const_constructors
                            return RegistrationPage();
                          }));
                        },
                        child: Text("Go to Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor
                        ),),
                      )
                    ],
                  )
                          ],
                        ),
              )),
        ),
      ),
    );
  }
}


