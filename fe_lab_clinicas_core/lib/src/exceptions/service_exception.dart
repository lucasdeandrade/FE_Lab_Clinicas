import 'package:fe_lab_clinicas_core/src/exceptions/repository_exception.dart';

class ServiceException implements Exception {
  final String message;

  ServiceException({this.message = ''});
}
