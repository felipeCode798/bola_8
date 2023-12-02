import 'package:bola_8/const/answer.dart';
import 'package:bola_8/models/answer_model.dart';
import 'package:bola_8/screens/home_screen.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({Key? key}) : super(key: key);
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 5), // Ajusta la duración según tus preferencias
    );

    _rotateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve:
            Curves.linear, // Usa una curva lineal para hacer un bucle continuo
      ),
    );

    _animationController.repeat(); // Repite la animación continuamente
  }

  Answer getRandomAnswer() {
    Random random = Random();
    int randomIndex = random.nextInt(answers.length);
    return answers[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    // Obtén una respuesta aleatoria
    Answer randomAnswer = getRandomAnswer();

    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Rotationimg(
                  rotateAnimation: _rotateAnimation,
                  urlimg: 'assets/images/bola_8.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    randomAnswer.answers ?? 'No hay respuesta',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(double.infinity, 5),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: const BtnPrimary(
                          hint: 'Volver a preguntar',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Importante para liberar recursos
    super.dispose();
  }
}
