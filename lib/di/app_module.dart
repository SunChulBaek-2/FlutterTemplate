import 'package:event_bus/event_bus.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  EventBus get eventBus => EventBus();
}