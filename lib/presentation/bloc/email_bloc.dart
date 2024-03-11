import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_0702/presentation/models/email_model.dart';
import 'package:flutter_practice_0702/presentation/network/dio_settings.dart';
import 'package:flutter_practice_0702/presentation/theme/consts/app_const.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {

  EmailBloc() : super(EmailInitial()) {
    on<SendEvent>((event, emit) async{
      emit(EmailLoading());
      try{
        await sendEmail(event);
        
        
        
        emit(EmailSuccess());
        


      }catch(e){
        emit(EmailError(errorMessage: "Ошибка"));
      }

    });
  }
   Future<void> sendEmail(SendEvent event) async {
    Dio dio = DioSettings().dio;

    try {
      final emailModel = EmailModel(
        templateId: AppConst.templateId,
        userId: AppConst.userId,
        accessToken: AppConst.accessToken,
        serviceId: AppConst.serviceId,
        templateParams: TemplateParams(
          phone: event.phone,
        toEmail: event.toEmail,
        firstName: event.firstName,
        lastName: event.lastName,
        message: event.message,
        ),
      );

      final jsonData = emailModel.toJson();

      await dio.post("https://api.emailjs.com/api/v1.0/email/send", data: jsonData);


    } catch (e) {
      Text(e.toString());
    }
  }
}
