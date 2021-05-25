import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mono/src/utils/extensions.dart';

import '../flutter_mono.dart';

class MonoFlutter {
  // Launch Flutter Mono
  static Future launchMono(
    BuildContext _, {

    /// Public Key from your https://app.withmono.com/apps
    required String key,

    /// Success callback
    Function(String code)? onSuccess,

    /// Mono popup Close callback
    Function? onClosed,

    /// final Widget error;
    Widget? error,

    /// Show MonoView Logs
    bool showLogs = false,

    /// select widget to display
    WidgetType type = WidgetType.connect,

    /// CURRENCY
    String currency = "NGN",

    /// DESCRIPTION
    String description = "MONO_FLUTTER_PAYMENT",

    /// AMOUNT IN KOBO
    double amount = 1000,

    /// REFERENCE
    String reference = "MONO_PAYMENT_REFERENCE",

    /// PLAN ID FOR RECURRING PAYMENT
    String planId = "MONO_SUBSCRIPTION",

    /// PERIOD FOR RECURRING PAYMENT (WEEKLY, MONTHLY, DAILY OR YEARLY)
    String period = "monthly",

    /// DURATION FOR RECURRING PAYMENT (NUMBER OF TIMES RECURRING SHOULD GO FOR)
    String duration = "10",
  }) async =>
      showDialog(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: context.screenWidth(.9),
                height: context.screenHeight(.73),
                child: MonoView(
                    apiKey: key,
                    onClosed: onClosed,
                    onSuccess: onSuccess,
                    showLogs: showLogs,
                    error: error,
                    type: type,
                    currency: currency,
                    description: description,
                    amount: amount,
                    reference: reference,
                    planId: planId,
                    period: period,
                    duration: duration),
              ),
            ),
          ],
        ),
        context: _,
      );
}
