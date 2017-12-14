//
//  BEObjcMsgSend.m
//  BEKit
//
//  Created by sundanlong on 2017/12/14.
//

#import "BEObjcMsgSend.h"
#import "BELog.h"

id be_objc_msgSend_0(id target, SEL selector){
    return be_objc_msgSend_2(target, selector, nil, nil);
}

id be_objc_msgSend_1(id target, SEL selector, id object){
    return be_objc_msgSend_2(target, selector, object, nil);
}

id be_objc_msgSend_2(id target, SEL selector, id object1, id object2){
    if (target == nil) {
        BELog(@"ERROR: Target should not be nil");
        return nil;
    }
    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
    if (signature == nil) {
        BELog(@"ERROR: %@ can't call '%@'.", target, NSStringFromSelector(selector));
        return nil;
    }
    
    const char *returnType = signature.methodReturnType;
    id returnValue = nil;
    if(strcmp(returnType, @encode(id)) == 0) {
        returnValue = be_id_msgSend(target, selector, object1, object2);
    } else if (strcmp(returnType, @encode(void)) == 0) {
        be_msgSend(target, selector, object1, object2);
    } else if (strcmp(returnType, @encode(BOOL)) == 0) {
        returnValue = @(be_bool_msgSend(target, selector, object1, object2));
    } else {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setSelector:selector];
        if (signature.numberOfArguments > 2) {
            [invocation setArgument:&object1 atIndex:2];
        }
        if (signature.numberOfArguments > 3) {
            [invocation setArgument:&object2 atIndex:3];
        }
        [invocation retainArguments];
        [invocation invokeWithTarget:target];
        void *value;
        [invocation getReturnValue:&value];
        returnValue = [NSValue valueWithPointer:value];
    }
    
    return returnValue;
}
