import 'package:thyme_to_park_display/service/registry/model/car.dart';

sealed class DisplayControllerEvent {
  const DisplayControllerEvent();
}

class DisplayControllerErrorEvent extends DisplayControllerEvent {
  const DisplayControllerErrorEvent();
}

class ShowInstructionsEvent extends DisplayControllerEvent {
  const ShowInstructionsEvent();
}

class ShowParkingFullEvent extends DisplayControllerEvent {
  const ShowParkingFullEvent();
}

class ShowCarInfoEvent extends DisplayControllerEvent {
  final Car car;

  const ShowCarInfoEvent({required this.car});
}

class UpdateVacantSpaceEvent extends DisplayControllerEvent {
  final int vacantSpace;

  const UpdateVacantSpaceEvent({required this.vacantSpace});
}

class ShowUnauthorizedMessageEvent extends DisplayControllerEvent {
  final String registrationId;

  const ShowUnauthorizedMessageEvent({required this.registrationId});
}