import '../views/mono_web_view.dart';
import 'html_widgets/connect_widget.dart';
import 'html_widgets/one_time_payment.dart';
import 'html_widgets/recurring_payment.dart';

/// Raw mono html formation
String buildMonoHtml(
  String? key, {
  WidgetType type = WidgetType.connect,
  String currency = "NGN",
  String description = "MONO_FLUTTER_PAYMENT",
  String reference = "MONO_PAYMENT_REFERENCE",
  String planId = "MONO_SUBSCRIPTION",
  String period = "monthly",
  String duration = "10",
  double amount = 1000,
}) =>
    type == WidgetType.connect
        ? monoConnect(key)
        : WidgetType.once == type
            ? oneTimePayment(key,
                currency: currency,
                description: description,
                amount: amount,
                reference: reference)
            : recurringPayment(key,
                currency: currency,
                description: description,
                reference: reference,
                planId: planId,
                period: period,
                duration: duration,
                amount: amount);
