//
//  RCTExampleTurboModule.m
//  ReactNativeModules
//
//  Created by MDJ on 25/11/2025.
//

#import "RCTExampleTurboModule.h"

@implementation RCTExampleTurboModule

+ (NSString *)moduleName
{
  return @"ExampleTurboModule";
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeExampleTurboModuleSpecJSI>(params);
}

- (NSString *)numberToString:(double)value {
  return [NSString stringWithFormat:@"%d", (int)value];
}

@end
