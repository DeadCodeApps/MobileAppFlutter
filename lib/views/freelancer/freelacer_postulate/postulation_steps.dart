import 'dart:html';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/successful_postulation.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/models/postulation.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

class PostulationSteps extends StatefulWidget {
  final Offer offer;
  const PostulationSteps({required this.offer});
  //Use with widget.offer
  @override
  _PostulationStepsState createState() => _PostulationStepsState();
}

class _PostulationStepsState extends State<PostulationSteps> {
  int currentStep = 0;
  bool isChecked = false;
  bool showErrorMessage = false;
  bool isCompleted = false;

  final description = TextEditingController();
  final income = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreelanceWorld'),
        actions: [],
        backgroundColor: primaryColor,
      ),
      drawer: MenuPage(),
      body: isCompleted
          ? SuccessfulPostulation(
              offer: widget.offer,
              postulation: Postulation(
                  description: description.text,
                  desiredPayment: double.parse(income.text)))
          : Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: Colors.blue.shade900),
              ),
              child: Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepContinue: () {
                  final isLastStep = currentStep == getSteps().length - 1;
                  if (isLastStep) {
                    if (isChecked) {
                      setState(() => isCompleted = true);
                      setState(() => showErrorMessage = false);
                    } else {
                      setState(() => showErrorMessage = true);
                    }
                  } else {
                    setState(() => currentStep += 1);
                  }
                },
                onStepTapped: (step) => setState(() => currentStep = step),
                onStepCancel: currentStep == 0
                    ? null
                    : () => setState(() => currentStep -= 1),
                controlsBuilder: (context, ControlsDetails controls) {
                  final isLastStep = currentStep == getSteps().length - 1;
                  return Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text(isLastStep ? 'Finalizar' : 'Continuar'),
                            onPressed: controls.onStepContinue,
                          ),
                        ),
                        const SizedBox(width: 12),
                        if (currentStep != 0)
                          Expanded(
                            child: ElevatedButton(
                              child: Text('Atrás'),
                              onPressed: controls.onStepCancel,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Mensaje'),
          content: Column(children: <Widget>[
            TextFormField(
              maxLines: 15,
              controller: description,
              decoration: InputDecoration(labelText: 'Información adicional'),
            )
          ]),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Salario'),
          content: Column(children: <Widget>[
            TextFormField(
              controller: income,
              decoration: InputDecoration(labelText: 'Salario esperado'),
            )
          ]),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text('T&C'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://static.thenounproject.com/png/729549-200.png',
                    width: 250.0,
                  ),
                  Text(
                    "Declaro que toda la información enviada es completamente verídica y acepto las consecuencias respectivas, establecidas por la ley, con respecto a la falsificación de este tipo de información.",
                    style:
                        const TextStyle(fontSize: 18.0, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Acepto"),
                      Checkbox(
                        focusColor: Colors.blue.shade900,
                        activeColor: Colors.blue.shade900,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  showErrorMessage
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(80.0)),
                          child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                  'Por favor, acepta los términos y condiciones.')))
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ];
}
