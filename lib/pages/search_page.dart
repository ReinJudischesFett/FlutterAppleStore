// ignore_for_file: prefer_const_constructors

import 'package:apple_store/cubit/search/search_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state is SearchResult
            ? Scaffold(
                appBar: AppBar(
                  title: Text(state.query),
                ),
                body: state.productsByQuery.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.productsByQuery.length,
                        itemBuilder: (context, index) {
                          return ProductCard(state.productsByQuery[index]);
                        })
                    : Center(child: Text('no result:(')),
              )
            : Center(child: Text('no'));
      },
    );
  }
}
