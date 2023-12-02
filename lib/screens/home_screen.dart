import 'package:bola_8/const/style.dart';
import 'package:bola_8/screens/answer_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  final TextEditingController _questionController = TextEditingController();

  showAlertDialog(BuildContext context) {
    // Configura el botón OK
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop(); // Cierra la alerta
      },
      child: const Text('OK'),
    );

    // Crea la alerta
    AlertDialog alert = AlertDialog(
      title: const Text('Advertencia'),
      content: const Text('Por favor, ingrese una pregunta.'),
      actions: [
        okButton,
      ],
    );

    // Muestra la alerta
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _rotateAnimation =
        Tween<double>(begin: 0, end: 5).animate(_animationController);
  }

  void _rotateBall() {
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Center(
                  child: Text(
                    'Bola 8',
                    style: kTitleTextStyle,
                  ),
                ),
                Rotationimg(
                  rotateAnimation: _rotateAnimation,
                  urlimg: 'assets/images/bola_8.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextInput(
                        controller: _questionController,
                        hint: 'Pregunta',
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
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
                          if (_questionController.text.isNotEmpty) {
                            _rotateBall();
                            _rotateAnimation.addStatusListener(
                              (status) {
                                if (status == AnimationStatus.completed) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AnswerScreen(),
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            showAlertDialog(context);
                          }
                        },
                        child: const BtnPrimary(
                          hint: 'Pregunta',
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
}
