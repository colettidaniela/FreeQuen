import 'dart:math';

import 'package:flutter/material.dart';
import 'package:promosnqn/firebase_login/cuenta.dart';
import 'package:promosnqn/firebase_login/pantalla_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promosnqn/home/homescreen.dart';
import 'package:promosnqn/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class singupScreen extends StatefulWidget {
  const singupScreen({ Key? key }) : super(key: key);

  @override
  _singupScreenState createState() => _singupScreenState();
}

class _singupScreenState extends State<singupScreen> {

  final _auth = FirebaseAuth.instance;



  final _formKey = GlobalKey<FormState>();

  final nombrelocalEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final tipolocalEditingController = new TextEditingController();
  final ubicacionlocalEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    
    final nombrelocalField = TextFormField(
      autofocus: false,
      controller: nombrelocalEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("No ingreso ningun nombre");
        }
        if (!regex.hasMatch(value)){
          return ("El nombre tiene muy pocos caracteres");
        }
      },
      onSaved: (value){
        nombrelocalEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.shopping_cart),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nombre del local",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if(value!.isEmpty){
          return ("Ingrese su email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return ("Ingrese un email valido");
        }
        return null;
      },
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    final tipolocalField = TextFormField(
      autofocus: false,
      controller: tipolocalEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("No ingreso el tipo de local");
        }
        if (!regex.hasMatch(value)){
          return ("El campo tiene muy pocos caracteres");
        }
      },
      onSaved: (value){
        tipolocalEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.category),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Tipo de Local",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    final ubicacionlocalField = TextFormField(
      autofocus: false,
      controller: ubicacionlocalEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("No ingreso la ubicacion");
        }
        if (!regex.hasMatch(value)){
          return ("La ubicacion tiene muy pocos caracteres");
        }
      },
      onSaved: (value){
        ubicacionlocalEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.map),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Ubicacion del local",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("No ingreso la contraseña");
        }
        if (!regex.hasMatch(value)){
          return ("La contraseña tiene muy pocos caracteres");
        }
      },
      onSaved: (value){
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );


    final singupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0XFFb8b3c6),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text("Registrar", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
        ),),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset("assets/logo.png", fit: BoxFit.contain,),
                    ),
                    SizedBox(height: 45,),
                    nombrelocalField,
                    SizedBox(height: 20,),
                    emailField,
                    SizedBox(height: 20,),
                    tipolocalField,
                    SizedBox(height: 20,),
                    ubicacionlocalField,
                    SizedBox(height: 20,),
                    passwordField,
                    SizedBox(height: 20,),
                    singupButton,
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Ya tener una cuenta? "),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Text("Inicia Sesion",
                          style: TextStyle(
                            color: Color(0XFF7e8595),
                            fontWeight: FontWeight.w600),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  void signUp(String email, String password) async
  {
    if(_formKey.currentState!.validate())
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
          postDetailsToFirestore()

        }).catchError((e)
        {
          Fluttertoast.showToast(msg: e!.message);
        });
    }
  }

  postDetailsToFirestore() async{

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.nombre = nombrelocalEditingController.text;
    userModel.tipolocal = tipolocalEditingController.text;
    userModel.ubicacionlocal = ubicacionlocalEditingController.text;


    await firebaseFirestore
       .collection("users")
       .doc(user.uid)
       .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Cuenta creada correctamente");


    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => homescreen()), 
    (route) => false);

  }
}