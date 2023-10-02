import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teams/core/models/class_model.dart';
import 'package:teams/core/models/participants_model.dart';
import 'package:teams/core/styles/app_colors.dart';
import 'package:teams/src/bloc/participants/participants_bloc.dart';
import 'package:teams/src/bloc/participants/participants_events.dart';
import 'package:teams/src/bloc/participants/participants_states.dart';

import '../bloc/classes/classes_bloc.dart';
import '../bloc/classes/classes_events.dart';

class InfoClassPage extends StatelessWidget {
  InfoClassPage({
    super.key,
    required this.classModel,
  });
  final ClassModel classModel;
  final TextEditingController controller = TextEditingController();
  final teamSelected = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray600,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        actions: [
          Image.asset(
            'assets/images/logo.png',
            width: 48,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "NovaTurma",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Text(
              "crie uma turma para adicionar pessoas",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.gray300,
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: controller,
              style: GoogleFonts.roboto(color: AppColors.white),
              validator: (value) {
                if (value == null) {
                  return 'Campo Obrigatório!';
                }
                if (value.isEmpty) {
                  return "Campo Obrigatório!";
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: AppColors.green500,
                  ),
                  onPressed: () {
                    //
                    if (teamSelected.value == 0) {
                      BlocProvider.of<ParticipantBloc>(context).add(
                        AddParticipantEvent(
                          classModel: classModel,
                          indexTeam: 0,
                          name: controller.text,
                        ),
                      );
                    } else if (teamSelected.value == 1) {
                      BlocProvider.of<ParticipantBloc>(context).add(
                        AddParticipantEvent(
                          classModel: classModel,
                          indexTeam: 1,
                          name: controller.text,
                        ),
                      );
                    }
                  },
                ),
                filled: true,
                fillColor: AppColors.gray700,
                errorStyle: GoogleFonts.roboto(
                  color: Theme.of(context).colorScheme.error,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none),
                hintText: 'Nome do participante',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.gray300,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: teamSelected,
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            teamSelected.value = 0;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              border: teamSelected.value == 0
                                  ? Border.all(
                                      color: AppColors.green500,
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "Time A",
                              style: GoogleFonts.roboto(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    ValueListenableBuilder(
                      valueListenable: teamSelected,
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            teamSelected.value = 1;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              border: teamSelected.value == 0
                                  ? null
                                  : Border.all(
                                      color: AppColors.green500,
                                    ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "Time A",
                              style: GoogleFonts.roboto(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
                Text(
                  "2",
                  style: GoogleFonts.roboto(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ValueListenableBuilder(
              valueListenable: teamSelected,
              builder: (context, value, child) {
                return Expanded(
                  child: BlocBuilder(
                    bloc: BlocProvider.of<ParticipantBloc>(context),
                    builder: (context, state) {
                      print("Teste");
                      print(classModel.teamA.length);
                      return switch (state) {
                        LoadingParticipantState =>
                          const CircularProgressIndicator(),
                        SuccessParticipantState => ListView.separated(
                            itemCount: teamSelected.value == 0
                                ? classModel.teamA.length
                                : classModel.teamB.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                color: AppColors.gray500,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: AppColors.gray200,
                                ),
                                title: Text(
                                  classModel.teamA[index].name,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.gray200,
                                  ),
                                ),
                                subtitle: Text("oi"),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove_road),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        _ => Container(),
                      };
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    backgroundColor: AppColors.redDark,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    BlocProvider.of<ClassesBloc>(context).add(DeleteClassEvent(
                      classModel: classModel,
                    ));
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Remover turma",
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
