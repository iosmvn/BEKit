//
//  NSDictionary+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "NSDictionary+BEKit.h"
#import "NSObject+BEKit.h"

@implementation NSDictionary (BEKit)

- (NSString * _Nonnull)be_dictionaryToJSON {
    return [NSDictionary be_dictionaryToJSON:self];
}

+ (NSString * _Nonnull)be_dictionaryToJSON:(NSDictionary * _Nonnull)dictionary {
    NSString *json = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    if (data && !error) {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    } else {
        json = @"{}";
    }
    return json;
}

- (NSArray * _Nonnull)be_arrayObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_arrayObject:self forKey:key];
}

+ (NSArray * _Nonnull)be_arrayObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    id valueObj = [dictionary objectForKey:key];
    if ([valueObj be_isValid] && [valueObj isKindOfClass:[NSArray class]]) {
        return (NSArray *)valueObj;
    }
    return @[];
}

- (NSDictionary * _Nonnull)be_dictionaryObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_dictionaryObject:self forKey:key];
}

+ (NSDictionary * _Nonnull)be_dictionaryObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    id valueObj = [dictionary objectForKey:key];
    if ([valueObj be_isValid] && [valueObj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)valueObj;
    }
    return @{};
}

- (NSString * _Nonnull)be_stringObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_stringObject:self forKey:key];
}

+ (NSString * _Nonnull)be_stringObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    NSString *result = nil;
    @try {
        id valueObj = [dictionary objectForKey:key];
        if ([valueObj be_isValid] && [valueObj isKindOfClass:[NSString class]]) {
            result = (NSString *)valueObj;
        } else if ([valueObj be_isValid] && [valueObj isKindOfClass:[NSNumber class]]) {
            result = [(NSNumber *)valueObj stringValue];
        }
    }
    @catch (NSException *exception) {
        result = @"";
    }
    @finally {
        
    }
    return result;
}

- (NSNumber * _Nonnull)be_numberObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_numberObject:self forKey:key];
}

+ (NSNumber * _Nonnull)be_numberObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    NSNumber *result = nil;
    @try {
        id valueObj = [dictionary objectForKey:key];
        if ([valueObj be_isValid] && [valueObj isKindOfClass:[NSNumber class]]) {
            result = (NSNumber *)valueObj;
        } else if ([valueObj be_isValid] && [valueObj isKindOfClass:[NSString class]]) {
            double d = [(NSString *)valueObj doubleValue];
            result = @(d);
        }
    }
    @catch (NSException *exception) {
        result = @(0);
    }
    @finally {
        
    }
    return result;
}

@end
