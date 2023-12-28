import 'package:fitness/models/category.dart';
import 'package:fitness/models/diet.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<DietModel> popular = [];

  void _initData() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popular = DietModel.getDiets();
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: ListView(
          children: [
            _searchBar(),
            const SizedBox(
              height: 48,
            ),
            _categories(),
            const SizedBox(
              height: 48,
            ),
            _dietsRecommend(),
            const SizedBox(
              height: 48,
            ),
            _populars(),
          ],
        ));
  }

  Padding _populars() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Popular',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                DietModel pop = popular[index];
                return Container(
                  width: double.infinity,
                  height: 115,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            blurRadius: 40)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.abc),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pop.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            Text(
                              '${pop.difficulty} | ${pop.minutes}min | ${pop.kcal} kcal',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        IconButton.outlined(
                            color: Colors.grey,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_right_outlined,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, i) => const SizedBox(height: 15),
              itemCount: popular.length)
        ],
      ),
    );
  }

  Column _dietsRecommend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor diet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 220,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (constex, index) {
                DietModel diet = diets[index];
                return Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: diet.color,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 45,
                        child: Icon(Icons.abc),
                      ),
                      Text(
                        diet.title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${diet.difficulty} | ${diet.minutes}min | ${diet.kcal}kcal',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              diet.isActive
                                  ? Colors.cyan[200]!
                                  : Colors.transparent,
                              diet.isActive
                                  ? Colors.blue[400]!
                                  : Colors.transparent
                            ]),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                                color:
                                    diet.isActive ? Colors.white : Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (_, i) => const SizedBox(
                    width: 25,
                  ),
              itemCount: diets.length),
        )
      ],
    );
  }

  Column _categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 130,
          child: ListView.separated(
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                CategoryModel cat = categories[index];
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: cat.backgroundColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(cat.icon), //SVG picture here
                            radius: 30,
                          ),
                        ),
                        Text(
                          cat.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                );
              }),
        )
      ],
    );
  }

  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.manage_search),
                  )
                ],
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          )),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu, size: 20))
      ],
      title: const Text(
        'Breakfast',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      centerTitle: true,
    );
  }
}
