import 'package:flutter/material.dart';
import 'package:promosnqn/firebase_login/cuenta.dart';
import 'package:promosnqn/firebase_login/pantalla_registro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promosnqn/home/homescreen.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context){

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
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
        emailController.text = value!;
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

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
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
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );



    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0XFFb8b3c6),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signIn(emailController.text, passwordController.text);
        },
        child: Text("Login", textAlign: TextAlign.center,
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
                    emailField,
                    SizedBox(height: 25,),
                    passwordField,
                    SizedBox(height: 35,),
                    loginButton,
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Todavia no tenes una cuenta? "),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => singupScreen()));
                          },
                          child: Text("Registrate",
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


  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()){
      await _auth
           .signInWithEmailAndPassword(email: email, password: password)
           .then((uid) => {
              Fluttertoast.showToast(msg: "Inicio Sesion Correctamente"),
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homescreen())),

            }).catchError((e)
            {
              Fluttertoast.showToast(msg: e!.message);
            }
            );
    }
  }
}