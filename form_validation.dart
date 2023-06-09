import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Validation"),
        ),
        body:
        Center(
          child:Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              width: 300,
              child:Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Please enter your name"),
                              MaxLengthValidator(34, errorText: "Name must be less than 34 character"),
                              MinLengthValidator(4, errorText: "Name b/w 4 and 34 characters"),

                            ]
                        ),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            suffixIcon: Icon(Icons.person),
                            labelText: "Enter your name",
                            hintText: "Name",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                )
                            )
                        )


                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Please enter email"),

                              EmailValidator(errorText: "Please enter validate email"),
                            ]
                        ),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            suffixIcon: Icon(Icons.mail),
                            labelText: "Enter your E-mail",
                            hintText: "E-mail",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                )
                            )
                        )
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Please enter Password"),
                              MaxLengthValidator(16, errorText: "Name must 4 & 16 character"),
                              MinLengthValidator(4, errorText: "Name b/w 4 & 16 characters"),
                            ]
                        ),

                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            suffixIcon: Icon(Icons.password),
                            labelText: "Enter password",
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            )
                        )
                    ),
                    TextFormField(

                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Please enter Phone number"),
                              MinLengthValidator(11, errorText: 'Phone number must be at least 11 digits long with 03'),



                            ]
                        ),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            suffixIcon: Icon(Icons.call),
                            labelText: "Enter your Phone number",
                            hintText: "Phone number",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                )
                            )
                        )
                    ),
                    ElevatedButton(onPressed: (){
                      _formKey.currentState?.validate();

                    }, child: Text("Login"))

                  ],



                ),
              ),

            ),
          ),
        )
    );
  }

}