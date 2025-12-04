//
//  RCTSimpleText.m
//  ReactNativeModules
//
//  Created by MDJ on 01/12/2025.
//

#import "RCTSimpleText.h"

#import <react/renderer/components/AppSpec/ComponentDescriptors.h>
#import <react/renderer/components/AppSpec/Props.h>
#import <react/renderer/components/AppSpec/RCTComponentViewHelpers.h>

#import "SimpleTextComponentDescriptor.h"

using namespace facebook::react;

@interface RCTSimpleText () <RCTSimpleTextViewProtocol>
@end


@implementation RCTSimpleText {
  SimpleTextShadowNode::ConcreteState::Shared _state;
  UILabel *_label;
}

-(instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    _label = [[UILabel alloc] init];
    self.contentView = _label;
  }
  return self;
}

//- (CGSize)intrinsicContentSize
//{
//  return _label.intrinsicContentSize;
//}
//
- (CGSize)sizeThatFits:(CGSize)size
{
  return [_label sizeThatFits:size];
}
//

//- (void)updateLayoutMetrics:(const LayoutMetrics &)layoutMetrics
//           oldLayoutMetrics:(const LayoutMetrics &)oldLayoutMetrics
//{
//  // Using stored `_layoutMetrics` as `oldLayoutMetrics` here to avoid
//  // re-applying individual sub-values which weren't changed.
//  [super updateLayoutMetrics:layoutMetrics oldLayoutMetrics:_layoutMetrics];
//  //_label.layoutMetrics = _layoutMetrics;
//  [_label setNeedsDisplay];
//  [self setNeedsLayout];
//}

-(void)layoutSubviews
{
  [super layoutSubviews];
  _label.frame = self.bounds;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<SimpleTextProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<SimpleTextProps const>(props);

  bool needsUpdateState = false;
  
  if (oldViewProps.text != newViewProps.text) {
    _label.text = [NSString stringWithUTF8String:newViewProps.text.c_str()];
    needsUpdateState = true;
  }
  
//  if (oldViewProps.fontSize != newViewProps.fontSize) {
//    _label.font = [UIFont systemFontOfSize:newViewProps.fontSize];
//  }
  
  if (needsUpdateState && _state != nullptr) {
    auto size = _label.intrinsicContentSize;
    _state->updateState(SimpleTextState(size.width, size.height));
  }

  [super updateProps:props oldProps:oldProps];
}

- (void)updateState:(State::Shared const &)state oldState:(State::Shared const &)oldState
{
  _state = std::static_pointer_cast<const SimpleTextShadowNode::ConcreteState>(state);
}

- (void)prepareForRecycle {
  [super prepareForRecycle];
  _label.text = nil;
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
  if (newWindow != nil) {
    auto size = _label.intrinsicContentSize;
    _state->updateState(SimpleTextState(size.width, size.height));
  }
}



+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<SimpleTextComponentDescriptor>();
}


@end
