//
//  UILabel+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

#import "NSString+BEKit.h"

@interface UILabel (BEKit)

- (CGFloat)be_calculatedHeight;

- (void)be_setFont:(UIFont * _Nonnull)font
      fromIndex:(NSInteger)fromIndex
        toIndex:(NSInteger)toIndex;

@end
