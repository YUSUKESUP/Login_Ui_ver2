import 'package:flutter/material.dart';


class FormScreen extends StatefulWidget {

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

 final _formfield = GlobalKey<FormState>();
 final emailController = TextEditingController();
 final passController = TextEditingController();
 bool passToggle = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Form Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 60),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.android,
                  size: 250,),
                SizedBox(height: 30),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),

                ),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(passToggle
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: (){
                    if (_formfield.currentState!.validate()){
                      print('Success');
                      emailController.clear();
                      passController.clear();
                    }
                  },
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text('Log In',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                       ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an acccount?',style: TextStyle(
                      fontSize: 17,
                     ),
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
