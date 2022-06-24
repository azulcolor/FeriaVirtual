import 'package:feriavirtual/features/auth/test_screens/widgets_test/custom_button.dart';
import 'package:feriavirtual/features/auth/test_screens/widgets_test/custom_textfield.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:feriavirtual/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  final TextEditingController _NombreController = TextEditingController();
  final TextEditingController _Apellido_PController = TextEditingController();
  final TextEditingController _lastNameMController = TextEditingController();
  final TextEditingController _Correo_ElectronicoController =
      TextEditingController();
  final TextEditingController _TelefonoController = TextEditingController();
  final TextEditingController _EscuelaController = TextEditingController();
  final TextEditingController _Area_IDController = TextEditingController();
  final TextEditingController _MotivoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _NombreController.dispose();
    _Apellido_PController.dispose();
    _lastNameMController.dispose();
    _Correo_ElectronicoController.dispose();
    _TelefonoController.dispose();
    _EscuelaController.dispose();
    _Area_IDController.dispose();
    _MotivoController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      Nombre: _NombreController.text,
      Apellido_P: _Apellido_PController.text,
      Apellido_M: _lastNameMController.text,
      Correo_Electronico: _Correo_ElectronicoController.text,
      Telefono: _TelefonoController.text,
      Escuela: _EscuelaController.text,
      Area_ID: _Area_IDController.text,
      Motivo: _MotivoController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      Correo_Electronico: _Correo_ElectronicoController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    tileColor: _auth == Auth.signup
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundCOlor,
                    title: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signup,
                      groupValue: _auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                  if (_auth == Auth.signup)
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _NombreController,
                              hintText: 'Nombre',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _Apellido_PController,
                              hintText: 'Apellido Paterno',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _lastNameMController,
                              hintText: 'Apellido Materno',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _Correo_ElectronicoController,
                              hintText: 'Correo Electronico',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _TelefonoController,
                              hintText: 'Numero de Telefono',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _EscuelaController,
                              hintText: 'Escuela',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _Area_IDController,
                              hintText: 'Area',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _MotivoController,
                              hintText: 'Motivo',
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Sign Up',
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ListTile(
                    tileColor: _auth == Auth.signin
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundCOlor,
                    title: const Text(
                      'Sign-In.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signin,
                      groupValue: _auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                  if (_auth == Auth.signin)
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _Correo_ElectronicoController,
                              hintText: 'Correo Electronico',
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Sign In',
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  signInUser();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
