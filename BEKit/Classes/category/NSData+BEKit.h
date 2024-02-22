//
//  NSData+BEKit.h
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import <Foundation/Foundation.h>

@interface NSData (BEKit)

- (NSString * _Nonnull)be_convertToUTF8String;
+ (NSString * _Nonnull)be_convertToUTF8String:(NSData * _Nonnull)data;

- (NSString * _Nonnull)be_convertToASCIIString;
+ (NSString * _Nonnull)be_convertToASCIIString:(NSData * _Nonnull)data;

- (NSString * _Nullable)be_convertUUIDToString;

@end
