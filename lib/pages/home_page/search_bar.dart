// ignore_for_file: prefer_const_constructors

import 'package:apple_store/cubit/search/search_cubit.dart';
import 'package:apple_store/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: TextField(
          controller: searchController,
          onSubmitted: (query) {
            BlocProvider.of<SearchCubit>(context).makeQuery(query);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SearchPage(),
              ),
            );
            searchController.clear();
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'search',
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}
