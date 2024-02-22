//
//  BELog.h
//  Pods
//
//  Created by dalong on 16/4/13.
//
//

#import <Foundation/Foundation.h>

void ExtendNSLog(const char * _Nonnull file, int lineNumber, const char * _Nonnull function, NSString * _Nonnull format, ...);

@interface BELog : NSObject

#ifdef DEBUG
/**
 *  Exented NSLog
 */
#define BELog(args ...) ExtendNSLog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args);
/**
 *  Log string
 */
#define BELogString [BELog logString]
/**
 *  Detailed log string
 */
#define BELogDetailedString [BELog logDetailedString]
/**
 *  Clear the log string
 */
#define BELogClear [BELog clearLog]
#else
#define BELog(args ...)
#define BELogString
#define BELogDetailedString
#define BELogClear
#endif

+ (void)clearLog;

+ (NSString * _Nonnull)logString;
+ (NSString * _Nonnull)detailedLogString;

@end
