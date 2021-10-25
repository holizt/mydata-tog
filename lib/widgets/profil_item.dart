import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProfilItem extends StatelessWidget {
  final String name;
  final String address;
  final String date;
  final String height;
  final String weight;
  final File imgPath;
  final Function() onTap;

  const ProfilItem({
    Key? key,
    required this.name,
    required this.address,
    required this.date,
    required this.height,
    required this.weight,
    required this.imgPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Slidable(
        actionPane: const SlidableDrawerActionPane(),
        actionExtentRatio: 0.30,
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            icon: Icons.delete,
            color: Colors.redAccent,
            onTap: onTap,
          ),
        ],
        child: Material(
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            width: size.width,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: size.height,
                  child: Image.file(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Name : ',
                          style: Theme.of(context).textTheme.subtitle1,
                          children: [
                            TextSpan(
                              text: name,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Address : ',
                          style: Theme.of(context).textTheme.subtitle1,
                          children: [
                            TextSpan(
                              text: address,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Date/Birth : ',
                          style: Theme.of(context).textTheme.subtitle1,
                          children: [
                            TextSpan(
                              text: date,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Height : ',
                          style: Theme.of(context).textTheme.subtitle1,
                          children: [
                            TextSpan(
                              text: height,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Weight : ',
                          style: Theme.of(context).textTheme.subtitle1,
                          children: [
                            TextSpan(
                              text: weight,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
