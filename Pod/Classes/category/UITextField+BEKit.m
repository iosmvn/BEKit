//
//  UITextField+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UITextField+BEKit.h"

@implementation UITextField (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame placeholder:(NSString * _Nonnull)placeholder color:(UIColor * _Nonnull)color font:(UIFont * _Nonnull)font returnType:(UIReturnKeyType)returnType keyboardType:(UIKeyboardType)keyboardType secure:(BOOL)secure borderStyle:(UITextBorderStyle)borderStyle autoCapitalization:(UITextAutocapitalizationType)capitalization keyboardAppearance:(UIKeyboardAppearance)keyboardAppearence enablesReturnKeyAutomatically:(BOOL)enablesReturnKeyAutomatically clearButtonMode:(UITextFieldViewMode)clearButtonMode autoCorrectionType:(UITextAutocorrectionType)autoCorrectionType delegate:(id<UITextFieldDelegate> _Nullable)delegate {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    [textField setBorderStyle:borderStyle];
    [textField setAutocorrectionType:autoCorrectionType];
    [textField setClearButtonMode:clearButtonMode];
    [textField setKeyboardType:keyboardType];
    [textField setAutocapitalizationType:capitalization];
    [textField setPlaceholder:placeholder];
    [textField setTextColor:color];
    [textField setReturnKeyType:returnType];
    [textField setEnablesReturnKeyAutomatically:enablesReturnKeyAutomatically];
    [textField setSecureTextEntry:secure];
    [textField setKeyboardAppearance:keyboardAppearence];
    [textField setFont:font];
    [textField setDelegate:delegate];
    
    return textField;
}

@end
