import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/chat_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference message =
      FirebaseFirestore.instance.collection('message');

  List<MessageModel> messageList = [];

  void sendMessage({required String messages, required var email}) {
    message.add({"text": messages, "created at": DateTime.now(), "id": email});
  }

  void getMessage() {
    message.orderBy("created at", descending: true).snapshots().listen((event) {
      for (var doc in event.docs) {
        messageList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess(message: messageList));
    });
    messageList.clear();

  }
}
