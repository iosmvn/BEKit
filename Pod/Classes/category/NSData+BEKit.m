//
//  NSData+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "NSData+BEKit.h"

@implementation NSData (BEKit)

- (NSString * _Nonnull)be_convertToUTF8String {
    return [NSData be_convertToUTF8String:self];
}

+ (NSString * _Nonnull)be_convertToUTF8String:(NSData * _Nonnull)data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString * _Nonnull)be_convertToASCIIString {
    return [NSData be_convertToASCIIString:self];
}

+ (NSString * _Nonnull)be_convertToASCIIString:(NSData * _Nonnull)data {
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}

@end
