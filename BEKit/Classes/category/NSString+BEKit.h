//
//  NSString+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

@interface NSString (BEKit)

+ (NSString * _Nonnull)be_searchInString:(NSString *_Nonnull)string
                               charStart:(char)start
                                 charEnd:(char)end;

- (NSString * _Nonnull)be_searchCharStart:(char)start
                                  charEnd:(char)end;

- (NSInteger)be_indexOfCharacter:(char)character;

- (NSString * _Nonnull)be_substringFromCharacter:(char)character;

- (NSString * _Nonnull)be_substringToCharacter:(char)character;

- (NSString * _Nullable)be_MD5;

- (NSString * _Nullable)be_SHA1;

- (NSString * _Nullable)be_SHA256;

- (NSString * _Nullable)be_SHA512;

- (BOOL)be_hasString:(NSString * _Nonnull)substring;

- (BOOL)be_hasString:(NSString * _Nonnull)substring
       caseSensitive:(BOOL)caseSensitive;

- (BOOL)be_isValidString;

- (BOOL)be_isValidHttpURL;

- (BOOL)be_isEmail;
+ (BOOL)be_isEmail:(NSString * _Nonnull)email;

+ (NSString * _Nonnull)be_convertToUTF8Entities:(NSString * _Nonnull)string;

+ (NSString * _Nonnull)be_encodeToBase64:(NSString * _Nonnull)string;
- (NSString * _Nonnull)be_encodeToBase64;

+ (NSString * _Nonnull)be_decodeBase64:(NSString * _Nonnull)string;
- (NSString * _Nonnull)be_decodeBase64;

+ (NSData * _Nonnull)be_convertToNSData:(NSString * _Nonnull)string;
- (NSData * _Nonnull)be_convertToNSData;

- (NSString * _Nonnull)be_sentenceCapitalizedString;

- (NSString * _Nonnull)be_dateFromTimestamp;

- (NSString * _Nonnull)be_URLEncode;

- (NSString * _Nonnull)be_removeExtraSpaces;

- (NSString * _Nonnull)be_stringByReplacingWithRegex:(NSString * _Nonnull)regexString
                                          withString:(NSString * _Nonnull)replacement;

- (NSString * _Nonnull)be_HEXToString;

- (NSString * _Nonnull)be_stringToHEX;

+ (NSString * _Nonnull)be_generateUUID;

- (BOOL)be_isUUID;

- (BOOL)be_isUUIDForAPNS;

- (NSString * _Nonnull)be_convertToAPNSUUID;

- (CGFloat)be_heightForWidth:(float)width
                     andFont:(UIFont * _Nonnull)font;

@end
