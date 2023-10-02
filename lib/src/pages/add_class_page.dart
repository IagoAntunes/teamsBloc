import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/styles/app_colors.dart';
import '../bloc/classes/classes_bloc.dart';
import '../bloc/classes/classes_events.dart';

class AddClassPage extends StatelessWidget {
  AddClassPage({super.key});
  final keyForm = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray600,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white),
        actions: [
          Image.asset(
            'assets/images/logo.png',
            width: 48,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 100,
              ),
              Icon(
                Icons.group,
                color: AppColors.green500,
                size: 48,
              ),
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
                  filled: true,
                  fillColor: AppColors.gray700,
                  errorStyle: GoogleFonts.roboto(
                    color: Theme.of(context).colorScheme.error,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none),
                  hintText: 'Nome da turma',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppColors.gray300,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
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
                    if (keyForm.currentState!.validate()) {
                      BlocProvider.of<ClassesBloc>(context).add(
                        AddClassEvent(
                          nameClass: controller.text,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Criar",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
