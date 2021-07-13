import 'core/BaseEvent.dart';

/*
 * Input class used for bike info BLoC
 *
 * @see BikeInfoBloc
 */
class BikeInfoEvent extends BaseEvent {
  final int id;

  const BikeInfoEvent(this.id) : super();
}