//
//  UITextView+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

@interface UITextView (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame
                                     text:(NSString * _Nonnull)text
                                    color:(UIColor * _Nonnull)color
                                     font:(UIFont * _Nonnull)font
                                alignment:(NSTextAlignment)alignment
                        dataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes
                                 editable:(BOOL)editable
                               selectable:(BOOL)selectable
                               returnType:(UIReturnKeyType)returnType
                             keyboardType:(UIKeyboardType)keyboardType
                                   secure:(BOOL)secure
                       autoCapitalization:(UITextAutocapitalizationType)capitalization
                       keyboardAppearance:(UIKeyboardAppearance)keyboardAppearence
            enablesReturnKeyAutomatically:(BOOL)enablesReturnKeyAutomatically
                       autoCorrectionType:(UITextAutocorrectionType)autoCorrectionType
                                 delegate:(id<UITextViewDelegate> _Nullable)delegate;

@end
