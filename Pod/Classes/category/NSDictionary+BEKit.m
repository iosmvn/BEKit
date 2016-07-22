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

- (NSString * _Nonnull)be_dictionaryToJSON:(NSString * _Nonnull)defaultValue {
    return [NSDictionary be_dictionaryToJSON:self defaultValue:defaultValue];
}

+ (NSString * _Nonnull)be_dictionaryToJSON:(NSDictionary * _Nonnull)dictionary {
    return [self be_dictionaryToJSON:dictionary defaultValue:@"{}"];
}

+ (NSString * _Nonnull)be_dictionaryToJSON:(NSDictionary * _Nonnull)dictionary defaultValue:(NSString * _Nonnull)defaultValue {
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
    return result ? result : defaultValue;
}

- (NSArray * _Nonnull)be_arrayObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_arrayObject:self forKey:key];
}

- (NSArray * _Nonnull)be_arrayObjectForKey:(NSString * _Nonnull)key defaultValue:(NSArray * _Nonnull)defaultValue {
    return [NSDictionary be_arrayObject:self forKey:key defaultValue:defaultValue];
}

+ (NSArray * _Nonnull)be_arrayObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    return [self be_arrayObject:dictionary forKey:key defaultValue:@[]];
}

+ (NSArray * _Nonnull)be_arrayObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key defaultValue:(NSArray * _Nonnull)defaultValue {
    if (dictionary) {
        id valueObj = [dictionary objectForKey:key];
        if (valueObj && valueObj != [NSNull null] && [valueObj isKindOfClass:[NSArray class]]) {
            return (NSArray *)valueObj;
        }
    }
    return defaultValue;
}

- (NSDictionary * _Nonnull)be_dictionaryObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_dictionaryObject:self forKey:key];
}

- (NSDictionary * _Nonnull)be_dictionaryObjectForKey:(NSString * _Nonnull)key defaultValue:(NSDictionary * _Nonnull)defaultValue {
    return [NSDictionary be_dictionaryObject:self forKey:key defaultValue:defaultValue];
}

+ (NSDictionary * _Nonnull)be_dictionaryObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    return [self be_dictionaryObject:dictionary forKey:key defaultValue:@{}];
}

+ (NSDictionary * _Nonnull)be_dictionaryObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key defaultValue:(NSDictionary * _Nonnull)defaultValue {
    if (dictionary) {
        id valueObj = [dictionary objectForKey:key];
        if (valueObj && valueObj != [NSNull null] && [valueObj isKindOfClass:[NSDictionary class]]) {
            return (NSDictionary *)valueObj;
        }
    }
    return defaultValue;
}

- (NSString * _Nonnull)be_stringObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_stringObject:self forKey:key];
}

- (NSString * _Nonnull)be_stringObjectForKey:(NSString * _Nonnull)key defaultValue:(NSString * _Nonnull)defaultValue {
    return [NSDictionary be_stringObject:self forKey:key defaultValue:defaultValue];
}

+ (NSString * _Nonnull)be_stringObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    return [self be_stringObject:dictionary forKey:key defaultValue:@""];
}

+ (NSString * _Nonnull)be_stringObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key defaultValue:(NSString * _Nonnull)defaultValue {
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
            return defaultValue;
        }
        @finally {
            
        }
    }
    return defaultValue;
}

- (NSNumber * _Nonnull)be_numberObjectForKey:(NSString * _Nonnull)key {
    return [NSDictionary be_numberObject:self forKey:key];
}

- (NSNumber * _Nonnull)be_numberObjectForKey:(NSString * _Nonnull)key defaultValue:(NSNumber * _Nonnull)defaultValue {
    return [NSDictionary be_numberObject:self forKey:key defaultValue:defaultValue];
}

+ (NSNumber * _Nonnull)be_numberObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key {
    return [self be_numberObject:dictionary forKey:key defaultValue:@(0)];
}

+ (NSNumber * _Nonnull)be_numberObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key defaultValue:(NSNumber * _Nonnull)defaultValue {
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
            return defaultValue;
        }
        @finally {
            
        }
    }
    return defaultValue;
}

@end