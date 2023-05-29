import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:garage_repair/Models/user.dart';
import 'package:garage_repair/Screen/Components/New%20Screens/New%20Services%20screen/vehicle_inspection_new.dart';
import 'package:garage_repair/Screen/Components/appbar.dart';
import 'package:garage_repair/Screen/Components/g_text_field.dart';
import 'package:garage_repair/Screen/g_loader.dart';
import 'package:garage_repair/provider/vehicle_provider.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../../misc/enum.dart';
import '../../../../service_locator.dart';
import '../mechanic_experience_card.dart';

class ListOfMechanic extends StatefulWidget {
  final ChatType chatType;
  final ServiceType serviceType;
  const ListOfMechanic({
    Key? key,
    this.chatType = ChatType.chat,
    required this.serviceType,
  }) : super(key: key);

  @override
  State<ListOfMechanic> createState() => _ListOfMechanicState();
}

class _ListOfMechanicState extends State<ListOfMechanic> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VehicleProvider>(context, listen: false)
          .serviceCompanies(ServiceTypeString(widget.serviceType));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          'Available Mechanics',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffEBEBEB),
      ),
      body: SingleChildScrollView(
        child: Consumer<VehicleProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      app.serviceVendors.length,
                      (index) => MechanicExperienceCard(
                          mechanic: app.serviceVendors[index],
                          route: chatType == ChatType.chat ? ChatWithEngineer(
                              mechanic: app.serviceVendors[index])  : CallMechanic(mechanic: app.serviceVendors[index]))),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChatWithEngineer extends StatefulWidget {
  final User mechanic;
  const ChatWithEngineer({Key? key, required this.mechanic}) : super(key: key);

  @override
  State<ChatWithEngineer> createState() => _ChatWithEngineerState();
}

class _ChatWithEngineerState extends State<ChatWithEngineer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VehicleProvider>(context, listen: false).fetchChatMessages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(
        screenTitle: 'Chat',
      ),
      body: Consumer<VehicleProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const GLoader()
              : Column(children: [
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ListView(
                        reverse: true,
                          children: List.generate(app.messageLogs.length, (index) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BubbleSpecialOne(
                        text: app.messageLogs[index].description,
                      tail: true,
                      isSender:  app.user.uuid == (app.messageLogs[index].postedBy?.uuid ?? ''),
                      color: app.user.uuid == (app.messageLogs[index].postedBy?.uuid ?? '')
                          ? Colors.green : Colors.white30,
                      textStyle:  app.user.uuid == (app.messageLogs[index].postedBy?.uuid ?? '')
                          ? const TextStyle(color: Colors.white, fontSize: 16)
                          : const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    const SizedBox(height: 12,),
                    Text(Jiffy.parseFromDateTime(app.messageLogs[index].dateCreated ?? DateTime.now()).yMMMdjm)
                  ],
                ),
              )),
                      )
                  )),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(style: BorderStyle.solid),
                boxShadow: const [
                  BoxShadow(blurRadius: 10, spreadRadius: 1)
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GTextField(
                      label: '', stream: Stream.value(''),
                      controller: provider.logMessageCtrl,
                      prefixIconData: Icons.emoji_emotions, suffixIconData: Icons.attach_file_sharp,),
                  ),
                  TextButton(onPressed: () {
                    provider.sendServiceLog(message: provider.logMessageCtrl.text);
                  },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    shape: const CircleBorder(),
                  ),
                       child: const Icon(Icons.send, color: Colors.white,),)
                ],
              )
            )
                ]);
        },
      ),
    );
  }
}
