import 'core/BaseEvent.dart';

/*
 * Input class for bike info BLoC
 *
 * @see BikeInfoBloc
 */
class BikeInfoEvent extends BaseEvent {
  final int id;

  const BikeInfoEvent(this.id) : super();
}