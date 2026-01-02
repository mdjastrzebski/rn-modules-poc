package com.reactnativemodules

import android.util.Log
import com.facebook.react.BaseReactPackage
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.NativeModule
import com.facebook.react.module.model.ReactModuleInfo
import com.facebook.react.module.model.ReactModuleInfoProvider
import com.facebook.react.uimanager.ViewManager

class ExampleTurboModulePackage: BaseReactPackage() {
    override fun createViewManagers(reactContext: ReactApplicationContext): List<ViewManager<*, *>> {
        return listOf(SimpleTextViewManager(reactContext))
    }

    override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? {
        return when (name) {
            ExampleTurboModule.NAME -> ExampleTurboModule(reactContext)
            SimpleTextViewManager.REACT_CLASS -> SimpleTextViewManager(reactContext)
            else -> null
        }
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
            ),
            SimpleTextViewManager.REACT_CLASS to ReactModuleInfo(
                name = SimpleTextViewManager.REACT_CLASS,
                className = SimpleTextViewManager.REACT_CLASS,
                canOverrideExistingModule = false,
                needsEagerInit = false,
                isCxxModule = false,
                isTurboModule = true,
            )
        )
    }
}