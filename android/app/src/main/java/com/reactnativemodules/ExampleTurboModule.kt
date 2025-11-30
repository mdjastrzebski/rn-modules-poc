package com.reactnativemodules

import com.facebook.fbreact.specs.NativeExampleTurboModuleSpec
import com.facebook.react.bridge.ReactApplicationContext

class ExampleTurboModule(reactContext: ReactApplicationContext) : NativeExampleTurboModuleSpec(reactContext) {
    companion object {
        const val NAME = "ExampleTurboModule"
    }

    override fun getName() = NAME

    override fun numberToString(value: Double): String? {
        return value.toString()
    }
}
