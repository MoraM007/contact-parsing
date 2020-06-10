
import 'package:jsonparse/data/repository.dart';
import 'package:jsonparse/models/contact.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ContactsBloc{

  ContactsBloc(){
    _fetchContacts();
  }

  final _contacts = BehaviorSubject<List<Contact>>();
  final Repository _repository=Repository();

  //Get Data
  Stream<List<Contact>> get contacts => _contacts.stream;

  //Set Data
  Function(List<Contact>) get changeContacts => _contacts.sink.add;

  dispose(){
    _contacts.close();
  }

  _fetchContacts() => _repository.fetchContacts().then((contacts) => changeContacts(contacts));


}