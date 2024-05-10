import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvmm_auth_demo/presentation/controller/app/bloc/app_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) => state.user.isEmpty
            ? Container()
            : Center(
                child: Text(state.user.name!),
              ),
      ),
    );
  }
}
