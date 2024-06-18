import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todolist.dart';

class TodolistController {
  List<Todolist> _list = [];
  List<Todolist> get list => _list;

  // Connect to Firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> add(Todolist todolist) async {
    try {
      // Check if the task with the same title already exists
      bool hasDuplicate = _list.any((task) => task.titulo == todolist.titulo);

      if (hasDuplicate) {
        throw 'Já existe uma tarefa com o mesmo nome.';
      } else {
        DocumentReference docRef = await _firestore.collection('todolist').add(todolist.toMap());
        // Optionally, refresh the list after adding a new item
        await fetchList(todolist.userId);
      }
    } catch (e) {
      print("Error adding document: $e");
      throw e; // Rethrow the error to handle it in the UI if needed
    }
  }

  // Delete a todo list item by its document ID
  Future<void> delete(String docId) async {
    try {
      await _firestore.collection('todolist').doc(docId).delete();
      print("Deletion successful");
      // Optionally refresh the list after deletion
      _list.removeWhere((todolist) => todolist.doc == docId);
    } catch (e) {
      print("Error deleting document: $e");
      throw e;
    }
  }

  // Fetch the list of todo items for a specific user
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

  // Update a todo list item
  Future<void> update(Todolist todolist) async {
    try {
      await _firestore.collection('todolist').doc(todolist.doc).update(todolist.toMap());
      // Optionally refresh the list after updating
      await fetchList(todolist.userId);
    } catch (e) {
      print("Error updating document: $e");
      throw e;
    }
  }
}
