import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teams/core/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teams/src/bloc/participants/participants_bloc.dart';
import 'package:teams/src/pages/add_class_page.dart';

import '../bloc/classes/classes_bloc.dart';
import '../bloc/classes/classes_events.dart';
import '../bloc/classes/classes_states.dart';
import 'info_class_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClassesBloc>(context).add(GetClassesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray600,
      body: SafeArea(
        child: Column(
          children: [
            //
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 60,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Turmas",
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Text(
              "jogue com a sua turma",
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.gray300,
              ),
            ),
            BlocBuilder(
              bloc: BlocProvider.of<ClassesBloc>(context),
              builder: (context, state) {
                return switch (state.runtimeType) {
                  LoadingClassesState => const CircularProgressIndicator(),
                  FailureClassesState => const Text("Lista vazia"),
                  SuccesLoadedClassesState => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                  itemCount: (state as SuccesLoadedClassesState)
                                      .listClassModel
                                      .listClassModel
                                      .length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 16),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        //
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BlocProvider(
                                              create: (context) =>
                                                  ParticipantBloc(),
                                              child: InfoClassPage(
                                                classModel: state.listClassModel
                                                    .listClassModel[index],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 32),
                                        decoration: BoxDecoration(
                                          color: AppColors.gray500,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.group,
                                              color: AppColors.green500,
                                              size: 32,
                                            ),
                                            const SizedBox(width: 32),
                                            Text(
                                              state.listClassModel
                                                  .listClassModel[index].name,
                                              style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  _ => Container(),
                };
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    backgroundColor: AppColors.green700,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddClassPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Criar nova turma",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
