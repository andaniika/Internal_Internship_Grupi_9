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
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


// MODEL

class Student {

  String name;
  String email;
  String role;

  Student({
    required this.name,
    required this.email,
    required this.role,
  });
}



// HOME

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {


  List<Student> students = [

    Student(
      name: "Lisa",
      email: "lisa@gmail.com",
      role: "Flutter Developer",
    ),

    Student(
      name: "Student 2",
      email: "student@gmail.com",
      role: "Designer",
    )

  ];



  void deleteStudent(int index){

    setState(() {

      students.removeAt(index);

    });

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text("Student Manager"),
        centerTitle: true,
      ),


      body: ListView.builder(

        itemCount: students.length,

        itemBuilder: (context,index){

          final student = students[index];


          return Card(

            margin: const EdgeInsets.all(10),

            child: ListTile(

              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),


              title: Text(student.name),

              subtitle: Text(student.email),



              onTap: (){


                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (_) => DetailsPage(
                      student: student,
                    ),

                  ),

                );


              },


              trailing: IconButton(

                icon: const Icon(Icons.delete),

                onPressed: (){

                  deleteStudent(index);

                },

              ),


            ),

          );

        },

      ),



      floatingActionButton: FloatingActionButton(

        child: const Icon(Icons.add),


        onPressed: () async{


          final result = await Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) => const AddStudentPage(),

            ),

          );



          if(result != null){

            setState(() {

              students.add(result);

            });

          }


        },

      ),

    );

  }

}




// ADD FORM

class AddStudentPage extends StatefulWidget {

  const AddStudentPage({super.key});


  @override
  State<AddStudentPage> createState()=>_AddStudentPageState();

}



class _AddStudentPageState extends State<AddStudentPage>{


  final nameController = TextEditingController();

  final emailController = TextEditingController();



  void save(){


    String name = nameController.text.trim();

    String email = emailController.text.trim();



    if(name.isEmpty ||
        email.isEmpty ||
        !email.contains("@")){


      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text("Enter valid information"),
        ),

      );


      return;

    }




    Navigator.pop(

      context,


      Student(

        name: name,

        email: email,

        role: "Student",

      ),

    );


  }





  @override
  Widget build(BuildContext context){


    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Student"),
      ),



      body: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(

          children: [


            TextField(

              controller: nameController,

              decoration: const InputDecoration(

                labelText: "Name",

                border: OutlineInputBorder(),

              ),

            ),


            const SizedBox(height:20),



            TextField(

              controller: emailController,

              decoration: const InputDecoration(

                labelText: "Email",

                border: OutlineInputBorder(),

              ),

            ),



            const SizedBox(height:30),



            ElevatedButton(

              onPressed: save,

              child: const Text("Save"),

            )


          ],

        ),

      ),

    );

  }

}






// DETAILS PAGE

class DetailsPage extends StatelessWidget {


  final Student student;


  const DetailsPage({

    super.key,

    required this.student,

  });



  @override
  Widget build(BuildContext context){


    return Scaffold(

      appBar: AppBar(

        title: const Text("Details"),

      ),



      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [


            const Icon(
              Icons.person,
              size:100,
            ),


            Text(

              student.name,

              style: const TextStyle(
                fontSize:25,
                fontWeight: FontWeight.bold,
              ),

            ),



            Text(student.email),


            Text(student.role),


          ],

        ),

      ),

    );

  }

}
