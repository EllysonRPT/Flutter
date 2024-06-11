import 'package:exemplo_firebase/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthServices _service = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //form register screen
      body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
              child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(hintText: 'Email'),
                            validator: (value) {
                              if(value!.isEmpty){
                    return 'Insira um e-mail';
                  }
                    return null;
                            }),
                        TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(hintText: 'Password'),
                            validator: (value) {}),
                        TextFormField(
                            controller: _confirmedPasswordController,
                            decoration:
                                InputDecoration(hintText: 'Confimed Password'),
                            validator: (value) {}),
                        SizedBox(
                          height: 20,
                        ),
                        //Elevetead button
                       ElevatedButton(
                  onPressed: (){ _registrarUser();},
                  child: Text('Registrar'),
                )],
                      )))),
    );
  }
  // bool emailExists = await _auth.checkIfEmailExists(_emailController.text);
  Future<void> _registrarUser() async {
    
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text == _confirmedPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Register Successful'),
          ),
        );
             _service.registerUsuario(
            _emailController.text, _confirmedPasswordController.text);
        //navegação para págian interna
               Navigator.pushNamed(context, '/login');

        
      }
      //  else if (_emailController ) {}
       else if (_passwordController.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('As senhas menor que 6 digitos'),
          ),
        );
        _passwordController.clear();
        _confirmedPasswordController.clear();
        return null;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('As senhas não conferem!'),
          ),
        );
        _passwordController.clear();
        _confirmedPasswordController.clear();
       
      }
    }
  }
}
