//
//  SimpleTextState.h
//  ReactNativeModules
//
//  Created by MDJ on 04/12/2025.
//

#pragma once

#include <react/renderer/core/StateData.h>
#ifdef RN_SERIALIZABLE_STATE
#include <folly/dynamic.h>
#endif

namespace facebook::react {

class SimpleTextState {
public:
  SimpleTextState()
    : _width(0), _height(0) {}

  SimpleTextState(float width, float height)
    : _width(width), _height(height) {}

//#ifdef ANDROID
//  SimpleTextState(SimpleTextState const &previousState, folly::dynamic data)
//    : _width((float)data["width"].getDouble()),
//    _height((float)data["height"].getDouble()){};
//  folly::dynamic getDynamic() const {
//    return {};
//  };
//#endif

  float getWidth() const;
  float getHeight() const;

private:
  const float _width{};
  const float _height{};
};

} // namespace facebook::react
