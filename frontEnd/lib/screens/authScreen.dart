import 'package:feriavirtual/components/customButton.dart';
import 'package:feriavirtual/components/customTextfield.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:feriavirtual/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

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
  Auth _auth = Auth.signin;
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
  late SingleValueDropDownController _cntController =
      SingleValueDropDownController();

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
    _cntController.dispose();
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
      Area_ID: _cntController.dropDownValue?.value.toString(),
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
  void initState() {
    _cntController = SingleValueDropDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 56,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              '¡Bienvenido!',
                              textAlign: TextAlign.center,
                              style: GlobalVariables.h1B,
                            ))
                      ]),
                    ),
                  ),
                  ListTile(
                    tileColor: _auth == Auth.signin
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.backgroundColor,
                    title: const Text(
                      'Iniciar sesión',
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
                              icon: Icons.email,
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Iniciar sesión',
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  signInUser();
                                }
                              },
                              color: GlobalVariables.primaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ListTile(
                    tileColor: _auth == Auth.signup
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.backgroundColor,
                    title: const Text(
                      'Crear una cuenta',
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
                              icon: Icons.person,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _Apellido_PController,
                              hintText: 'Apellido Paterno',
                              icon: Icons.person,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _lastNameMController,
                              hintText: 'Apellido Materno',
                              icon: Icons.person,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _Correo_ElectronicoController,
                              hintText: 'Correo Electronico',
                              icon: Icons.mail,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                                controller: _TelefonoController,
                                hintText: 'Numero de Telefono',
                                icon: Icons.phone),
                            const SizedBox(height: 10),
                            CustomTextField(
                                controller: _EscuelaController,
                                hintText: 'Escuela',
                                icon: Icons.school_rounded),
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
                            DropDownTextField(
                              // initialValue: "name4",
                              singleController: _cntController,
                              clearOption: false,
                              enableSearch: true,
                              textFieldDecoration:
                                  InputDecoration(hintText: "buenas"),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Ingresa tu Área";
                                }
                                return null;
                              },
                              dropDownItemCount: 6,
                              dropDownList: const [
                                DropDownValueModel(name: 'name1', value: 1),
                                DropDownValueModel(
                                    name: 'name2',
                                    value: 2,
                                    toolTipMsg:
                                        "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                DropDownValueModel(name: 'name3', value: 3),
                                DropDownValueModel(
                                    name: 'name4',
                                    value: 4,
                                    toolTipMsg:
                                        "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                DropDownValueModel(name: 'name5', value: 5),
                                DropDownValueModel(name: 'name6', value: 6),
                                DropDownValueModel(name: 'name7', value: 7),
                                DropDownValueModel(name: 'name8', value: 8),
                              ],
                              onChanged: (val) {},
                            ),
                            CustomButton(
                              text: 'Registrarte',
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              },
                              color: GlobalVariables.primaryColor,
                            ),
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
