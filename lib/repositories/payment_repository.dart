import 'package:schoolproject/models/arguments/payment_screen_arguments.dart';
import 'package:schoolproject/providers/payment_provider.dart';

class PaymentRepository {
  PaymentProvider provider = PaymentProvider();

  Future<void> addNewLessonFunction(PaymentScreenArguments arguments) async {
    return await provider.addNewLessonFunction(arguments);
  }
}
