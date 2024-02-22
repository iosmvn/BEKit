//
//  NSThread+BEKit.h
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import <Foundation/Foundation.h>

NS_INLINE void be_runOnMainThread(void  (^ _Nonnull block)(void)) {
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}

@interface NSThread (BEKit)

@end
