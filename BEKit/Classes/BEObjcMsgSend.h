//
//  BEObjcMsgSend.h
//  BEKit
//
//  Created by sundanlong on 2017/12/14.
//

#import <Foundation/Foundation.h>
#include <objc/message.h>

NS_ASSUME_NONNULL_BEGIN

static void (* _Nullable be_msgSend)(id, SEL, id _Nullable, ...) = (void (*)(id, SEL, id, ...))objc_msgSend;

static id _Nullable(* _Nullable be_id_msgSend)(id, SEL, id _Nullable, ...) = (id (*)(id, SEL, id, ...))objc_msgSend;

static BOOL(*be_bool_msgSend)(id, SEL, id _Nullable, ...) = (BOOL (*)(id, SEL, id, ...))objc_msgSend;

/*
 Method return type  |  be_objc_msgSend return type
 --------------------+-------------------------------
        void         |         nil
          id         |         id
        BOOL         |         NSNumber
       other         |         NSValue
 */
id _Nullable be_objc_msgSend_0(id target, SEL selector);
id _Nullable be_objc_msgSend_1(id target, SEL selector, id _Nullable object);
id _Nullable be_objc_msgSend_2(id target, SEL selector, id _Nullable object1, id _Nullable object2);

NS_ASSUME_NONNULL_END
