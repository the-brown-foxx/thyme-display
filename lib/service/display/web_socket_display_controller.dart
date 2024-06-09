import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:thyme_to_park_display/service/display/display_controller.dart';
import 'package:thyme_to_park_display/service/display/model/display_controller_event.dart';
import 'package:thyme_to_park_display/service/registry/model/car.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketDisplayController implements DisplayController {
  final _events = BehaviorSubject<DisplayControllerEvent>.seeded(
    const ShowInstructionsEvent(),
  );

  @override
  Stream<DisplayControllerEvent> get events => _events.stream;

  WebSocketDisplayController() {
    final channel = WebSocketChannel.connect(
      Uri.parse('ws://127.0.0.1:8071/display-controller'),
    );

    channel.stream.listen((final skibidi) {
      print(skibidi);
      final skibidiJson = (jsonDecode(skibidi) as Map<String, dynamic>);
      final fanumTax = switch (skibidiJson['status']) {
        'IDLE' => const ShowInstructionsEvent(),
        'VACANT_SPACE_UPDATE' => UpdateVacantSpaceEvent(
            vacantSpace: skibidiJson['vacant_space'],
          ),
        'CAR_AUTHORIZED' => ShowCarInfoEvent(
            car: Car.fromJson(skibidiJson['car']),
          ),
        'CAR_UNAUTHORIZED' => ShowUnauthorizedMessageEvent(
            registrationId: skibidiJson['registration_id'],
          ),
        _ => throw StateError('Huh?'),
      };
      print(fanumTax);
      _events.value = fanumTax;
    });
  }
}
