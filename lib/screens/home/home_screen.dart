import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_complaints_system/data/api/agencies_api.dart';
import 'package:government_complaints_system/logic/agencies_cubit/agencies_cubit.dart';

import '../../data/repo/agencies_repo.dart';
import '../../utils/constants.dart';
import 'build_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgenciesCubit(
        agenciesRepo: AgenciesRepo(agenciesApi: AgenciesApi()),
      ),
      child: BlocBuilder<AgenciesCubit, AgenciesState>(
        builder: (context, state) {
          if (state.status == AgenciesStatus.loading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CircularProgressIndicator(color: defaultColor),
              ),
            );
          }
          if (state.status == AgenciesStatus.error) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.error.isEmpty
                    ? 'Error loading courses'
                    : state.error,
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          }
          return GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 1,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (BuildContext context, int index) =>
                buildItems(context, state.agencies[index]),
            itemCount: state.agencies.length,
          );
        },
      ),
    );
  }
}


