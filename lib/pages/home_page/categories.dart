// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apple_store/cubit/search/search_cubit.dart';
import 'package:apple_store/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                BlocProvider.of<SearchCubit>(context).makeQuery('macbook');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: Chip(
                backgroundColor: Colors.white,
                label: Column(
                  children: [
                    Icon(Icons.laptop_mac),
                    Text('mac'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<SearchCubit>(context).makeQuery('iphone');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: Chip(
                backgroundColor: Colors.white,
                label: Column(
                  children: [
                    Icon(Icons.phone_iphone),
                    Text('iphone'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<SearchCubit>(context).makeQuery('ipad');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: Chip(
                backgroundColor: Colors.white,
                label: Column(
                  children: [
                    Icon(Icons.tablet_mac),
                    Text('ipad'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<SearchCubit>(context).makeQuery('apple watch');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: Chip(
                backgroundColor: Colors.white,
                label: Column(
                  children: [
                    Icon(Icons.watch),
                    Text('watch'),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
