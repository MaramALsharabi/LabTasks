import 'package:flutter/material.dart';
import 'package:pro_login/Project/StartPage.dart';
import 'Register.dart';
import 'StartPage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> {
  final key=GlobalKey<FormState>();
  bool usernameError=false;
  bool passwordError=false;
  final TextEditingController usernameCintroller =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  String username="";
  String password="";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          canvasColor: Colors.grey.shade800
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: form(),
      ),
    );
  }

  Widget form() {
    return Form(
      key: key,
      child:  Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            loginWithGoogle(),
            SizedBox(height: 30,),
            loginWithFacebook(),
            SizedBox(height: 30,),
            Row(
              children: [
                Divider(indent: 120,endIndent: 120,),
                Text("or",style: TextStyle(color: Colors.white60),),
                Divider(indent: 120,endIndent: 120,),
              ],
            ),
            SizedBox(height: 30,),
            usernameComp(),
            SizedBox(height: 10,),
            passwordComp(),
            forgetPassword(),
            SizedBox(height: 30,),
            login(),
            SizedBox(height: 30,),
            register(),
          ],
        ),
      ),
    );
  }

  Widget loginWithGoogle()=> InkWell(
    onTap:(){} ,
    child: Container(
      width:300,
      height:50,
      padding: EdgeInsets.only(left: 20),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white60,
      ) ,
      child: Row(
        children: [
          Icon(Icons.g_mobiledata,color:Colors.white ,size: 40,),
          Container(
            padding: EdgeInsets.only(left: 40),
            child: Text("Login with Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
          )
        ],
      ),
    ),
  );

  Widget loginWithFacebook()=> InkWell(
    onTap:(){} ,
    child: Container(
      width:300,
      height:50,
      padding: EdgeInsets.only(left: 20),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white60,
      ) ,
      child: Row(
        children: [
          Icon(Icons.facebook_sharp,color:Colors.white ,size: 40,),
          Container(
            padding: EdgeInsets.only(left: 40),
            child: Text("Login with Facebook",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
          )
        ],
      ),
    ),
  );

  Widget usernameComp() => Container(
    margin: EdgeInsets.only(left: 100,right: 100),
    child: TextFormField(
      onChanged: (value){
        usernameError = validateUserError(value);
      },
      controller: usernameCintroller,
      decoration: InputDecoration(
        errorText:usernameError? 'Sorry,enter more characters':null,
        labelText: 'UserName',
        labelStyle: TextStyle(color: Colors.white60),
        prefixIcon: Icon(Icons.person,size: 30,),
        prefixIconColor: Colors.white60,
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70, width: 2),
        ),
      ),
      maxLength: 25,
      onSaved: (value)=>!usernameError?username=value!:null,
    ),
  );

  bool validateUserError(String value) {
    bool error = false;
    if (value.length <4||value.contains(' ')) {
      setState(() {error = true;});
    }
    else {
      setState(() {error = false;});
    }
    return error;
  }

  Widget passwordComp() => Container(
    margin: EdgeInsets.only(left: 100,right: 100),
    child: TextFormField(
      onChanged: (value){
        passwordError=validatePasswordError(value);
      },
      controller: passwordController,
      decoration: InputDecoration(
        errorText:passwordError? 'Invalid Password':null,
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.white60),
        prefixIcon: Icon(Icons.lock),
        prefixIconColor: Colors.white60,
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70, width: 2),
        ),
        hintText: "Contain [! @ # \$ & * ~ ,A..,a..,0..](8 and more)",
        hintStyle:TextStyle(fontSize: 12,color: Colors.redAccent),
      ),
      onSaved: (value)=>!passwordError?password=value!:null,
      obscureText: true,
      obscuringCharacter: '*',
    ),
  );

  bool validatePasswordError(String value) {
    bool error=false;
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    bool correct=regExp.hasMatch(value);
    !correct?setState(()=>error=true):setState(()=>error=false);
    return error;
  }

  Widget forgetPassword()=>Container(
    margin: EdgeInsets.only(left: 200),
    child: TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white38),
        textStyle:MaterialStateProperty.all(TextStyle(fontSize: 12)),
      ),
      onPressed: () { },
      child: Text('Forget Password'),

    ),
  );

  Widget login() =>
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor:  MaterialStateProperty.all<Color>(Colors.white60),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
          ),
          minimumSize: MaterialStateProperty.all( Size(120, 40)),
        ),
        child: Text('Login'),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>StartPage()));
        },
      );

  Widget register()=> Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Don't have an acount?",style: TextStyle(color: Colors.white),),
      TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white38),
          textStyle:MaterialStateProperty.all(TextStyle(fontSize: 12)),
        ),
        child: Text('register here'),
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Register()));
        },
      ),
    ],
  );



}

