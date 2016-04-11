//
//  NSArray+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;

/**
 *  This category adds some useful methods to NSArray
 */
@interface NSArray (BEKit)

- (id _Nullable)be_objectAtIndex:(NSUInteger)index;

- (NSArray * _Nonnull)be_reversedArray;
+ (NSArray * _Nonnull)be_reversedArray:(NSArray * _Nonnull)array;

- (NSString * _Nonnull)be_arrayToJSON;
+ (NSString * _Nonnull)be_arrayToJSON:(NSArray * _Nonnull)array;

@end
