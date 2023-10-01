import 'Login.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final formkey=GlobalKey<FormState>();
  final _usernamecontroller=TextEditingController();
  final _emailcontroller=TextEditingController();
  final _passwordcontroller=TextEditingController();
  final _confirmPasswordcontroller=TextEditingController();

  bool usernameErrored=false;
  bool emailErrored=false;
  bool passwordErrored=false;
  bool confirmPasswordMatched=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(),
                  SizedBox(height: 40),
                  username(),
                  SizedBox(height: 40,),
                  email(),
                  SizedBox(height: 40,),
                  password(),
                  SizedBox(height: 40,),
                  confirmPassword(),
                  SizedBox(height: 80),
                  login(),
                  SizedBox(height: 20,),
                  registerButton(),
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget title()=> Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Text("Register Account",style: TextStyle(fontSize: 27,color: Colors.white,fontWeight: FontWeight.bold),),
  );

  Widget username()=> TextFormField(
    onChanged: (String value){
      usernameErrored=validateUsername(value);
    },
    controller: _usernamecontroller,
    decoration: InputDecoration(
      errorText:usernameErrored? 'Too short username':null,
      labelText: 'user name',
      labelStyle: TextStyle(color: Colors.white38),
      prefixIcon: Icon(Icons.person,size: 30,),
      prefixIconColor: Colors.white60,
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white70, width: 2),
      ),
    ),
  );

  bool validateUsername(String value) {
    bool error=false;
    if(value.isEmpty||value.length<7||value.contains(' '))
      setState(() {
        error=true;
      });
    else{
      setState(() {
      error=false;
    });}
    return error;
  }

  Widget email()=> TextFormField(
    onChanged: (String value){
      emailErrored=validateEmailError(value);
    },
    controller: _emailcontroller,
    decoration: InputDecoration(
      errorText:emailErrored? 'Invalid email':null,
      labelText: 'email',
      labelStyle: TextStyle(color: Colors.white38),
      prefixIcon: Icon(Icons.mail,size: 30,),
      prefixIconColor: Colors.white60,
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white70, width: 2),
      ),
      // contentPadding: EdgeInsets.only(left: 370)
    ),

  );

  bool validateEmailError(String value) {
    bool error = false;
    if (!value.contains('@')||!value.contains('.com')||value.isEmpty||value.contains(' ')) {
      setState(() {error = true;});
    }
    else { setState(() {error = false;});}
    return error;
  }

  Widget password()=>TextFormField(
    onChanged: (String value){
      passwordErrored=validatePasswordError(value);
    },
    controller: _passwordcontroller,
    obscureText: true,
    obscuringCharacter: '*',
    decoration: InputDecoration(
      errorText:passwordErrored? 'Invalid password':null,
      labelText: 'password',
      labelStyle: TextStyle(color: Colors.white38),
      prefixIcon: Icon(Icons.lock,size: 30),
      prefixIconColor: Colors.white60,
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white70, width: 2),
      ),
      // contentPadding: EdgeInsets.only(left: 370)
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

  Widget confirmPassword()=>TextFormField(
    onChanged: (String value){
      confirmPasswordMatched=validateConfirmPassword(value);
    },
      controller: _confirmPasswordcontroller,
      decoration: InputDecoration(
        errorText:_confirmPasswordcontroller.text.isNotEmpty?confirmPasswordMatched?null:'Doesn\'t matched':null,
        labelText: 'confirm password',
        labelStyle: TextStyle(color: Colors.white38),
        prefixIcon: Icon(Icons.lock_person,size: 30),
        prefixIconColor: Colors.white60,
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70, width: 2),
        ),
      ),
    obscureText: true,
    obscuringCharacter: '*',
  );

  bool validateConfirmPassword(String value) {
    bool isMatched=false;
    if(_passwordcontroller.text==value) setState(() {
      isMatched=true;
    });
    else {
      setState(() {
        isMatched=false;
      });
    }
    return isMatched;
  }

  Widget login()=> Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Already have an acount?",style: TextStyle(color: Colors.white),),
      TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white38),
          textStyle:MaterialStateProperty.all(TextStyle(fontSize: 12)),
        ),
        child: Text('Login'),
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login()));
        },
      ),
    ],
  );

  Widget registerButton()=>Container(
    width: 110,
    height: 30,
    margin: EdgeInsets.only(left: 160,top: 10),
    decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(5),
      color: Colors.black38,
    ),
    child: Center(
      child: GestureDetector(
        child:Text('Register', style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,),),
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login()));
        },
      ),
    ),
  );

}