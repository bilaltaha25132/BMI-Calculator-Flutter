import 'package:bmi_calculator/results_page.dart';
import 'calculator_brain.dart';
import 'main.dart';
import 'bottombutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';

enum Gender { nonSelected, Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.nonSelected;
  double height = 180;
  int weight = 20;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gender.Male;
                      });
                    },
                    colour: gender == Gender.Male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(FontAwesomeIcons.mars, 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gender.Female;
                      });
                    },
                    colour: gender == Gender.Female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(FontAwesomeIcons.venus, 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Height',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            const Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 32.0),
                              thumbColor: Color(0xFFEB1555),
                              activeTrackColor: Colors.white,
                            ),
                            child: Slider(
                              value: height,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round().toDouble();
                                });
                              },
                              min: 120,
                              max: 220,
                              inactiveColor: Color(0xFF8D8E98),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4FE),
                                  child: const Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4FE),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4FE),
                                  child: const Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4FE),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              onTap: () {
                CalculatorBrain results =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: results.calculateBMI(),
                              resultText: results.getResult(),
                              interpretation: results.getInterpretation(),
                            )));
              },
              buttonTitle: 'Calculate'),
        ],
      ),
    );
  }
}
