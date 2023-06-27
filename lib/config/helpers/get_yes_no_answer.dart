import 'package:dio/dio.dart';
import 'package:sec_five_app/domain/entities/message.dart';
import 'package:sec_five_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio();
  
  Future<Message> getAnswer() async {

    final response = await _dio.get(
      'https://yesno.wtf/api'
    );

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

    // throw UnimplementedError();

  }
}