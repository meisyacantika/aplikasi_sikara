package com.example.aplikasi_sikara

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.RenderMode

class MainActivity : FlutterActivity() {
    override fun getRenderMode(): RenderMode {
        // TextureView fixes "Width is zero. 0,0" and black screen bug on x86_64 emulators
        return RenderMode.texture
    }
}

