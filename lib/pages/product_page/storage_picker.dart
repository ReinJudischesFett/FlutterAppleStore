// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apple_store/cubit/product/product_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StoragePicker extends StatelessWidget {
  const StoragePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final currentState = BlocProvider.of<ProductCubit>(context).state;
    String selectedStorage = '';
    if (currentState is ProductStage2) {
      selectedStorage = currentState.selectedStorage;
    }
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Text('Capacity:', style: TextStyle(fontSize: 18))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => BlocProvider.of<ProductCubit>(context)
                    .storageChosen('128GB'),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selectedStorage == '128GB'
                          ? Colors.blue
                          : Colors.black,
                    ),
                  ),
                  height: 40,
                  width: 60,
                  child: Text('128GB'),
                ),
              ),
              GestureDetector(
                onTap: () => BlocProvider.of<ProductCubit>(context)
                    .storageChosen('256GB'),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selectedStorage == '256GB'
                          ? Colors.blue
                          : Colors.black,
                    ),
                  ),
                  height: 40,
                  width: 60,
                  child: Text('256GB'),
                ),
              ),
              GestureDetector(
                onTap:() => BlocProvider.of<ProductCubit>(context)
                    .storageChosen('512GB'),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selectedStorage == '512GB'
                            ? Colors.blue
                            : Colors.black,
                    ),
                  ),
                  height: 40,
                  width: 70,
                  child: Text('512GB'),
                ),
              ),
              GestureDetector(
                onTap: () => BlocProvider.of<ProductCubit>(context)
                    .storageChosen('1TB'),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selectedStorage == '1TB'
                            ? Colors.blue
                            : Colors.black,
                    ),
                  ),
                  height: 40,
                  width: 60,
                  child: Text('1TB'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
