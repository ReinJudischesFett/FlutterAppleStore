// ignore_for_file: prefer_const_constructors

import 'package:apple_store/cubit/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Pick your favourite', style: TextStyle(fontSize: 25)),
        SizedBox(height: 20),
        Text('Color - Silver'),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            colorDot(Colors.amber[100], context),
            const SizedBox(
              width: 15,
            ),
            colorDot(Colors.deepPurple[300], context),
            const SizedBox(
              width: 15,
            ),
            colorDot(Colors.grey[200], context),
            const SizedBox(
              width: 15,
            ),
            colorDot(Colors.grey[900], context),
          ],
        ),
      ],
    );
  }

  Widget colorDot(color, context) {
    var borderColor = Colors.grey[350];
    var currentState = BlocProvider.of<ProductCubit>(context).state;
    if (currentState is ProductStage1) {
      if (currentState.selectedColor == color) {
        borderColor = Colors.blue;
      }
    }
    if (currentState is ProductStage2) {
      if (currentState.selectedColor == color) {
        borderColor = Colors.blue;
      }
    }
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ProductCubit>(context).colorChosen(color);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: borderColor!, width: 2.0)),
        height: 50,
        width: 50,
      ),
    );
  }
}
