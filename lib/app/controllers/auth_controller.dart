import 'package:chattie/models/list_chat_model.dart';
import 'package:chattie/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  var isAuthenticated = false.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var user = UsersModel().obs;

  Future<void> firstInitialized() async {
    try {
      final isSignin = await _googleSignIn.isSignedIn();
      if (isSignin) {
        await _googleSignIn
            .signInSilently()
            .then((value) => _currentUser = value);
        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);
        CollectionReference users = firestore.collection('users');
        users.doc(_currentUser!.email).update({
          "last_sign_in":
              userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });
        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;
        user(UsersModel.fromJson(currUserData));
        user.refresh();
        isAuthenticated.value = true;
      }
    } catch (e) {
      print('error');
      print(e);
      print('error');
      isAuthenticated.value = false;
    }
  }

  Future<void> loginGoogle() async {
    // GOOGLE SIGNIN
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _currentUser = value);
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn) {
        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        CollectionReference users = firestore.collection('users');
        final checkUser = await users.doc(_currentUser!.email).get();
        if (checkUser.data() == null) {
          users.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _currentUser!.displayName,
            "email": _currentUser!.email,
            "photo": _currentUser!.photoUrl,
            "created_at":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "last_sign_in": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updated_at": DateTime.now().toIso8601String(),
            "chats": []
          });
        } else {
          users.doc(_currentUser!.email).update({
            "last_sign_in": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UsersModel.fromJson(currUserData));
        user.refresh();

        isAuthenticated.value = true;
        Get.offAllNamed('/');
      } else {
        print('Gagal login');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    Get.offAllNamed('/login');
  }

  Future<Map<String, dynamic>> addNewConnection(String friendEmail) async {
    if (friendEmail == _currentUser!.email)
      return {"success": false, "error": "Email orang lain woy"};
    String date = DateTime.now().toIso8601String();
    CollectionReference chats = firestore.collection("chats");

    final newChatDoc = await chats.add({
      "connections": [
        _currentUser!.email,
        friendEmail,
      ],
      "total_chats": 0,
      "total_read": 0,
      "total_unread": 0,
      "chat": [],
      "last_time": date,
    });
    CollectionReference users = firestore.collection("users");
    users.doc(_currentUser!.email).update({
      "chats": [
        {
          "connection": friendEmail,
          "chat_id": newChatDoc.id,
          "lastTime": date,
        }
      ]
    });
    user.update((val) {
      val!.chats = [
        ListChat(chatId: newChatDoc.id, connection: friendEmail, lastTime: date)
      ];
    });
    return {"success": true, "error": ""};
    ;
  }
}
