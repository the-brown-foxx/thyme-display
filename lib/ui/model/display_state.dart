import 'package:thyme_to_park_display/service/registry/model/car.dart';

sealed class DisplayState {
  const DisplayState();
}

class ShowingInstructionsState extends DisplayState {
  const ShowingInstructionsState();
}

class ShowingCarInfoState extends DisplayState {
  final Car car;

  const ShowingCarInfoState({required this.car});
}

class ShowingUnauthorizedMessageState extends DisplayState {
  final String registrationId;

  const ShowingUnauthorizedMessageState({required this.registrationId});
}