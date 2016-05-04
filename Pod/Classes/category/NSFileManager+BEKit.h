//
//  NSFileManager+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;

/**
 *  Directory type enum
 */
typedef NS_ENUM(NSInteger, DirectoryType) {
    /**
     *  Main bundle directory
     */
    DirectoryTypeMainBundle = 0,
    /**
     *  Library directory
     */
    DirectoryTypeLibrary,
    /**
     *  Documents directory
     */
    DirectoryTypeDocuments,
    /**
     *  Cache directory
     */
    DirectoryTypeCache
};

#define BE_fileName @"BE_fileName_Key"
#define BE_filePath @"BE_filePath_Key"

@interface NSFileManager (BEKit)

+ (NSString * _Nullable)be_readTextFile:(NSString * _Nonnull)file
                              ofType:(NSString * _Nonnull)type;

+ (BOOL)be_saveArrayToPath:(DirectoryType)path
           withFilename:(NSString * _Nonnull)fileName
                  array:(NSArray * _Nonnull)array;

+ (NSArray * _Nullable)be_loadArrayFromPath:(DirectoryType)path
                               withFilename:(NSString * _Nonnull)fileName;

+ (BOOL)be_createFileAtPath:(NSString * _Nonnull)fullPath;

+ (BOOL)be_createDirectoryAtPath:(NSString * _Nonnull)fullPath;

+ (NSString * _Nonnull)be_getBundlePathForFile:(NSString * _Nonnull)fileName;

+ (NSString * _Nonnull)be_getDocumentsDirectoryForFile:(NSString * _Nonnull)fileName;

+ (NSString * _Nonnull)be_getLibraryDirectoryForFile:(NSString * _Nonnull)fileName;

+ (NSString * _Nonnull)be_getCacheDirectoryForFile:(NSString * _Nonnull)fileName;

+ (NSNumber * _Nullable)be_fileSize:(NSString * _Nonnull)fileName
                   fromDirectory:(DirectoryType)directory;

+ (BOOL)be_deleteFile:(NSString * _Nonnull)fileName
     fromDirectory:(DirectoryType)directory;

+ (BOOL)be_moveLocalFile:(NSString * _Nonnull)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination;

+ (BOOL)be_moveLocalFile:(NSString * _Nonnull)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination
       withFolderName:(NSString * _Nullable)folderName;

+ (BOOL)be_duplicateFileAtPath:(NSString * _Nonnull)origin
                  toNewPath:(NSString * _Nonnull)destination;

+ (BOOL)be_renameFileFromDirectory:(DirectoryType)origin
                         atPath:(NSString * _Nonnull)path
                    withOldName:(NSString * _Nonnull)oldName
                     andNewName:(NSString * _Nonnull)newName;

+ (id _Nullable)be_getAppSettingsForObjectWithKey:(NSString * _Nonnull)objKey;

+ (BOOL)be_setAppSettingsForObject:(id _Nonnull)value
                         forKey:(NSString * _Nonnull)objKey;

+ (id _Nullable)be_getSettings:(NSString * _Nonnull)settings
               objectForKey:(NSString * _Nonnull)objKey;

+ (BOOL)be_setSettings:(NSString * _Nonnull)settings
             object:(id _Nonnull)value
             forKey:(NSString * _Nonnull)objKey;


+ (unsigned long long)be_fileSizeAtPath:(NSString * _Nonnull)path;

+ (unsigned long long)be_folderSizeAtPath:(NSString * _Nonnull)path;

+ (NSMutableArray * _Nonnull)be_getAllFileInfoAtPath:(NSString * _Nonnull)path;

+ (BOOL)be_isDirectory:(NSString * _Nonnull)path;

+ (NSDate * _Nullable)be_getFileCreateTime:(NSString * _Nonnull)path;

@end
