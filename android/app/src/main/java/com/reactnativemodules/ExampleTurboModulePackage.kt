package com.reactnativemodules

import android.util.Log
import com.facebook.react.BaseReactPackage
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.model.ReactModuleInfo
import com.facebook.react.module.model.ReactModuleInfoProvider

class ExampleTurboModulePackage: BaseReactPackage() {
    override fun getModule(name: String, reactContext: ReactApplicationContext): ExampleTurboModule? {
        return if (name == ExampleTurboModule.NAME)
            ExampleTurboModule(reactContext)
        else
            null
    }

    override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {
        mapOf(
            ExampleTurboModule.NAME to ReactModuleInfo(
                name = ExampleTurboModule.NAME,
                className = ExampleTurboModule.NAME,
                canOverrideExistingModule = false,
                needsEagerInit = false,
                isCxxModule = false,
                isTurboModule = true
            )
        )
    }
}