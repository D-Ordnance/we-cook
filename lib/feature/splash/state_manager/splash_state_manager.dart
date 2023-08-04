import 'dart:async';

enum InitAppActions { InitApp }

class InitAppState {
  final _stateStreamController = StreamController<void>();

  StreamSink<void> get initAppSink => _stateStreamController.sink;

  Stream<void> get initAppStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<InitAppActions>();

  StreamSink<InitAppActions> get eventSink => _eventStreamController.sink;

  Stream<InitAppActions> get eventStream => _eventStreamController.stream;

  InitAppState() {
    eventStream.listen((event) async {
      if (event == InitAppActions.InitApp) {
        try {
          var initApp = await initializeApp();
          initAppSink.add(initApp);
        } on Exception catch (e) {
          initAppSink.addError("Something went wrong with message: $e");
        }
      }
    });
  }

  Future<void> initializeApp() async {
    Future.delayed(const Duration(milliseconds: 4000));
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
