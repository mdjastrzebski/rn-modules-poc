//
//  SimpleTextShadowNode.h
//  ReactNativeModules
//
//  Created by MDJ on 04/12/2025.
//

#pragma once

#include "SimpleTextState.h"

#include <react/renderer/components/AppSpec/EventEmitters.h>
#include <react/renderer/components/AppSpec/Props.h>
#include <react/renderer/components/view/ConcreteViewShadowNode.h>
#include <jsi/jsi.h>

namespace facebook::react {

JSI_EXPORT extern const char SimpleTextComponentName[];

class SimpleTextShadowNode final
    : public ConcreteViewShadowNode<SimpleTextComponentName, SimpleTextProps, SimpleTextEventEmitter, SimpleTextState> {
 public:
  using ConcreteViewShadowNode::ConcreteViewShadowNode;

  static ShadowNodeTraits BaseTraits()
  {
    auto traits = ConcreteViewShadowNode::BaseTraits();
    traits.set(ShadowNodeTraits::Trait::LeafYogaNode);
    traits.set(ShadowNodeTraits::Trait::MeasurableYogaNode);
    return traits;
  }
      
#pragma mark - LayoutableShadowNode

  Size measureContent(const LayoutContext &layoutContext, const LayoutConstraints &layoutConstraints) const override;
};

} // namespace facebook::react
