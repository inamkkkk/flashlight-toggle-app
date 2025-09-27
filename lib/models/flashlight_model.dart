import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:torch_controller/torch_controller.dart';

class FlashlightModel extends ChangeNotifier {
  bool _isTorchOn = false;
  final _torchController = TorchController();

  bool get isTorchOn => _isTorchOn;

  Future<void> toggleFlashlight() async {
    if (_isTorchOn) {
      try {
        await _torchController.off();
        _isTorchOn = false;
        notifyListeners();
      } catch (e) {
        debugPrint('Error turning off flashlight: $e');
      }
    } else {
      var status = await Permission.camera.status;
      if (status.isDenied) {
        status = await Permission.camera.request();
      }

      if (status.isGranted) {
        try {
          await _torchController.on();
          _isTorchOn = true;
          notifyListeners();
        } catch (e) {
          debugPrint('Error turning on flashlight: $e');
        }
      } else {
        debugPrint('Camera permission denied.');
        // Optionally, show a dialog to the user explaining why the permission is needed.
      }
    }
  }
}