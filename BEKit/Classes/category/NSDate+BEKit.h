//
//  NSDate+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import <Foundation/Foundation.h>

/**
 *  The simplified date structure
 */
struct BEDateInformation {
    NSInteger year;
    NSInteger month;
    NSInteger day;
    
	NSInteger weekday;
	
    NSInteger hour;
    NSInteger minute;
	NSInteger second;
    
    NSInteger nanosecond;//毫秒
	
};
typedef struct BEDateInformation BEDateInformation;

@interface NSDate (BEKit)

/**
 *  Create a NSDate with the yesterday date
 *
 *  @return Returns a NSDate with the yesterday date
 */
+ (NSDate * _Nonnull)be_yesterday;

/**
 *  Get the month from today
 *
 *  @return Returns the month
 */
+ (NSDate * _Nonnull)be_month;

/**
 *  Get the month from self
 *
 *  @return Returns the month
 */
- (NSDate * _Nonnull)be_month;

/**
 *  Get the weekday number from self
 *
 *  @return Returns weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)be_weekday;

/**
 *  Get the weekday as a localized string from self
 *
 *  @return Returns weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString * _Nonnull)be_dayFromWeekday;

/**
 *  Compare self with another date
 *
 *  @param anotherDate The another date to compare as NSDate
 *
 *  @return Returns YES if is same day, NO if not
 */
- (BOOL)be_isSameDay:(NSDate * _Nonnull)anotherDate;

/**
 *  Get the months number between self and another date
 *
 *  @param toDate The another date
 *
 *  @return Returns the months between the two dates
 */
- (NSInteger)be_monthsBetweenDate:(NSDate * _Nonnull)toDate;

/**
 *  Get the days number between self and another date
 *
 *  @param toDate The another date
 *
 *  @return Returns the days between the two dates
 */
- (NSInteger)be_daysBetweenDate:(NSDate * _Nonnull)toDate;

/**
 *  Returns if self is today
 *
 *  @return Returns if self is today
 */
- (BOOL)be_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *
 *  @return Returns self by adding the gived days number
 */
- (NSDate * _Nonnull)be_dateByAddingDays:(NSUInteger)days;

/**
 *  Create an NSDate with other two NSDate objects.
 *  Taken from the first date: day, month and year.
 *  Taken from the second date: hours and minutes.
 *
 *  @param aDate The first date for date
 *  @param aTime The second date for time
 *
 *  @return Returns the created NSDate
 */
+ (NSDate * _Nonnull)be_dateWithDatePart:(NSDate * _Nonnull)aDate
                          andTimePart:(NSDate * _Nonnull)aTime;

/**
 *  Get the month string from self
 *
 *  @return Returns the month string
 */
- (NSString * _Nonnull)be_monthString;

/**
 *  Get the year string from self
 *
 *  @return Returns the year string
 */
- (NSString * _Nonnull)be_yearString;

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Returns the given month as a localized string
 */
+ (NSString * _Nonnull)be_monthStringWithMonthNumber:(NSInteger)month;

/**
 *  Get self as a BFDateInformation structure
 *
 *  @return Returns self as a BFDateInformation structure
 */
- (BEDateInformation)be_dateInformation;

/**
 *  Get self as a BFDateInformation structure with a given time zone
 *
 *  @param timezone The timezone
 *
 *  @return Returns self as a BFDateInformation structure with a given time zone
 */
- (BEDateInformation)be_dateInformationWithTimeZone:(NSTimeZone * _Nonnull)timezone;

/**
 *  Returns a date from a given BFDateInformation structure
 *
 *  @param info The BFDateInformation to be converted
 *
 *  @return Returns a NSDate from a given BFDateInformation structure
 */
+ (NSDate * _Nonnull)be_dateFromDateInformation:(BEDateInformation)info;

/**
 *  Returns a date from a given BFDateInformation structure with a given time zone
 *
 *  @param info     The BFDateInformation to be converted
 *  @param timezone The timezone
 *
 *  @return Returns a NSDate from a given BFDateInformation structure with a given time zone
 */
+ (NSDate * _Nonnull)be_dateFromDateInformation:(BEDateInformation)info
                                    timeZone:(NSTimeZone * _Nonnull)timezone;

/**
 *  Get the given BFDateInformation structure as a formatted string
 *  Default dateSeparator = "/" and usFormat to NO
 *
 *  @param info The BFDateInformation to be formatted
 *
 *  @return Returns a NSString in the following format:
 *  D/M/Y H:M:S
 *  Example: 15/10/2013 10:38:43
 */
+ (NSString * _Nonnull)be_dateInformationDescriptionWithInformation:(BEDateInformation)info;

/**
 *  Get the given BFDateInformation structure as a formatted string
 *
 *  @param info          The BFDateInformation to be formatted
 *  @param dateSeparator The string to be used as date separator
 *  @param usFormat      Set if the timestamp is in US format or not
 *  @param nanosecond    Set if the timestamp has to have the nanosecond
 *
 *  @return Returns a NSString in the following format (dateSeparator = "/", usFormat to false and nanosecond to false). D/M/Y H:M:S. Example: 15/10/2013 10:38:43
 *  D/M/Y H:M:S
 *  Example: 15/10/2013 10:38:43
 */
+ (NSString * _Nonnull)be_dateInformationDescriptionWithInformation:(BEDateInformation)info
                                                   dateSeparator:(NSString * _Nonnull)dateSeparator
                                                        usFormat:(BOOL)usFormat
                                                      nanosecond:(BOOL)nanosecond;

/**
 *  Returns date with the year, month and day only
 *
 *  @return Date after removing all components but not year, month and day
 */
- (NSDate * _Nonnull)be_shortDate;

@end
