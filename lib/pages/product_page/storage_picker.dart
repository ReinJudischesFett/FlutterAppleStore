// ignore_for_file: prefer_const_constructors

import 'package:apple_store/cubit/product/product_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StoragePicker extends StatefulWidget {
  const StoragePicker({super.key});

  @override
  State<StoragePicker> createState() => _StoragePickerState();
}

class _StoragePickerState extends State<StoragePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Storage', style: TextStyle(fontSize: 25)),
        SizedBox(height: 20),
        Text('How much space do you need?'),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: [
              storageSizeBox('128 GB', 'from \$1099', context),
              SizedBox(height: 15),
              storageSizeBox('256 GB', 'from \$1199', context),
              SizedBox(height: 15),
              storageSizeBox('512 GB', 'from \$1399', context),
              SizedBox(height: 15),
              storageSizeBox('1 TB', 'from \$1599', context),
            ],
          ),
        ),
      ],
    );
  }

  Widget storageSizeBox(String size, String price, context) {
    Color borderColor = Colors.grey;
    var currentState = BlocProvider.of<ProductCubit>(context).state;
    if (currentState is ProductStage2) {
      if (currentState.selectedStorage == size) {
        borderColor = Colors.black;
      }
    }
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ProductCubit>(context).storageChosen(size);
      },
      child: Container(
        height: 80,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              size,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              price,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
