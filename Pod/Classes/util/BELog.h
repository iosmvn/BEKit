//
//  BELog.h
//  Pods
//
//  Created by sundanlong on 16/4/13.
//
//

#import <Foundation/Foundation.h>

/**
 *  Exented NSLog
 *
 *  @param file         File
 *  @param lineNumber   Line number
 *  @param functionName Function name
 *  @param format       Format
 */
void ExtendNSLog(const char * _Nonnull file, int lineNumber, const char * _Nonnull function, NSString * _Nonnull format, ...);

@interface BELog : NSObject

#ifdef DEBUG
/**
 *  Exented NSLog
 */
#define BFLog(args ...) ExtendNSLog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args);
/**
 *  Log string
 */
#define BFLogString [BFLog logString]
/**
 *  Detailed log string
 */
#define BFLogDetailedString [BFLog logDetailedString]
/**
 *  Clear the log string
 */
#define BFLogClear [BFLog clearLog]
#else
#define BFLog(args ...)
#define BFLogString
#define BFLogDetailedString
#define BFLogClear
#endif

+ (void)clearLog;

+ (NSString * _Nonnull)logString;
+ (NSString * _Nonnull)detailedLogString;

@end
