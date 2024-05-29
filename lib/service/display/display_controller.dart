import 'model/display_controller_event.dart';

abstract interface class DisplayController {
  Stream<DisplayControllerEvent> get events;
}