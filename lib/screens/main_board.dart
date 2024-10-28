import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/main_card.dart';

class MainBoardScreen extends StatelessWidget {
  const MainBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff171D31),
      width: MediaQuery.of(context).size.width * 0.84,
      height: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainCard(
                  name: "عدد التكتات",
                  number: 200,
                  color: Color(0xffFF5749),
                  image: "asset/images/tikit.png"),
              MainCard(
                  name: "عدد الموظفين",
                  number: 5,
                  color: Color(0xff00CEC9),
                  image: "asset/images/group.png"),
              MainCard(
                  name: "عدد الافرع",
                  number: 2,
                  color: Color(0xff74B7F5),
                  image: "asset/images/share.png"),
            ],
          ),
        ],
      ),
    );
  }
}
