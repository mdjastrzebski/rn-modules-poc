//
//  RCTSimpleText.m
//  ReactNativeModules
//
//  Created by MDJ on 01/12/2025.
//

#import "RCTSimpleText.h"

#import <react/renderer/components/AppSpec/ComponentDescriptors.h>
#import <react/renderer/components/AppSpec/RCTComponentViewHelpers.h>

using namespace facebook::react;

@interface RCTSimpleText () <RCTSimpleTextViewProtocol>
@end


@implementation RCTSimpleText {
  UILabel *_label;
}

-(instancetype)init
{
  if (self = [super init]) {
    _label = [[UILabel alloc] init];
    [self addSubview:_label];
  }
  return self;
}

-(void)layoutSubviews
{
  [super layoutSubviews];
  _label.frame = self.bounds;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<SimpleTextComponentDescriptor>();
}


@end
