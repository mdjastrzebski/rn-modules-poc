//
//  SimpleTextShadowNode.mm
//  ReactNativeModules
//
//  Created by MDJ on 04/12/2025.
//

#include "SimpleTextShadowNode.h"

namespace facebook::react {

extern const char SimpleTextComponentName[] = "SimpleText";

#pragma mark - LayoutableShadowNode

Size SimpleTextShadowNode::measureContent(
    const LayoutContext & /*layoutContext*/,
    const LayoutConstraints & /*layoutConstraints*/) const
{
  return {.width = 80, .height = 20};
}

} // namespace facebook::react

