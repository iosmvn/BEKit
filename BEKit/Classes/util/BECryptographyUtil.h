//
//  BECryptographyUtil.h
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import <Foundation/Foundation.h>

/**
 *  This class adds some useful methods to encrypt/decrypt data.
 *  All methods are static
 */

@interface BECryptographyUtil : NSObject

/**
 计算MD5散列结果
 
 终端测试命令
 @code
 md5 -s "string"
 @endcode
 
 <p>提示：随着MD5碰撞生成器的出现，MD5算法不应被用于任何软件完整性检查或者代码签名的用途。</p>
 
 @return 32个字符的MD5散列字符串
 */
+ (NSString * _Nullable)be_MD5:(NSString * _Nonnull)string;


+ (NSString * _Nullable)be_fileMD5:(NSString * _Nonnull)filePath chunkSize:(size_t)chunkSize;


/**
 计算SHA1散列结果
 
 终端测试命令
 @code
 echo -n "string" | openssl sha -sha1
 @endcode
 
 @return 40个字符的SHA1散列字符串
 */
+ (NSString * _Nullable)be_SHA1:(NSString * _Nonnull)string;

/**
 计算SHA256散列结果
 
 终端测试命令
 @code
 echo -n "string" | openssl sha -sha256
 @endcode
 
 @return 64个字符的SHA256散列字符串
 */
+ (NSString * _Nullable)be_SHA256:(NSString * _Nonnull)string;

/**
 计算SHA512散列结果
 
 终端测试命令
 @code
 echo -n "string" | openssl sha -sha512
 @endcode
 
 @return 64个字符的SHA512散列字符串
 */
+ (NSString * _Nullable)be_SHA512:(NSString * _Nonnull)string;

/**
 HMAC散列函数-MD5
 */
+ (NSString * _Nullable)be_HmacMD5:(NSString * _Nonnull)string key:(NSString * _Nonnull)key;

/**
 HMAC散列函数-SHA1
 */
+ (NSString * _Nullable)be_HmacSHA1:(NSString * _Nonnull)string key:(NSString * _Nonnull)key;

/**
 HMAC散列函数-SHA256
 */
+ (NSString * _Nullable)be_HmacSHA256:(NSString * _Nonnull)string key:(NSString * _Nonnull)key;

/**
 HMAC散列函数-SHA512
 */
+ (NSString * _Nullable)be_HmacSHA512:(NSString * _Nonnull)string key:(NSString * _Nonnull)key;

/**
 HMAC散列函数-SHA384
 */
+ (NSString * _Nullable)be_HmacSHA384:(NSString * _Nonnull)string key:(NSString * _Nonnull)key;

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
 Encrypt NSString in AES128

 @param string NSString to be encrypted
 @param key Key to encrypt data
 @return Returns the encrypted NSData
 */
+ (NSData * _Nullable)be_AES128EncryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

/**
 Decrypt NSString in AES128
 
 @param string NSString to be decrypted
 @param key Key to decrypt data
 @return Returns the decrypted NSData
 */
+ (NSData * _Nullable)be_AES128DecryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

/**
 Encrypt NSString in AES256
 
 @param string NSString to be encrypted
 @param key Key to encrypt data

 @return Returns the encrypted NSData
 */
+ (NSData * _Nullable)be_AES256EncryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

/**
 Decrypt NSString in AES256
 
 @param string NSString to be decrypted
 @param key Key to decrypt data
 @return Returns the decrypted NSData
 */
+ (NSData * _Nullable)be_AES256DecryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

@end
