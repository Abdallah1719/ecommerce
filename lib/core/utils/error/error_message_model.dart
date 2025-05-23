import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final dynamic statusMessage;

  const ErrorMessageModel({required this.statusMessage});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(statusMessage: json["data"]["error"]);
  }

  @override
  List<Object?> get props => [statusMessage];
}
