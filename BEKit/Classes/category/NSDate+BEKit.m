//
//  NSDate+BEKit.m
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import "NSDate+BEKit.h"
#import "BEKit.h"

@implementation NSDate (BEKit)

+ (NSDate * _Nonnull)be_yesterday {
	BEDateInformation inf = [[NSDate date] be_dateInformation];
	inf.day--;
	return [self be_dateFromDateInformation:inf];
}

- (NSDate * _Nonnull)be_month {
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:self];
    [comp setDay:1];
    
    return [calendar dateFromComponents:comp];
}

+ (NSDate * _Nonnull)be_month {
    return [[NSDate date] be_month];
}

- (NSInteger)be_weekday {
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	NSDateComponents *comps = [calendar components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:self];
    
	return [comps weekday];
}

- (NSString * _Nonnull)be_dayFromWeekday {
    switch ([self be_weekday]) {
        case 1:
            return BELocalizedString(@"SUNDAY", @"");
            break;
        case 2:
            return BELocalizedString(@"MONDAY", @"");
            break;
        case 3:
            return BELocalizedString(@"TUESDAY", @"");
            break;
        case 4:
            return BELocalizedString(@"WEDNESDAY", @"");
            break;
        case 5:
            return BELocalizedString(@"THURSDAY", @"");
            break;
        case 6:
            return BELocalizedString(@"FRIDAY", @"");
            break;
        case 7:
            return BELocalizedString(@"SATURDAY", @"");
            break;
        default:
            return @"";
            break;
    }
}

- (NSDate * _Nonnull)be_timelessDate  {
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    
	return [calendar dateFromComponents:comp];
}

- (NSDate * _Nonnull)be_monthlessDate  {
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:self];
	
    return [calendar dateFromComponents:comp];
}

- (BOOL)be_isSameDay:(NSDate * _Nonnull)anotherDate {
	NSCalendar* calendar = [NSCalendar currentCalendar];
	NSDateComponents* components1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
	NSDateComponents* components2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:anotherDate];
    
	return ([components1 year] == [components2 year] && [components1 month] == [components2 month] && [components1 day] == [components2 day]);
}

- (NSInteger)be_monthsBetweenDate:(NSDate * _Nonnull)toDate {
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth fromDate:[self be_monthlessDate] toDate:[toDate be_monthlessDate] options:0];
    
    return abs((int)[components month]);
}

- (NSInteger)be_daysBetweenDate:(NSDate * _Nonnull)anotherDate {
    NSTimeInterval time = [self timeIntervalSinceDate:anotherDate];
    return (NSInteger)fabs(time / 60 / 60 / 24);
}

- (BOOL)be_isToday {
	return [self be_isSameDay:[NSDate date]];
}

- (NSDate * _Nonnull)be_dateByAddingDays:(NSUInteger)days  {
    return [self dateByAddingTimeInterval:days * 24 * 60 * 60];
}

+ (NSDate * _Nonnull)be_dateWithDatePart:(NSDate *)aDate andTimePart:(NSDate *)aTime {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"dd/MM/yyyy"];
	NSString *datePortion = [dateFormatter stringFromDate:aDate];
	
	[dateFormatter setDateFormat:@"HH:mm"];
	NSString *timePortion = [dateFormatter stringFromDate:aTime];
	
	[dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
	NSString *dateTime = [NSString stringWithFormat:@"%@ %@",datePortion,timePortion];
    
	return [dateFormatter dateFromString:dateTime];
}

- (NSString * _Nonnull)be_monthString {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];	
	[dateFormatter setDateFormat:@"MMMM"];
    
	return [dateFormatter stringFromDate:self];
}

