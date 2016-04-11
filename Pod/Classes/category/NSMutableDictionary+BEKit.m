//
//  NSMutableArray+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "NSMutableDictionary+BEKit.h"

@implementation NSMutableDictionary (BEKit)

- (BOOL)be_setObject:(id _Nonnull)anObject forKey:(id<NSCopying> _Nonnull)aKey {
    if (anObject == nil) {
        return NO;
    }
    [self setObject:anObject forKey:aKey];
    return YES;
}

@end
