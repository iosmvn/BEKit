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
    NSString * result = nil;
    if ([dictionary be_isValid]) {
        @try {
            NSError *e = nil;
            NSData *d = [NSJSONSerialization dataWithJSONObject:dictionary
                                                        options:kNilOptions
                                                          error:&e];
            if ([d be_isValid] && e == nil) {
                result = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
            }
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
    }
    return result ? result : @"{}";
}

- (NSArray * _Nonnull)be_arrayObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_arrayObject:self forKey:key];
}

+ (NSArray * _Nonnull)be_arrayObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    if (dictionary) {
        id valueObj = [dictionary objectForKey:key];
        if (valueObj && valueObj != [NSNull null] && [valueObj isKindOfClass:[NSArray class]]) {
            return (NSArray *)valueObj;
        }
    }
    return [NSArray array];
}

- (NSDictionary * _Nonnull)be_dictionaryObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_dictionaryObject:self forKey:key];
}

+ (NSDictionary * _Nonnull)be_dictionaryObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    if (dictionary) {
        id valueObj = [dictionary objectForKey:key];
        if (valueObj && valueObj != [NSNull null] && [valueObj isKindOfClass:[NSDictionary class]]) {
            return (NSDictionary *)valueObj;
        }
    }
    return [NSDictionary dictionary];
}

- (NSString * _Nonnull)be_stringObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_stringObject:self forKey:key];
}

+ (NSString * _Nonnull)be_stringObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    if (dictionary) {
        @try {
            id valueObj = [dictionary objectForKey:key];
            if (valueObj && valueObj != [NSNull null] && [valueObj isKindOfClass:[NSString class]]) {
                return (NSString *)valueObj;
            } else if (valueObj && valueObj != [NSNull null] && [valueObj isKindOfClass:[NSNumber class]]) {
                return [(NSNumber *)valueObj stringValue];
            }
        }
        @catch (NSException *exception) {
            return @"";
        }
        @finally {
            
        }
    }
    return @"";
}

- (NSNumber * _Nonnull)be_numberObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_numberObject:self forKey:key];
}

+ (NSNumber * _Nonnull)be_numberObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    if (dictionary) {
        @try {
            id valueObj = [dictionary objectForKey:key];
            if (valueObj && valueObj != [NSNull null] && [valueObj isKindOfClass:[NSNumber class]]) {
                return (NSNumber *)valueObj;
            } else if (valueObj && valueObj != [NSNull null] && [valueObj isKindOfClass:[NSString class]]) {
                double d = [(NSString *)valueObj doubleValue];
                return [NSNumber numberWithDouble:d];
            }
        }
        @catch (NSException *exception) {
            return [NSNumber numberWithDouble:0];
        }
        @finally {
            
        }
    }
    return [NSNumber numberWithDouble:0];
}

@end