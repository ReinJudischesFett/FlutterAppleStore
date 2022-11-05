import 'package:apple_store/cubit/cart/cart_cubit.dart';
import 'package:apple_store/cubit/product/product_cubit.dart';
import 'package:apple_store/cubit/search/search_cubit.dart';
import 'package:apple_store/pages/home_page/home_page.dart';
import 'package:apple_store/test_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          lazy: false,
          create: (_) => CartCubit(),
        ),
        BlocProvider<ProductCubit>(
          lazy: false,
          create: (_) => ProductCubit(),
        ),
        BlocProvider<SearchCubit>(
          lazy: false,
          create: (_) => SearchCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey[350],
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
              )),
        ),
        home: const HomePage(),
       // home: const TestSlivers(),
      ),
    );
  }
}
