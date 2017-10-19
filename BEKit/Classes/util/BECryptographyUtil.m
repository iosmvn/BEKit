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

+ (NSString * _Nullable)be_MD5:(NSString * _Nonnull)string {
    if (string == nil || [string length] == 0) {
        return nil;
    }
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([string UTF8String], (int)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

+ (NSString * _Nullable)be_fileMD5:(NSString * _Nonnull)filePath chunkSize:(size_t)chunkSize {
    CFStringRef strRef = FileMD5HashCreateWithPath((__bridge CFStringRef)filePath, chunkSize);
    NSString *md5 =  (__bridge NSString *)strRef;
    CFRelease(strRef);
    return md5;
}

+ (NSString * _Nullable)be_SHA1:(NSString * _Nonnull)string {
    if (string == nil || [string length] == 0) {
        return nil;
    }
    
    unsigned char digest[CC_SHA1_DIGEST_LENGTH], i;
    CC_SHA1([string UTF8String], (int)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

+ (NSString * _Nullable)be_SHA256:(NSString * _Nonnull)string {
    if (string == nil || [string length] == 0) {
        return nil;
    }
    
    unsigned char digest[CC_SHA256_DIGEST_LENGTH], i;
    CC_SHA256([string UTF8String], (int)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

+ (NSString * _Nullable)be_SHA512:(NSString * _Nonnull)string {
    if (string == nil || [string length] == 0) {
        return nil;
    }
    
    unsigned char digest[CC_SHA512_DIGEST_LENGTH], i;
    CC_SHA512([string UTF8String], (int)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i = 0; i < CC_SHA512_DIGEST_LENGTH; i++)
    {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

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
