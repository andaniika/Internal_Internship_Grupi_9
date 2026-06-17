import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const RegistrationPage(),

    );
  }
}




class RegistrationPage extends StatefulWidget {

  const RegistrationPage({super.key});


  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();

}




class _RegistrationPageState
    extends State<RegistrationPage> {


  final nameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();



  String selectedRole = "Student";

  String errorMessage = "";



  void registerUser() {


    String name =
        nameController.text.trim();


    String email =
        emailController.text.trim();


    String password =
        passwordController.text.trim();



    if(name.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {


      setState(() {

        errorMessage =
            "Please fill all fields";

      });


      return;
    }





    if(!email.contains("@")) {


      setState(() {

        errorMessage =
            "Invalid email";

      });


      return;

    }





    if(password.length < 6) {


      setState(() {

        errorMessage =
            "Password must be at least 6 characters";

      });


      return;

    }





    setState(() {

      errorMessage = "";

    });




    showDialog(

      context: context,

      builder: (context) {


        return AlertDialog(

          title:
          const Text("Registration Successful"),



          content: Text(
            """
Name: $name

Email: $email

Role: $selectedRole
            """,
          ),



          actions: [

            TextButton(

              onPressed: () {

                Navigator.pop(context);

              },

              child:
              const Text("OK"),

            )

          ],

        );

      },

    );


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title:
        const Text("Registration Form"),

      ),




      body: LayoutBuilder(

        builder: (context, constraints) {


          return SingleChildScrollView(


            child: Padding(

              padding:
              const EdgeInsets.all(20),


              child: Column(

                children: [



                  TextField(

                    controller:
                    nameController,


                    decoration:
                    const InputDecoration(

                      labelText: "Name",

                      prefixIcon:
                      Icon(Icons.person),

                    ),

                  ),




                  const SizedBox(height:20),




                  TextField(

                    controller:
                    emailController,


                    decoration:
                    const InputDecoration(

                      labelText: "Email",

                      prefixIcon:
                      Icon(Icons.email),

                    ),

                  ),




                  const SizedBox(height:20),





                  TextField(

                    controller:
                    passwordController,


                    obscureText: true,


                    decoration:
                    const InputDecoration(

                      labelText: "Password",

                      prefixIcon:
                      Icon(Icons.lock),

                    ),

                  ),





                  const SizedBox(height:20),




                  DropdownButtonFormField(


                    value: selectedRole,


                    decoration:
                    const InputDecoration(

                      labelText: "Role / Status",

                    ),



                    items: const [


                      DropdownMenuItem(

                        value:"Student",

                        child:
                        Text("Student"),

                      ),


                      DropdownMenuItem(

                        value:"Teacher",

                        child:
                        Text("Teacher"),

                      ),


                      DropdownMenuItem(

                        value:"Admin",

                        child:
                        Text("Admin"),

                      ),

                    ],




                    onChanged: (value){


                      setState(() {

                        selectedRole =
                            value.toString();

                      });


                    },


                  ),





                  const SizedBox(height:20),




                  if(errorMessage.isNotEmpty)


                    Text(

                      errorMessage,


                      style:
                      const TextStyle(

                        color: Colors.red,

                        fontSize: 16,

                      ),

                    ),





                  const SizedBox(height:20),





                  SizedBox(

                    width:
                    double.infinity,


                    child: ElevatedButton(


                      onPressed:
                      registerUser,


                      child:
                      const Text(
                        "Register",
                      ),


                    ),

                  )

                ],

              ),

            ),

          );


        },

      ),

    );


  }

}
