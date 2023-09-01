class MessageModel {
  final String massageModel;
  final String id;

  MessageModel(this.massageModel, this.id);

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(jsonData["text"], jsonData["id"]);
  }
}
