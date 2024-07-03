
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/login.dart';
import 'package:flutter/material.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? name, phone, address, username, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  registration(String name, phone, address, username, password)async{
    final Map<String,dynamic>Data = {
     'name' : name,
     'phone' : phone,
     'address' : address,
     'username' : username,
     'password' : password,
    };

   
    final response = await http.post(
      Uri.parse("http://bootcamp.cyralearnings.com/registration.php"
        // webservice.mainurl + "resgistration.jsp"
      ),
      body : Data,
    );

    print(response.statusCode);
    if(response.statusCode == 200){
      if(response.body.contains('success')){
        log("registration sucessfully completed");

        Navigator.push(context, MaterialPageRoute(builder: (context){
          return LoginPage();
        },
        ));
      }else{
        log("registration failed");
      }
    }else{
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Register Account",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
            ),
            Text(
              "Complete your details",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: greyBD),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Center(
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'name'),
                                onChanged: (text) => setState(
                                  () {
                                    name = text;
                                  },
                                ),
                                // ignore: body_might_complete_normally_nullable
                               validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your Name';
                                }
                               },
                              ),
                            ),
                          )),
                    ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: greyBD),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'phone'),
                                onChanged: (text) => setState(
                                  () {
                                    phone = text;
                                  },
                                  
                                ),
                                // ignore: body_might_complete_normally_nullable
                                validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your phone';
                                }else if(value.length > 10 || value.length < 10){
                                 return 'Please Enter Valid Phone Number';
                                }
                                 
                                },
                              ),
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: greyBD),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 15,
                                  
                                ),
                                maxLines: 4,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'address'),
                                onChanged: (text) => setState(
                                  () {
                                    address = text;
                                  },
                                ),
                                // ignore: body_might_complete_normally_nullable
                                validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your Address';
                                }
                               },
                              ),
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: greyBD),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'username'),
                                onChanged: (text) => setState(
                                  () {
                                    username = text;
                                  },
                                ),
                                // ignore: body_might_complete_normally_nullable
                                validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your Username';
                                }
                               },
                              ),
                            ),
                          )),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: greyBD),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'password'),
                                onChanged: (text) => setState(
                                  () {
                                    password = text;
                                  },
                                ),
                                // ignore: body_might_complete_normally_nullable
                                 validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your Password';
                                }
                               },
                              ),
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white, shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                backgroundColor: primaryColor
                              ),
                              onPressed: (){
                               log("name = "+ name.toString());
                               log("phone = "+ phone.toString());
                               log("address = "+ address.toString());
                               log("username = "+ username.toString());
                               log("password = "+ password.toString());
                               registration(name!, phone, address, username, password);
                            }, 
                            child: Text('Register')),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Do you have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            // ignore: prefer_const_constructors
                            return LoginPage();
                          }));
                        },
                        child: Text("Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor
                        ),),
                      )
                    ],
                  )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
