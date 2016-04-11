//
//  NSArray+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "NSArray+BEKit.h"

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
    NSString *json = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
    if (!error) {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return json;
    } else {
        return error.localizedDescription;
    }
}

@end
