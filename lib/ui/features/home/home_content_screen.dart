import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_amc/bloc/bloc_auth/auth_bloc.dart';

class HomeContentScreen extends StatelessWidget {
  var user;
  HomeContentScreen({super.key, @required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
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
              Navigator.of(context).pop();
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(builder: (context) => const LoginScreen()),
              //   (route) => false,
              // );
            },
          ),
        ],
      ),
    );
  }
}
