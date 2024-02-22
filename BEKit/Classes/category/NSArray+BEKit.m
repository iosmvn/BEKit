//
//  NSArray+BEKit.m
//  BEKit
//
//  Created by dalong on 16/4/11.
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
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:[array count]];
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    for (id element in enumerator) {
        [tmp addObject:element];
    }
    return tmp;
}

- (NSString * _Nonnull)be_arrayToJSON {
    return [NSArray be_arrayToJSON:self];
}

+ (NSString * _Nonnull)be_arrayToJSON:(NSArray * _Nonnull)array {
    NSString *json = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
    if (data && !error) {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    } else {
        json = @"[]";
    }
    return json;
}

@end
