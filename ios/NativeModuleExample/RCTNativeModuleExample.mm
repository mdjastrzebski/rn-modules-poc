//
//  RCTNativeModuleExample.m
//  ReactNativeModules
//
//  Created by MDJ on 25/11/2025.
//

#import "RCTNativeModuleExample.h"

@implementation RCTNativeModuleExample

+ (NSString *)moduleName
{
  return @"NativeModuleExample";
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeModuleExampleSpecJSI>(params);
}

- (NSString *)numberToString:(double)value {
  return [NSString stringWithFormat:@"%d", (int)value];
}

@end
