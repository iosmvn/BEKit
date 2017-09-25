//
//  NSMutableArray+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "NSMutableArray+BEKit.h"
#import "NSObject+BEKit.h"
#import "NSArray+BEKit.h"

@implementation NSMutableArray (BEKit)

- (void)be_moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to {
    if (to != from) {
        id obj = [self be_objectAtIndex:from];
        [self removeObjectAtIndex:from];
        
        if (to >= [self count]) {
            [self addObject:obj];
        } else {
            [self insertObject:obj atIndex:to];
        }
    }
}

- (NSMutableArray * _Nonnull)be_reversedArray {
    return (NSMutableArray *)[NSArray be_reversedArray:self];
}

+ (NSMutableArray * _Nonnull)be_sortArrayByKey:(NSString * _Nonnull)key array:(NSMutableArray * _Nonnull)array ascending:(BOOL)ascending {
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    [tempArray removeAllObjects];
    [tempArray addObjectsFromArray:array];
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    NSArray *sortedArray = [tempArray sortedArrayUsingDescriptors:@[descriptor]];
    
    [tempArray removeAllObjects];
    tempArray = (NSMutableArray *)sortedArray;
    
    [array removeAllObjects];
    [array addObjectsFromArray:tempArray];
    
    return array;
}

- (void)be_addObject:(id _Nullable)anObject {
    if (![anObject be_isValid]) {
        [self addObject:anObject];
    }
}

- (void)be_removeObjectAtIndex:(NSUInteger)index {
    if (index < [self count]) {
        [self removeObjectAtIndex:index];
    }
}

@end