+ (NSString * _Nonnull)be_monthStringWithMonthNumber:(NSInteger)month {
    switch (month) {
        case 1:
            return BELocalizedString(@"JANUARY", @"");
            break;
        case 2:
            return BELocalizedString(@"FEBRUARY", @"");
            break;
        case 3:
            return BELocalizedString(@"MARCH", @"");
            break;
        case 4:
            return BELocalizedString(@"APRIL", @"");
            break;
        case 5:
            return BELocalizedString(@"MAY", @"");
            break;
        case 6:
            return BELocalizedString(@"JUNE", @"");
            break;
        case 7:
            return BELocalizedString(@"JULY", @"");
            break;
        case 8:
            return BELocalizedString(@"AUGUST", @"");
            break;
        case 9:
            return BELocalizedString(@"SEPTEMBER", @"");
            break;
        case 10:
            return BELocalizedString(@"OCTOBER", @"");
            break;
        case 11:
            return BELocalizedString(@"NOVEMBER", @"");
            break;
        case 12:
            return BELocalizedString(@"DECEMBER", @"");
            break;
        default:
            return @"";
            break;
    }
}

- (NSString * _Nonnull)be_yearString {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];	
	[dateFormatter setDateFormat:@"yyyy"];
    
	return [dateFormatter stringFromDate:self];
}

- (BEDateInformation)be_dateInformation {
    return [self be_dateInformationWithTimeZone:[NSTimeZone systemTimeZone]];
}

- (BEDateInformation)be_dateInformationWithTimeZone:(NSTimeZone * _Nonnull)timezone {
	BEDateInformation info;
	
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	[calendar setTimeZone:timezone];
	NSDateComponents *comp = [calendar components:(NSCalendarUnitMonth | NSCalendarUnitMinute | NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitSecond | NSCalendarUnitNanosecond) fromDate:self];
	info.day = [comp day];
	info.month = [comp month];
	info.year = [comp year];
	
	info.hour = [comp hour];
	info.minute = [comp minute];
	info.second = [comp second];
    info.nanosecond = [comp nanosecond];
    
	info.weekday = [comp weekday];
	
	return info;	
}

+ (NSDate * _Nonnull)be_dateFromDateInformation:(BEDateInformation)info {
    return [NSDate be_dateFromDateInformation:info timeZone:[NSTimeZone systemTimeZone]];
}

+ (NSDate * _Nonnull)be_dateFromDateInformation:(BEDateInformation)info timeZone:(NSTimeZone * _Nonnull)timezone {
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	[calendar setTimeZone:timezone];
	NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:[NSDate date]];
	
	[comp setDay:info.day];
	[comp setMonth:info.month];
	[comp setYear:info.year];
	[comp setHour:info.hour];
	[comp setMinute:info.minute];
	[comp setSecond:info.second];
    [comp setNanosecond:info.nanosecond];
    
	[comp setTimeZone:timezone];
	
	return [calendar dateFromComponents:comp];
}

+ (NSString * _Nonnull)be_dateInformationDescriptionWithInformation:(BEDateInformation)info {
    return [NSDate be_dateInformationDescriptionWithInformation:info dateSeparator:@"/" usFormat:NO nanosecond:NO];
}

+ (NSString * _Nonnull)be_dateInformationDescriptionWithInformation:(BEDateInformation)info dateSeparator:(NSString *)dateSeparator usFormat:(BOOL)usFormat nanosecond:(BOOL)nanosecond {
    NSString *description;
    
    if (usFormat) {
        description = [NSString stringWithFormat:@"%04li%@%02li%@%02li %02li:%02li:%02li", (long)info.year, dateSeparator, (long)info.month, dateSeparator, (long)info.day, (long)info.hour, (long)info.minute, (long)info.second];
    } else {
        description = [NSString stringWithFormat:@"%02li%@%02li%@%04li %02li:%02li:%02li", (long)info.month, dateSeparator, (long)info.day, dateSeparator, (long)info.year, (long)info.hour, (long)info.minute, (long)info.second];
    }
    
    if (nanosecond) {
        description = [description stringByAppendingString:[NSString stringWithFormat:@":%03li", (long)info.nanosecond / 10000000]];
    }
    
    return description;
}

- (NSDate * _Nonnull)be_shortDate {
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
    
    return [calendar dateFromComponents:dateComponents];
}

@end
