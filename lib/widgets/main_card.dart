import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final Color color;
  final String image;
  final String name;
  final int number;
  const MainCard(
      {required this.name,
      required this.number,
      required this.color,
      required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * .18,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  image,
                  color: Colors.white,
                  height: 40,
                ),
                Flexible(
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontFamily: 'Cairo',
                        overflow: TextOverflow.ellipsis,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                number.toString(),
                style: const TextStyle(
                    fontFamily: 'Cairo', fontSize: 25, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
