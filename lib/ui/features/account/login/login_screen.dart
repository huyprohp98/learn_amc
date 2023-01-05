import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_amc/bloc/bloc_auth/auth_bloc.dart';
import 'package:learn_flutter_amc/bloc/bloc_auth/auth_state.dart';
import 'package:learn_flutter_amc/ui/features/home/home_screen.dart';
import 'package:learn_flutter_amc/ui/features/home/test_screen.dart';
import 'package:learn_flutter_amc/ui/theme/app_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _passWord = TextEditingController();
  String usename = '';
  String passWord = ''; // final ValueChanged<String> onSubmit;

  bool _passwordVisible = false;
  bool _checkPassword = false;
  bool _checkUserName = false;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    _passwordVisible = false;
    _isButtonDisabled = true;
    _checkPassword = false;
    _checkUserName = false;
    // _userName.text = 'test';
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _userName.dispose();
    _passWord.dispose();

    super.dispose();
  }

  String? get _errorUserName {
    if (usename.isEmpty) {
      // setState(() {
      //   _checkUserName = false;
      // });
      return 'Can\'t be empty';
    }
    if (usename.length < 4) {
      // setState(() {
      //   _checkUserName = false;
      // });
      // setState(() {
      //   _checkUserName = true;
      // });
      return 'Too short';
    }

    // return null if the text is valid
    return null;
  }

  String? get _errorPassWord {
    if (passWord.isEmpty) {
      // setState(() {
      //   _checkPassword = false;
      // });
      return 'Can\'t be empty';
    }
    if (passWord.length < 4) {
      // setState(() {
      //   _checkPassword = false;
      // });
      // setState(() {
      //   _checkPassword = true;
      // });
      return 'Too short';
    }

    // return null if the text is valid
    return null;
  }

// void _submit() {
//     // if there is no error text
//     if (_errorText == null) {
//       // notify the parent widget via the onSubmit callback
//       widget.onSubmit(_userName.value.text);
//     }
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("dang load")));
        }
        if (state is Authenticated) {
          // Navigating to the dashboard screen if the user is authenticated
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
        if (state is UnAuthenticated) {
          // Showing the error message if the user has entered invalid credentials
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("chua xac thuc")));
        }
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            // Showing the loading indicator while the user is signing in
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Form(
            key: formKey,
            child: Stack(alignment: Alignment.center, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  AppImages.bgApp,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 82),
                    child: Container(
                      width: 233,
                      height: 54,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.logoApp),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    height: 64,
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, top: 107),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: InputBorder.none,
                          // errorText: _errorUserName,
                          label: RichText(
                            text: const TextSpan(
                              text: 'Tên đăng nhập',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.red)),
                              ],
                            ),
                          )
                          // labelText: "Tên đăng nhập",
                          ),
                      // onChanged: (text) => {setState((() => usename = text))},
                      controller: _userName,
                    ),
                  ),
                  Container(
                    height: 64,
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      // autofocus: true,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: InputBorder.none,
                          // errorText: _errorPassWord,
                          suffixIcon: IconButton(
                            onPressed: () => {
                              // setState(() {
                              //   _passwordVisible = !_passwordVisible;
                              // })
                            },
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          label: RichText(
                            text: const TextSpan(
                              text: 'Mật khẩu',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.red)),
                              ],
                            ),
                          )
                          // labelText: "Tên đăng nhập",
                          ),
                      // onChanged: (text) => {setState((() => passWord = text))},

                      controller: _passWord,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 40),
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () => {
                        context
                            .read<AuthBloc>()
                            .signInRequested(_userName.text, _passWord.text)
                      },
                      child: const Text('Đăng nhập'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 40),
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () => {
                        context
                            .read<AuthBloc>()
                            .signUpRequested(_userName.text, _passWord.text)
                      },
                      child: const Text('Đăng ký'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 40),
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () => {
                        context.read<AuthBloc>().googleSignInRequested(
                            _userName.text, _passWord.text)
                      },
                      child: const Text('Đăng nhập google'),
                    ),
                  ),
                ],
              )
            ]),
          );
        },
      ),

      // child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) => {}),
    ));
  }
}
// Form(
//           key: formKey,
//           child: Stack(alignment: Alignment.center, children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: Image.asset(
//                 AppImages.bgApp,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 82),
//                   child: Container(
//                     width: 233,
//                     height: 54,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage(AppImages.logoApp),
//                             fit: BoxFit.cover)),
//                   ),
//                 ),
//                 Container(
//                   height: 64,
//                   margin: const EdgeInsets.only(left: 16, right: 16, top: 107),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 12),
//                         border: InputBorder.none,
//                         // errorText: _errorUserName,
//                         label: RichText(
//                           text: const TextSpan(
//                             text: 'Tên đăng nhập',
//                             style: TextStyle(fontSize: 13, color: Colors.black),
//                             children: <TextSpan>[
//                               TextSpan(
//                                   text: '*',
//                                   style: TextStyle(
//                                       fontSize: 13, color: Colors.red)),
//                             ],
//                           ),
//                         )
//                         // labelText: "Tên đăng nhập",
//                         ),
//                     // onChanged: (text) => {setState((() => usename = text))},
//                     controller: _userName,
//                   ),
//                 ),
//                 Container(
//                   height: 64,
//                   margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: TextField(
//                     // autofocus: true,
//                     obscureText: !_passwordVisible,
//                     decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 12),
//                         border: InputBorder.none,
//                         // errorText: _errorPassWord,
//                         suffixIcon: IconButton(
//                           onPressed: () => {
//                             // setState(() {
//                             //   _passwordVisible = !_passwordVisible;
//                             // })
//                           },
//                           icon: Icon(
//                             _passwordVisible
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                           ),
//                         ),
//                         label: RichText(
//                           text: const TextSpan(
//                             text: 'Mật khẩu',
//                             style: TextStyle(fontSize: 13, color: Colors.black),
//                             children: <TextSpan>[
//                               TextSpan(
//                                   text: '*',
//                                   style: TextStyle(
//                                       fontSize: 13, color: Colors.red)),
//                             ],
//                           ),
//                         )
//                         // labelText: "Tên đăng nhập",
//                         ),
//                     // onChanged: (text) => {setState((() => passWord = text))},

//                     controller: _passWord,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 16, right: 16, top: 40),
//                   width: MediaQuery.of(context).size.width,
//                   height: 64,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         textStyle: const TextStyle(fontSize: 20)),
//                     // onPressed: _checkPassword == true && _checkUserName == true
//                     //     ? () => {}
//                     //     : null,
//                     onPressed: () => {
//                       context
//                           .read<AuthBloc>()
//                           .signInRequested(_userName.text, _passWord.text)
//                     },
//                     child: const Text('Đăng nhập'),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => {
//                     context
//                         .read<AuthBloc>()
//                         .signUpRequested(_userName.text, _passWord.text)
//                   },
//                   child: const Text("Đăng ký"),
//                 )
//               ],
//             )
//           ]),
//         ),