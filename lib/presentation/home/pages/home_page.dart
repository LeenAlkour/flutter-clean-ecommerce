import 'package:e_commerce/common/widgets/spacing/spacing.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/presentation/home/widgets/categories.dart';
import 'package:e_commerce/presentation/home/widgets/header.dart';
import 'package:e_commerce/presentation/home/widgets/new_in.dart';
import 'package:e_commerce/presentation/home/widgets/search_field.dart';
import 'package:e_commerce/presentation/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            GestureDetector(
              onTap: () {
                context.push(Routes.searchPage);
              },
              child: SearchField(),
            ),
            Categories(),
            TopSelling(),
            verticalSpace(20),
            NewIn(),
            verticalSpace(20),

          ],
        ),
      ),
    );
  }
}
