package com.reactnativemodules

import android.util.TypedValue
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.SimpleTextManagerInterface
import com.facebook.react.viewmanagers.SimpleTextManagerDelegate

@ReactModule(name = SimpleTextViewManager.REACT_CLASS)
class SimpleTextViewManager(context: ReactApplicationContext): SimpleViewManager<SimpleTextView>(), SimpleTextManagerInterface<SimpleTextView> {
    companion object {
        const val REACT_CLASS = "SimpleText"
    }

    private val delegate: SimpleTextManagerDelegate<SimpleTextView, SimpleTextViewManager> =
        SimpleTextManagerDelegate(this)

    override fun getName(): String = REACT_CLASS

    override fun getDelegate(): ViewManagerDelegate<SimpleTextView> = delegate

    override fun createViewInstance(context: ThemedReactContext): SimpleTextView = SimpleTextView(context)

    @ReactProp(name = "text")
    override fun setText(view: SimpleTextView, text: String?) {
        view.setText(text)
    }

    @ReactProp(name = "fontSize")
    override fun setFontSize(view: SimpleTextView, fontSize: Float) {
        view.setTextSize(TypedValue.COMPLEX_UNIT_DIP, fontSize)
    }
}