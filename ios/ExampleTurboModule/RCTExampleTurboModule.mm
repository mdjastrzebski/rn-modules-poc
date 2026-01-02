//
//  RCTExampleTurboModule.m
//  ReactNativeModules
//
//  Created by MDJ on 25/11/2025.
//

#import "RCTExampleTurboModule.h"

using namespace facebook::react;

@implementation RCTExampleTurboModule

+ (NSString *)moduleName
{
  return @"ExampleTurboModule";
}

- (std::shared_ptr<TurboModule>)getTurboModule:(const ObjCTurboModule::InitParams &)params {
  return std::make_shared<NativeExampleTurboModuleSpecJSI>(params);
}

- (NSString *)numberToString:(double)value {
  return [NSString stringWithFormat:@"%d", (int)value];
}

@end
