//
//  UITextField+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

@interface UITextField (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame
                           placeholder:(NSString * _Nonnull)placeholder
                                 color:(UIColor * _Nonnull)color
                                  font:(UIFont * _Nonnull)font
                            returnType:(UIReturnKeyType)returnType
                          keyboardType:(UIKeyboardType)keyboardType
                                secure:(BOOL)secure
                           borderStyle:(UITextBorderStyle)borderStyle
                    autoCapitalization:(UITextAutocapitalizationType)capitalization
                    keyboardAppearance:(UIKeyboardAppearance)keyboardAppearence
         enablesReturnKeyAutomatically:(BOOL)enablesReturnKeyAutomatically
                       clearButtonMode:(UITextFieldViewMode)clearButtonMode
                    autoCorrectionType:(UITextAutocorrectionType)autoCorrectionType
                              delegate:(id<UITextFieldDelegate> _Nullable)delegate;

@end
