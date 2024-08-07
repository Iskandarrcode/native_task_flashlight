package com.example.native_task_fanar

import android.os.Bundle
import android.hardware.camera2.CameraManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/flashlight"
    private var isFlashlightOn = false

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "toggleFlashlight") {
                toggleFlashlight()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun toggleFlashlight() {
        val cameraManager = getSystemService(CAMERA_SERVICE) as CameraManager
        val cameraId = cameraManager.cameraIdList[0]
        isFlashlightOn = !isFlashlightOn
        cameraManager.setTorchMode(cameraId, isFlashlightOn)
    }
}