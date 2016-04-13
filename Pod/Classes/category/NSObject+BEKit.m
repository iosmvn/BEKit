//
//  NSObject+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "NSObject+BEKit.h"

@implementation NSObject (BEKit)

- (BOOL)be_isNULL {
    return !(self == nil || [self isKindOfClass:[NSNull class]]);
}

- (id _Nonnull)be_performSelector:(SEL _Nonnull)aSelector withObjects:(id _Nullable)object, ... {
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if (signature) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:aSelector];
        
        va_list args;
        va_start(args, object);
        
        [invocation setArgument:&object atIndex:2];
        
        id arg = nil;
        int index = 3;
        while ((arg = va_arg(args, id))) {
            [invocation setArgument:&arg atIndex:index];
            index++;
        }
        
        va_end(args);
        
        [invocation invoke];
        if (signature.methodReturnLength) {
            id anObject;
            [invocation getReturnValue:&anObject];
            return anObject;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

@end
