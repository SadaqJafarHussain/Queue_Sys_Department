import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .10,
      width: MediaQuery.of(context).size.width * .835,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(6)),
          color: Color(0xff283046),
          boxShadow: [
            BoxShadow(
              color: Color(0xff171D31),
              blurRadius: 0.3,
              spreadRadius: 0,
            ),
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Image.asset(
                  "asset/images/not.png",
                  height: 30,
                  color: Colors.white,
                ),
                const Positioned(
                  right: 2,
                  top: 0.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 5,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 12,
                          color: Colors.white,
                        ),
                        Text(
                          "عمار حسن شناوه",
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      "مدير النظام",
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 11,
                          color: Color(0xff9BA5BE)),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "asset/images/user.png",
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
