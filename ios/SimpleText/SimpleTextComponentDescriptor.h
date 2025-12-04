//
//  SimpleTextComponentDescriptor.h
//  ReactNativeModules
//
//  Created by MDJ on 04/12/2025.
//

#pragma once

#include "SimpleTextShadowNode.h"

#include <react/renderer/core/ConcreteComponentDescriptor.h>
#include <react/renderer/componentregistry/ComponentDescriptorProviderRegistry.h>

namespace facebook::react {

class SimpleTextComponentDescriptor final : public ConcreteComponentDescriptor<SimpleTextShadowNode> {
 public:
  SimpleTextComponentDescriptor(const ComponentDescriptorParameters &parameters) : ConcreteComponentDescriptor(parameters)
  {
  }

  void adopt(ShadowNode &shadowNode) const override
  {
    react_native_assert(dynamic_cast<SimpleTextShadowNode *>(&shadowNode));

    const auto newSimpleTextShadowNode = dynamic_cast<SimpleTextShadowNode *>(&shadowNode);
    const auto state = newSimpleTextShadowNode->getStateData();
    
    newSimpleTextShadowNode->setSize({state.getWidth(), state.getHeight()});
      
    ConcreteComponentDescriptor::adopt(shadowNode);
  }
};

} // namespace facebook::react


