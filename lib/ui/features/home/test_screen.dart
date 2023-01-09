import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_amc/bloc/bloc_auth/auth_bloc.dart';
import 'package:learn_flutter_amc/bloc/bloc_auth/auth_state.dart';
import 'package:learn_flutter_amc/data/repositories/auth_repository.dart';
import 'package:learn_flutter_amc/ui/features/account/login/login_screen.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final user = FirebaseAuth.instance.currentUser != null
      ? FirebaseAuth.instance.currentUser!
      : null;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          home: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is UnAuthenticated) {
                  // Navigate to the sign in screen when the user Signs Out
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                }
              },
              child: BlocBuilder<AuthBloc, dynamic>(
                builder: (context, state) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Email: \n ${user?.email}',
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      user?.photoURL != null
                          ? Image.network("${user?.photoURL}")
                          : Container(),
                      user?.displayName != null
                          ? Text("${user?.displayName}")
                          : Container(),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        child: const Text('Sign Out'),
                        onPressed: () {
                          // Signing out the user
                          context.read<AuthBloc>().signOutRequested();
                          Navigator.pop(context);

                          // Navigator.of(context).pop();
                          // Navigator.of(context).pushAndRemoveUntil(
                          //   MaterialPageRoute(
                          //       builder: (context) => const LoginScreen()),
                          //   (route) => false,
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: Text("MAn tets")),
    //   body: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: GestureDetector(
    //       onTap: () {
    //         Navigator.pop(context);
    //       },
    //       child: Text("quay lai"),
    //     ),
    //   ),
    // );
  }
}
