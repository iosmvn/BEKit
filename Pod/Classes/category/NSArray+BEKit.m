//
//  NSArray+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "NSArray+BEKit.h"
#import "NSObject+BEKit.h"

@implementation NSArray (BEKit)

- (id _Nullable)be_objectAtIndex:(NSUInteger)index {
    if (index < [self count]) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}

- (NSArray * _Nonnull)be_reversedArray {
    return [NSArray be_reversedArray:self];
}

+ (NSArray * _Nonnull)be_reversedArray:(NSArray * _Nonnull)array {
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[array count]];
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    for (id element in enumerator) [arrayTemp addObject:element];
    return arrayTemp;
}

- (NSString * _Nonnull)be_arrayToJSON {
    return [NSArray be_arrayToJSON:self];
}

+ (NSString * _Nonnull)be_arrayToJSON:(NSArray * _Nonnull)array {
    NSString * result = nil;
    if ([array be_isValid]) {
        @try {
            NSError *e = nil;
            NSData *d = [NSJSONSerialization dataWithJSONObject:array
                                                        options:kNilOptions
                                                          error:&e];
            if ([d be_isValid] && e == nil) {
                result = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
            }
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
    }
    return result ? result : @"[]";
}

@end
