import 'package:flutter/material.dart';
import 'package:nubank_marketplace/commons/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NuTheme.kMainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              buildAppBar(),
              buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Text(
            "Olá, Pedro Cabral",
            style: TextStyle(
              fontFamily: 'Graphik',
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: NuTheme.kMainMiddleColor,
              borderRadius: BorderRadius.circular(45 / 2),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25 / 2),
                            color: NuTheme.kMainLowColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Conta",
                            style: TextStyle(
                              fontFamily: 'Graphik',
                              fontSize: 12,
                              color: NuTheme.kGray,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Saldo disponível",
                      style: TextStyle(
                        fontFamily: 'Graphik',
                        fontSize: 10,
                        color: NuTheme.kGray,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "R\$ 123.104,72",
                      style: TextStyle(
                        fontFamily: 'Graphik',
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: NuTheme.kMainLowColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Nu Store",
                            style: TextStyle(
                              fontFamily: 'Graphik',
                              fontSize: 15,
                              letterSpacing: 0.5,
                              color: NuTheme.kMainColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Conheça a Nu Store: tudo que você precisa em um só lugar.",
                      style: TextStyle(
                        fontFamily: 'Graphik',
                        fontSize: 12,
                        letterSpacing: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          width: 0.5,
                          color: NuTheme.kMainColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "CONHECER",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Graphik',
                            fontSize: 12,
                            color: NuTheme.kMainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
