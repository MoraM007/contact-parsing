import 'package:jsonparse/data/jsonplaceholder.dart';
import 'package:jsonparse/models/contact.dart';

class Repository {
  final JsonPlaceHolderProvider jsonProvider=JsonPlaceHolderProvider();

  Future<List<Contact>> fetchContacts() async => await jsonProvider.fetchContacts();
}