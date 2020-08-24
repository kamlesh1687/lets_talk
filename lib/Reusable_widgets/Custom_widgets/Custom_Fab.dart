import 'package:flutter/material.dart';
import 'package:letstalk/Other_screens/Chats_related/AllContacts_screen/Allcontacts.dart';
import 'package:letstalk/Reusable_widgets/variableproperties.dart';

import '../widgets.dart';

class Customfab extends FloatingActionButton {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.13,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          boxShadow: [cardShadowpositive],
          borderRadius: BorderRadius.circular(10)),
      child: Material(
        color: cardColorbg,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            iconbuttons(Icons.add, context, () {
              Navigator.push(context,
                  pageroutanimated(Allcontacts(), Alignment.bottomRight));
            }),
            iconbuttons(Icons.search, context, () {}),
          ],
        ),
      ),
    );
  }
}
