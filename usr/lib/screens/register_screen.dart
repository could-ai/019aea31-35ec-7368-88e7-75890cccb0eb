import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registracija'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Vartotojo vardas'),
                validator: (value) =>
                    value!.isEmpty ? 'Įveskite vartotojo vardą' : null,
                onSaved: (value) => _username = value!,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'El. paštas'),
                validator: (value) =>
                    value!.isEmpty ? 'Įveskite el. paštą' : null,
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Slaptažodis'),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Įveskite slaptažodį' : null,
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Implement registration logic
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: const Text('Registruotis'),
              ),
               TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Jau turite paskyrą? Prisijunkite'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
