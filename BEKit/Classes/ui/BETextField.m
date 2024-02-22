//
//  BETextField.m
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import "BETextField.h"

@implementation BETextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.maxNumberOfCharacters = 0;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.maxNumberOfCharacters = [aDecoder decodeIntForKey:@"MaxNumberOfCharacters"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeInt64:(long)self.maxNumberOfCharacters forKey:@"MaxNumberOfCharacters"];
}

- (void)textFieldDidChange:(NSNotification *)notification {
    if (self.maxNumberOfCharacters != 0 && self.text.length >= self.maxNumberOfCharacters) {
        self.text = [self.text substringToIndex:self.maxNumberOfCharacters];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
