import 'package:css/app/models/thank_you_message_model.dart';
import 'package:css/app/modules/survey_submitted/controller/message_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageCardWidget extends GetView<MessageController> {
  const MessageCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.allMessages.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Thank You! You have successfully submitted your feedback.',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: controller.allMessages.length,
              itemBuilder: (context, index) {
                final admin = controller.allMessages[index];
                return cardWidget(admin, context);
              },
            ),
    );
  }

  Widget cardWidget(ThankYouMessageModel message, BuildContext context) =>
      Column(
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Text(
                message.message,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (message.image.isNotEmpty)
            SizedBox(
              width: 200,
              child: Image.network(
                message.image,
              ),
            ),
        ],
      );
}
