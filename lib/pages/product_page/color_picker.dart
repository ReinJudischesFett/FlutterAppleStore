// ignore_for_file: prefer_const_constructors

import 'package:apple_store/cubit/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apple_store/config/apple_colors.dart';

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
        //TODO row 
        Text('Color - Silver'),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            colorDot(gold, context),
            const SizedBox(
              width: 15,
            ),
            colorDot(deepPurple, context),
            const SizedBox(
              width: 15,
            ),
            colorDot(silver, context),
            const SizedBox(
              width: 15,
            ),
            colorDot(spaceBlack, context),
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
        // stage 1 - border color, change image, scroll, put color in model
      },
      child: Container( 
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: borderColor!, width: 2.0),),
        height: 50,
        width: 50,
      ),
    );
  }
}
