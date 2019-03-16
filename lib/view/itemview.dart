import 'package:flutter/material.dart';
import 'package:flutter_action/model/contact.dart';
import 'package:flutter_action/detailview/detail.dart';
import 'package:flutter_action/animation/fade.dart';

class ContactListItem extends StatelessWidget {
  final ContactModal _contactModal;

  ContactListItem(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap: () {
          Navigator.push(context, new FadeRoute(builder: (context) {
            return new DetailView();
          }));
        },
        leading: new CircleAvatar(child: new Text(_contactModal.fullName[0])),
        title: new Text(_contactModal.fullName),
        subtitle: new Text(_contactModal.email));
  }
}
