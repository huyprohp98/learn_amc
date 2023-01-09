import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_amc/bloc/bloc_auth/auth_bloc.dart';
import 'package:learn_flutter_amc/bloc/bloc_auth/auth_state.dart';
import 'package:learn_flutter_amc/data/repositories/auth_repository.dart';
import 'package:learn_flutter_amc/ui/features/account/login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    final user = FirebaseAuth.instance.currentUser != null
        ? FirebaseAuth.instance.currentUser!
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                // Navigate to the sign in screen when the user Signs Out
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                        AutoRouter.of(context).pop();

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
    );
  }
}
