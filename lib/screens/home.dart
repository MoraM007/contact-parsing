import 'package:flutter/material.dart';
import 'package:jsonparse/blocs/contact_provider.dart';
import 'package:jsonparse/models/contact.dart';
import 'package:jsonparse/screens/contact.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ContactsProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        body: StreamBuilder<List<Contact>>(
          stream: bloc.contacts,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(snapshot.data[index].name,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
                  subtitle: Text(snapshot.data[index].company.name, style: TextStyle(fontStyle: FontStyle.italic),),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactPage(
                              contact: snapshot.data[index],
                            )));
                  },
                );
              },
            );
          },
        ));
  }
}