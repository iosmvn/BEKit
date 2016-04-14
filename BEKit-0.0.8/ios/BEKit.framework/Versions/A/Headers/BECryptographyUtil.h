//
//  BECryptographyUtil.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import <Foundation/Foundation.h>

/**
 *  This class adds some useful methods to encrypt/decrypt data.
 *  All methods are static
 */

@interface BECryptographyUtil : NSObject

/**
 *  Create a MD5 string
 *
 *  @param string The string to be converted
 *
 *  @return Returns the MD5 NSString
 */
+ (NSString * _Nullable)be_MD5:(NSString * _Nonnull)string;

/**
 *  Create a SHA1 string
 *
 *  @param string The string to be converted
 *
 *  @return Returns the SHA1 NSString
 */
+ (NSString * _Nullable)be_SHA1:(NSString * _Nonnull)string;

/**
 *  Create a SHA256 string
 *
 *  @param string The string to be converted
 *
 *  @return Returns the SHA256 NSString
 */
+ (NSString * _Nullable)be_SHA256:(NSString * _Nonnull)string;

/**
 *  Create a SHA512 string
 *
 *  @param string The string to be converted
 *
 *  @return Returns the SHA512 NSString
 */
+ (NSString * _Nullable)be_SHA512:(NSString * _Nonnull)string;

/**
 *  Encrypt NSData in AES128
 *
 *  @param data NSData to be encrypted
 *  @param key  Key to encrypt data
 *
 *  @return Returns the encrypted NSData
 */
+ (NSData * _Nullable)be_AES128EncryptData:(NSData * _Nonnull)data
                                withKey:(NSString * _Nonnull)key;

/**
 *  Decrypt NSData in AES128
 *
 *  @param data NSData to be decrypted
 *  @param key  Key to decrypt data
 *
 *  @return Returns the decrypted NSData
 */
+ (NSData * _Nullable)be_AES128DecryptData:(NSData * _Nonnull)data
                                withKey:(NSString * _Nonnull)key;

/**
 *  Encrypt NSData in AES256
 *
 *  @param data NSData to be encrypted
 *  @param key  Key to encrypt data
 *
 *  @return Returns the encrypted NSData
 */
+ (NSData * _Nullable)be_AES256EncryptData:(NSData * _Nonnull)data
                                withKey:(NSString * _Nonnull)key;

/**
 *  Decrypt NSData in AES256
 *
 *  @param data NSData to be decrypted
 *  @param key  Key to decrypt data
 *
 *  @return Returns the decrypted NSData
 */
+ (NSData * _Nullable)be_AES256DecryptData:(NSData * _Nonnull)data
                                withKey:(NSString * _Nonnull)key;

/**
 *  Encrypt NSString in AES128
 *
 *  @param data NSString to be encrypted
 *  @param key  Key to encrypt data
 *
 *  @return Returns the encrypted NSData
 */
+ (NSData * _Nullable)be_AES128EncryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

/**
 *  Decrypt NSString in AES128
 *
 *  @param data NSString to be decrypted
 *  @param key  Key to decrypt data
 *
 *  @return Returns the decrypted NSData
 */
+ (NSData * _Nullable)be_AES128DecryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

/**
 *  Encrypt NSString in AES256
 *
 *  @param data NSString to be encrypted
 *  @param key  Key to encrypt data
 *
 *  @return Returns the encrypted NSData
 */
+ (NSData * _Nullable)be_AES256EncryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

/**
 *  Decrypt NSString in AES256
 *
 *  @param data NSString to be decrypted
 *  @param key  Key to decrypt data
 *
 *  @return Returns the decrypted NSData
 */
+ (NSData * _Nullable)be_AES256DecryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

@end
