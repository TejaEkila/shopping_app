// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:bagmore/Constants/const.dart';
import 'package:bagmore/Home/Hotsale/girlshoodies.dart';
import 'package:bagmore/Home/Hotsale/girlstops.dart';
import 'package:bagmore/Home/Hotsale/menshoodis.dart';
import 'package:bagmore/Home/Hotsale/mesntshirt.dart';
import 'package:bagmore/Home/Hotsale/shoes.dart';
import 'package:bagmore/Home/Hotsale/wcasualwaer.dart';
import 'package:bagmore/Home/Hotsale/womenfashion.dart';
import 'package:bagmore/Home/Hotsale/womenpants.dart';
import 'package:bagmore/Home/Hotsale/womenstrendy.dart';
import 'package:bagmore/Home/Hotsale/womenwinter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> hotsalePaths = List.generate(10, (index) => 'assets/Hotsales/img${index + 1}.jpg');
  List<String> discounts = List.generate(10, (index) => 'assets/Discount/img${index + 1}.jpg');
  List<String> kids = List.generate(10, (index) => 'assets/Kidscloth/img${index + 1}.jpg');
  List<String> womens = List.generate(10, (index) => 'assets/womencloth/img${index + 1}.jpg');
  List<String> men = List.generate(10, (index) => 'assets/mencloth/img${index + 1}.jpg');
  List<String> brands = List.generate(10, (index) => 'assets/Brands/img${index + 1}.jpg');
  final List<Widget> hot_sale = [
    const Shoes(),
    const WomensFashion(),
    const Womenswinter(),
    const WomensPants(),
    const WomensCasual(),
    const MensHoodies(),
    const GirlsTops(),
    const MensTshirt(),
    const WomensTrendy(),
    const GirlsHoodies(),
  ];

  int current = 0;
  late PageController hotsaleController;

  @override
  void initState() {
    super.initState();
    hotsaleController = PageController(initialPage: current);
  }

  @override
  void dispose() {
    hotsaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: background,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)), IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined))],
      ),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: background,
        child: ListView(
          children: [
            DrawerHeader(child: Image.asset('lib/logo.png')),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset('lib/logo.png')),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: brands.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(color: const Color.fromARGB(255, 231, 231, 153), borderRadius: BorderRadius.circular(13)),
                              child: Image.asset(
                                brands[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 146, 141, 142),
                thickness: 1,
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hot',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' Sales',
                        style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ]),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Collection',
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 550,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: hotsalePaths.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 800,
                              width: 415,
                              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                hotsalePaths[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 440),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                  hotsaleController.animateToPage(
                                    current,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 219, 251), borderRadius: BorderRadius.circular(5), boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 241, 169, 253),
                                      offset: Offset(0, 1),
                                      spreadRadius: 2,
                                    )
                                  ]),
                                  child: PageView(
                                      controller: hotsaleController,
                                      onPageChanged: (index) {
                                        setState(() {
                                          current = index;
                                        });
                                      },
                                      children: [
                                        const Center(
                                          child: Text('View More', style: TextStyle(color: Color.fromARGB(255, 141, 140, 140), fontSize: 25, fontWeight: FontWeight.w400)),
                                        ),
                                        ...hot_sale,
                                      ]),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hot',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' Discount',
                        style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ]),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Collection',
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 550,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: discounts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 800,
                              width: 415,
                              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                discounts[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 440),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                  hotsaleController.animateToPage(
                                    current,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 219, 251), borderRadius: BorderRadius.circular(5), boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 241, 169, 253),
                                      offset: Offset(0, 1),
                                      spreadRadius: 2,
                                    )
                                  ]),
                                  child: PageView(
                                      controller: hotsaleController,
                                      onPageChanged: (index) {
                                        setState(() {
                                          current = index;
                                        });
                                      },
                                      children: [
                                        const Center(
                                          child: Text('View More', style: TextStyle(color: Color.fromARGB(255, 141, 140, 140), fontSize: 25, fontWeight: FontWeight.w400)),
                                        ),
                                        ...hot_sale,
                                      ]),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: 'Kids',
                        style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ]),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Collection',
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 550,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: kids.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 800,
                              width: 415,
                              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                kids[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 440),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                  hotsaleController.animateToPage(
                                    current,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 219, 251), borderRadius: BorderRadius.circular(5), boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 241, 169, 253),
                                      offset: Offset(0, 1),
                                      spreadRadius: 2,
                                    )
                                  ]),
                                  child: PageView(
                                      controller: hotsaleController,
                                      onPageChanged: (index) {
                                        setState(() {
                                          current = index;
                                        });
                                      },
                                      children: [
                                        const Center(
                                          child: Text('View More', style: TextStyle(color: Color.fromARGB(255, 141, 140, 140), fontSize: 25, fontWeight: FontWeight.w400)),
                                        ),
                                        ...hot_sale,
                                      ]),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: 'Womens',
                        style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ]),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Collection',
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 550,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: womens.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 800,
                              width: 415,
                              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                womens[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 440),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                  hotsaleController.animateToPage(
                                    current,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 219, 251), borderRadius: BorderRadius.circular(5), boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 241, 169, 253),
                                      offset: Offset(0, 1),
                                      spreadRadius: 2,
                                    )
                                  ]),
                                  child: PageView(
                                      controller: hotsaleController,
                                      onPageChanged: (index) {
                                        setState(() {
                                          current = index;
                                        });
                                      },
                                      children: [
                                        const Center(
                                          child: Text('View More', style: TextStyle(color: Color.fromARGB(255, 141, 140, 140), fontSize: 25, fontWeight: FontWeight.w400)),
                                        ),
                                        ...hot_sale,
                                      ]),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: 'Mens',
                        style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ]),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Collection',
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 550,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: men.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 800,
                              width: 415,
                              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                men[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 440),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                  hotsaleController.animateToPage(
                                    current,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 219, 251), borderRadius: BorderRadius.circular(5), boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 241, 169, 253),
                                      offset: Offset(0, 1),
                                      spreadRadius: 2,
                                    )
                                  ]),
                                  child: Center(child: Text('View More', style: TextStyle(color: Color.fromARGB(255, 141, 140, 140), fontSize: 25, fontWeight: FontWeight.w400))),

                                  // child: PageView(
                                  //   controller: hotsaleController,
                                  //   onPageChanged: (index) {
                                  //     setState(() {
                                  //       current = index;
                                  //     });
                                  //   },
                                  //   children: [
                                  //      const Center(
                                  //       child: Text('View More', style: TextStyle(color: Color.fromARGB(255, 141, 140, 140), fontSize: 25, fontWeight: FontWeight.w400)),
                                  //     ),
                                  //     ...hot_sale,
                                  //   ]

                                  // ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
