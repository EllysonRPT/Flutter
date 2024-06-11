import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todolist.dart';

class TodolistController {
  List<Todolist> _list = [];
  List<Todolist> get list => _list;
  //conncet firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> add(Todolist todolist) async {
    await _firestore.collection('todolist').add(todolist.toMap());
  }

  //deletar
  Future<void> delete(String id) async {
    await _firestore.collection('todolist').doc(id).delete();
  }

  //fetch list
  Future<List<Todolist>> fetchList(String userId) async {
    final result = await _firestore
        .collection('todolist')
        .where('userId', isEqualTo: userId)
        .get();
    _list = result.docs.map((doc) => Todolist.fromMap(doc.data())).toList();
    return _list;
  }
  //update
  Future<void> update(Todolist todolist) async {
    await _firestore.collection('todolist').doc(todolist.id).update(todolist.toMap());
  }

}
