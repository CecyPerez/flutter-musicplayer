import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  AnimationController _controller;
  Duration _songDuracion = new Duration(milliseconds: 0);
  Duration _current = new Duration(milliseconds: 0);

  String get songTotalDuration => this.printDuration(this._songDuracion);
  String get currentSecond => this.printDuration(this._current);

  double get porcentaje => (this._songDuracion.inSeconds == 0) ? 0 : this._current.inSeconds / this._songDuracion.inSeconds;

  set controller(AnimationController valor) {
    this._controller = valor;
  }

  AnimationController get controller => this._controller;

  bool get playing => this._playing;

  set playing(bool valor) {
    this._playing = valor;
    notifyListeners();
  }

  Duration get songDuration => this._songDuracion;

  set songDuration(Duration valor) {
    this._songDuracion = valor;
    notifyListeners();
  }

  Duration get current => this._current;

  set current(Duration valor) {
    this._current = valor;
    notifyListeners();
  }

  String printDuration(Duration duration){
    String twoDigits(int n){
      if(n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }



}
