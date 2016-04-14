//
//  NSDictionary+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;

@interface NSDictionary (BEKit)

- (NSString * _Nonnull)be_dictionaryToJSON;
+ (NSString * _Nonnull)be_dictionaryToJSON:(NSDictionary * _Nonnull)dictionary;

- (NSArray * _Nonnull)be_arrayObjectForKey:(NSString * _Nonnull)key;
+ (NSArray * _Nonnull)be_arrayObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key;

- (NSDictionary * _Nonnull)be_dictionaryObjectForKey:(NSString * _Nonnull)key;
+ (NSDictionary * _Nonnull)be_dictionaryObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key;

- (NSString * _Nonnull)be_stringObjectForKey:(NSString * _Nonnull)key;
+ (NSString * _Nonnull)be_stringObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key;

- (NSNumber * _Nonnull)be_numberObjectForKey:(NSString * _Nonnull)key;
+ (NSNumber * _Nonnull)be_numberObject:(NSDictionary * _Nonnull)dictionary forKey:(NSString * _Nonnull)key;

@end