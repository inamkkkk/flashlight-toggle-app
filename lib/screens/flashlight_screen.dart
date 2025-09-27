import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flashlight_app/models/flashlight_model.dart';

class FlashlightScreen extends StatelessWidget {
  const FlashlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashlight'),
      ),
      body: Center(
        child: Consumer<FlashlightModel>(
          builder: (context, flashlightModel, child) => ElevatedButton(
            onPressed: () {
              flashlightModel.toggleFlashlight();
            },
            child: Text(flashlightModel.isTorchOn ? 'Turn Off' : 'Turn On'),
          ),
        ),
      ),
    );
  }
}