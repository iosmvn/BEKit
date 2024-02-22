//
//  NSObject+BEKit.h
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (BEKit)

- (BOOL)be_isValid;

- (id _Nullable)be_performSelector:(SEL _Nonnull)aSelector
                   withObjects:(id _Nullable)object, ... NS_REQUIRES_NIL_TERMINATION;

@end
