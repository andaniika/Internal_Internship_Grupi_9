import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


// APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],

        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),

      home: const ProductPage(),
    );
  }
}


// MAIN PAGE
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}


class _ProductPageState extends State<ProductPage> {


  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final emailController = TextEditingController();


  List<Map<String,String>> products = [

    {
      "name":"Laptop",
      "price":"900€",
      "email":"test@gmail.com"
    },

    {
      "name":"Phone",
      "price":"500€",
      "email":"user@gmail.com"
    }

  ];


  String error = "";


  void addProduct(){

    String name = nameController.text.trim();
    String price = priceController.text.trim();
    String email = emailController.text.trim();


    if(name.isEmpty || price.isEmpty || email.isEmpty){

      setState(() {
        error = "All fields are required!";
      });

      return;
    }


    if(!email.contains("@")){

      setState(() {
        error = "Email is not valid!";
      });

      return;
    }



    setState(() {

      products.add(
        {
          "name":name,
          "price":price,
          "email":email
        }
      );


      error="";

      nameController.clear();
      priceController.clear();
      emailController.clear();

    });

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text("Product Manager"),
      ),


      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [


            TextField(

              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Product Name",
              ),

            ),


            const SizedBox(height:15),



            TextField(

              controller: priceController,

              decoration: const InputDecoration(
                labelText: "Price",
              ),

            ),



            const SizedBox(height:15),



            TextField(

              controller: emailController,

              decoration: const InputDecoration(
                labelText: "Email",
              ),

            ),



            const SizedBox(height:15),



            if(error.isNotEmpty)

              Text(
                error,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize:16
                ),
              ),




            const SizedBox(height:15),



            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: addProduct,

                child: const Text("Add Product"),

              ),

            ),



            const SizedBox(height:20),




            Expanded(

              child: ListView.builder(

                itemCount: products.length,

                itemBuilder: (context,index){


                  return Card(

                    child: ListTile(

                      leading: const Icon(
                        Icons.shopping_cart,
                      ),


                      title: Text(
                        products[index]["name"]!,
                      ),


                      subtitle: Text(
                        "${products[index]["price"]}\n${products[index]["email"]}",
                      ),


                    ),

                  );

                },

              ),

            )


          ],

        ),

      ),

    );

  }

}
