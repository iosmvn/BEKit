//
//  BECryptographyUtil.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "BECryptographyUtil.h"
#import <CommonCrypto/CommonCrypto.h>
#import "NSString+BEKit.h"
#import "NSData+BEKit.h"

#define BEFileHashDefaultChunkSizeForReadingData 1024*8

CFStringRef FileMD5HashCreateWithPath(CFStringRef filePath,size_t chunkSizeForReadingData) {
    // Declare needed variables
    CFStringRef result = NULL;
    CFReadStreamRef readStream = NULL;
    // Get the file URL
    CFURLRef fileURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)filePath, kCFURLPOSIXPathStyle, (Boolean)false);
    if (!fileURL) goto done;
    // Create and open the read stream
    readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault, (CFURLRef)fileURL);
    if (!readStream) goto done;
    bool didSucceed = (bool)CFReadStreamOpen(readStream);
    if (!didSucceed) goto done;
    // Initialize the hash object
    CC_MD5_CTX hashObject;
    CC_MD5_Init(&hashObject);
    // Make sure chunkSizeForReadingData is valid
    if (!chunkSizeForReadingData) {
        chunkSizeForReadingData = BEFileHashDefaultChunkSizeForReadingData;
    }
    // Feed the data to the hash object
    bool hasMoreData = true;
    while (hasMoreData) {
        uint8_t buffer[chunkSizeForReadingData];
        CFIndex readBytesCount = CFReadStreamRead(readStream,(UInt8 *)buffer,(CFIndex)sizeof(buffer));
        if (readBytesCount == -1) break;
        if (readBytesCount == 0) {
            hasMoreData = false;
            continue;
        }
        CC_MD5_Update(&hashObject,(const void *)buffer,(CC_LONG)readBytesCount);
    }
    // Check if the read operation succeeded
    didSucceed = !hasMoreData;
    // Compute the hash digest
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &hashObject);
    // Abort if the read operation failed
    if (!didSucceed) goto done;
    // Compute the string result
    char hash[2 * sizeof(digest) + 1];
    for (size_t i = 0; i < sizeof(digest); ++i) {
        snprintf(hash + (2 * i), 3, "%02x", (int)(digest[i]));
    }
    result = CFStringCreateWithCString(kCFAllocatorDefault,(const char *)hash,kCFStringEncodingUTF8);
done:
    if (readStream) {
        CFReadStreamClose(readStream);
        CFRelease(readStream);
    }
    if (fileURL) {
        CFRelease(fileURL);
    }
    return result;
}

@implementation BECryptographyUtil

#pragma mark - 散列函数
+ (NSString * _Nullable)be_MD5:(NSString * _Nonnull)string {
    const char *strData = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(strData, (CC_LONG)strlen(strData), digest);
    return [self be_stringFromBytes:digest length:CC_MD5_DIGEST_LENGTH];
}

+ (NSString * _Nullable)be_fileMD5:(NSString * _Nonnull)filePath chunkSize:(size_t)chunkSize {
    CFStringRef strRef = FileMD5HashCreateWithPath((__bridge CFStringRef)filePath, chunkSize);
    NSString *md5 =  (__bridge NSString *)strRef;
    CFRelease(strRef);
    return md5;
}

+ (NSString * _Nullable)be_SHA1:(NSString * _Nonnull)string {
    const char *strData = [string UTF8String];
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(strData, (CC_LONG)strlen(strData), digest);
    return [self be_stringFromBytes:digest length:CC_SHA1_DIGEST_LENGTH];
}

+ (NSString * _Nullable)be_SHA256:(NSString * _Nonnull)string {
    const char *strData = [string UTF8String];
    unsigned char digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(strData, (CC_LONG)strlen(strData), digest);
    return [self be_stringFromBytes:digest length:CC_SHA256_DIGEST_LENGTH];
}

+ (NSString * _Nullable)be_SHA512:(NSString * _Nonnull)string {
    const char *strData = [string UTF8String];
    unsigned char digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(strData, (CC_LONG)strlen(strData), digest);
    return [self be_stringFromBytes:digest length:CC_SHA512_DIGEST_LENGTH];
}

+ (NSString * _Nullable)be_HmacMD5:(NSString * _Nonnull)string key:(NSString * _Nonnull)key {
    return [self be_Hmac:kCCHmacAlgMD5 string:string key:key];
}

+ (NSString * _Nullable)be_HmacSHA1:(NSString * _Nonnull)string key:(NSString * _Nonnull)key {
    return [self be_Hmac:kCCHmacAlgSHA1 string:string key:key];
}

+ (NSString * _Nullable)be_HmacSHA256:(NSString * _Nonnull)string key:(NSString * _Nonnull)key {
    return [self be_Hmac:kCCHmacAlgSHA256 string:string key:key];
}

+ (NSString * _Nullable)be_HmacSHA512:(NSString * _Nonnull)string key:(NSString * _Nonnull)key {
    return [self be_Hmac:kCCHmacAlgSHA512 string:string key:key];
}

+ (NSString * _Nullable)be_HmacSHA384:(NSString * _Nonnull)string key:(NSString * _Nonnull)key {
    return [self be_Hmac:kCCHmacAlgSHA384 string:string key:key];
}

#pragma mark - Private

