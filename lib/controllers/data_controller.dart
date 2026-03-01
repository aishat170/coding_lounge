import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take_note/models/note.dart';
import 'package:take_note/models/user.dart';
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';

class DataController extends GetxController{
  List<Note> notes = <Note>[].obs;    
  List<String> savedNotes = <String>[].obs;

  var loaded = false.obs;

  Future<void> serializeNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(savedNotes.isNotEmpty) {
      savedNotes.clear();
    }

    for(int i = 0; i < notes.length; i++) {
      String note = json.encode(notes[i]);
      savedNotes.add(note);
    }
    await prefs.setStringList("com.aishat.Take_Note", savedNotes);
  }

  void deserializeNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var fromMem = prefs.getStringList("com.aishat.Take_Note");
    if (fromMem != null) {
      savedNotes = fromMem;
      notes.clear();
      for(int i = 0; i <savedNotes.length; i++) {
        Note note = Note.fromJson(json.decode(savedNotes[i]));
        notes.add(note);
      }
    }
    loaded(true);
  }

  Future<bool> createUser(String name, String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uuid = Uuid();
    var id = uuid.v1();

    var bytes = utf8.encode(password);
    Digest digest = sha256.convert(bytes);
    var encryptedPass = digest.toString();

    User newUser = User(name: name, email: email, creationDate: DateTime.now(), id: id, password : encryptedPass);
  
    String userInfo = json.encode(newUser);
    await prefs.setString("com.aishat.Take_Note_User", userInfo);
    return true;
  }
}

