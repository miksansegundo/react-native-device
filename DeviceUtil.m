#import "DeviceUtil.h"
#import <React/RCTBridge.h>
#import <React/RCTUtils.h>
#import <sys/utsname.h>

@implementation DeviceUtil

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (NSDictionary *)constantsToExport {
    NSString *model = [[UIDevice currentDevice] model];
    NSString *name = [[UIDevice currentDevice] name];
    NSString *systemName = [[UIDevice currentDevice] systemName];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
  
    struct utsname systemInfo;
    uname(&systemInfo);
  
    NSString *deviceVersion = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *simulatorVersion = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];

    return @{
             @"model" : (model),
             @"name" : (name),
             @"systemName" : (systemName),
             @"systemVersion" : (systemVersion),
             @"deviceVersion" : (deviceVersion),
             @"simulatorVersion" : (simulatorVersion),
             };
}

@end
