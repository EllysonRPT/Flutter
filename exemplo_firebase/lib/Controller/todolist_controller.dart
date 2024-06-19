import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todolist.dart';

class TodolistController {
  List<Todolist> _list = [];
  List<Todolist> get list => _list;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> add(Todolist todolist) async {
    try {
      bool hasDuplicate = _list.any((task) => task.titulo == todolist.titulo);
      if (hasDuplicate) {
        throw 'Já existe uma tarefa com o mesmo nome.';
      } else {
        await _firestore.collection('todolist').add(todolist.toMap());
        await fetchList(todolist.userId); // Refresh list after adding
      }
    } catch (e) {
      print("Error adding document: $e");
      throw e;
    }
  }

  Future<void> delete(String docId) async {
    try {
      await _firestore.collection('todolist').doc(docId).delete();
      print("Deletion successful");
      _list.removeWhere((todolist) => todolist.doc == docId); // Remove from local list
    } catch (e) {
      print("Error deleting document: $e");
      throw e;
    }
  }

  Future<List<Todolist>> fetchList(String userId) async {
    try {
      final QuerySnapshot result = await _firestore
          .collection('todolist')
          .where('userid', isEqualTo: userId)
          .get();

      _list = result.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return Todolist.fromMap(data, doc: doc.id);
      }).toList();

      return _list;
    } catch (e) {
      print("Error fetching list: $e");
      return [];
    }
  }

  Future<void> update(Todolist todolist) async {
    try {
      await _firestore.collection('todolist').doc(todolist.doc).update(todolist.toMap());
      await fetchList(todolist.userId);
    } catch (e) {
      print("Error updating document: $e");
      throw e;
    }
  }
}