+ (NSString * _Nullable)be_Hmac:(CCHmacAlgorithm)algorithm string:(NSString * _Nonnull)string key:(NSString * _Nonnull)key {
    int digestLength = -1;
    switch (algorithm) {
        case kCCHmacAlgMD5:
        {
            digestLength = CC_MD5_DIGEST_LENGTH;
        }
            break;
        case kCCHmacAlgSHA1:
        {
            digestLength = CC_SHA1_DIGEST_LENGTH;
        }
            break;
        case kCCHmacAlgSHA256:
        {
            digestLength = CC_SHA256_DIGEST_LENGTH;
        }
            break;
        case kCCHmacAlgSHA512:
        {
            digestLength = CC_SHA512_DIGEST_LENGTH;
        }
            break;
        case kCCHmacAlgSHA384:
        {
            digestLength = CC_SHA384_DIGEST_LENGTH;
        }
            break;
            
        default:
            break;
    }
    if (digestLength == -1) {
        return nil;
    }
    const char *keyData = [key UTF8String];
    const char *strData = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CCHmac(algorithm, keyData, (size_t)strlen(keyData), strData, (size_t)strlen(strData), digest);
    return [self be_stringFromBytes:digest length:digestLength];
}

#pragma mark - Helpers

/**
 返回二进制 Bytes 流的字符串表现形式
 
 @param bytes 二进制 Bytes 数组
 @param length 数组长度
 @return 字符串表现形式
 */
+ (NSString * _Nullable)be_stringFromBytes:(unsigned char *)bytes length:(NSUInteger)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (NSUInteger i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}

////echo -n hello | openssl enc -aes-128-ecb -K 616263 -nosalt | base64
//- (NSString * _Nullable)be_encrypt:(CCHmacAlgorithm)algorithm string:(NSString * _Nonnull)string key:(NSString * _Nonnull)key iv:(NSData * _Nullable)iv {
//    int keyLength = -1;
//    int blockLength = -1;
//    switch (algorithm) {
//        case kCCAlgorithmAES128:
//        {
//            keyLength = kCCKeySizeAES128;
//            blockLength = kCCBlockSizeAES128;
//        }
//            break;
//        case kCCAlgorithmDES:
//        {
//            keyLength = kCCKeySizeDES;
//            blockLength = kCCBlockSizeDES;
//        }
//            break;
//
//        default:
//            break;
//    }
//    // 设置密钥
//    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
//    uint8_t cKey[keyLength];
//    bzero(cKey, sizeof(cKey));
//    [keyData getBytes:cKey length:keyLength];
//    //设置iv
//    uint8_t cIV[blockLength];
//    bzero(cIV, sizeof(cIV));
//    CCOptions options = 0;
//    if (iv) {
//        [iv getBytes:cIV length:blockLength];
//        option = kCCOptionPKCS7Padding;
//    } else {
//        option = kCCOptionPKCS7Padding | kCCOptionECBMode;
//    }
//    // 设置输出缓冲区
//    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
//    size_t bufferSize = [data length] + blockLength;
//    void *buffer = malloc(bufferSize);
//    // 开始加密
//    size_t encryptedLength = 0;
//    CCCryptorStatus status = CCCrypt(kCCEncrypt,
//                                     algorithm,
//                                     option,
//                                     [keyData bytes],
//                                     [keyData length],
//                                     cIV,
//                                     [data bytes],
//                                     [data length],
//                                     buffer,
//                                     bufferSize,
//                                     encryptedLength)
//    NSData *result = nil;
//    if (status == kCCSuccess) {
//        result = [NSData dataWithBytesNoCopy:buffer length:encryptedLength];
//    } else {
//        free(buffer);
//        NSLog(@"[错误]加密失败|状态编码：%d", status);
//    }
//    return [result base64EncodedStringWithOptions:0];
//}


+ (NSData * _Nullable)be_AES128EncryptData:(NSData * _Nonnull)data withKey:(NSString * _Nonnull)key {
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding, keyPtr, kCCKeySizeAES128, NULL, [data bytes], dataLength, buffer, bufferSize, &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}

+ (NSData *)be_AES128DecryptData:(NSData * _Nonnull)data withKey:(NSString * _Nonnull)key {
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding, keyPtr, kCCKeySizeAES128, NULL, [data bytes], dataLength, buffer, bufferSize, &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer);
    return nil;
}

+ (NSData * _Nullable)be_AES256EncryptData:(NSData * _Nonnull)data withKey:(NSString * _Nonnull)key {
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding, keyPtr, kCCKeySizeAES256, NULL, [data bytes], dataLength, buffer, bufferSize, &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}

+ (NSData *)be_AES256DecryptData:(NSData * _Nonnull)data withKey:(NSString * _Nonnull)key {
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding, keyPtr, kCCKeySizeAES256, NULL, [data bytes], dataLength, buffer, bufferSize, &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer);
    return nil;
}

+ (NSData * _Nullable)be_AES128EncryptString:(NSString * _Nonnull)string withKey:(NSString * _Nonnull)key {
    return [BECryptographyUtil be_AES128EncryptData:[string be_convertToNSData] withKey:key];
}

+ (NSData * _Nullable)be_AES128DecryptString:(NSString * _Nonnull)string withKey:(NSString * _Nonnull)key {
    return [BECryptographyUtil be_AES128DecryptData:[string be_convertToNSData] withKey:key];
}

+ (NSData * _Nullable)be_AES256EncryptString:(NSString * _Nonnull)string withKey:(NSString * _Nonnull)key {
    return [BECryptographyUtil be_AES256EncryptData:[string be_convertToNSData] withKey:key];
}

+ (NSData * _Nullable)be_AES256DecryptString:(NSString * _Nonnull)string withKey:(NSString * _Nonnull)key {
    return [BECryptographyUtil be_AES256DecryptData:[string be_convertToNSData] withKey:key];
}

@end
