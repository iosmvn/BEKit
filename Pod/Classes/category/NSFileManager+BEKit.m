//
//  NSFileManager+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "NSFileManager+BEKit.h"
#import "BEConfigUtil.h"

@implementation NSFileManager (BEKit)

+ (NSString * _Nullable)be_readTextFile:(NSString * _Nonnull)file ofType:(NSString * _Nonnull)type {
    return [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:type] encoding:NSUTF8StringEncoding error:nil];
}

+ (BOOL)be_saveArrayToPath:(DirectoryType)path withFilename:(NSString * _Nonnull)fileName array:(NSArray * _Nonnull)array {
    NSString *_path;
    
    switch (path) {
        case DirectoryTypeMainBundle:
            _path = [self be_getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self be_getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self be_getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self be_getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
    }
    
    return [NSKeyedArchiver archiveRootObject:array toFile:_path];
}

+ (NSArray * _Nullable)be_loadArrayFromPath:(DirectoryType)path withFilename:(NSString * _Nonnull)fileName {
    NSString *_path;
    
    switch (path) {
        case DirectoryTypeMainBundle:
            _path = [self be_getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self be_getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self be_getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self be_getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
    }
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
}

//创建文件
+ (BOOL)be_createFileAtPath:(NSString * _Nonnull)fullPath {
    BOOL result = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];//创建文件管理器
    if (![fileManager fileExistsAtPath:fullPath]) {//如果文件管理器中没有此文件则创建此文件
        result = [fileManager createFileAtPath:fullPath contents:nil attributes:nil];
    }
    return result;
}

//创建文件夹
+ (BOOL)be_createDirectoryAtPath:(NSString * _Nonnull)fullPath {
    BOOL result = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];//创建文件管理器
    if (![fileManager fileExistsAtPath:fullPath]) {//如果文件管理器中没有此目录则创建此目录
        result = [fileManager createDirectoryAtPath:fullPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return result;
}

+ (NSString * _Nonnull)be_getBundlePathForFile:(NSString * _Nonnull)fileName {
    NSString *fileExtension = [fileName pathExtension];
    return [[NSBundle mainBundle] pathForResource:[fileName stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@".%@", fileExtension] withString:@""] ofType:fileExtension];
}

+ (NSString * _Nonnull)be_getDocumentsDirectoryForFile:(NSString * _Nonnull)fileName {
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString * _Nonnull)be_getLibraryDirectoryForFile:(NSString * _Nonnull)fileName {
    NSString *libraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [libraryDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString * _Nonnull)be_getCacheDirectoryForFile:(NSString * _Nonnull)fileName {
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSNumber * _Nullable)be_fileSize:(NSString * _Nonnull)fileName fromDirectory:(DirectoryType)directory {
    if (fileName.length > 0) {
        NSString *path;
        
        switch (directory) {
            case DirectoryTypeMainBundle:
                path = [self be_getBundlePathForFile:fileName];
                break;
            case DirectoryTypeLibrary:
                path = [self be_getLibraryDirectoryForFile:fileName];
                break;
            case DirectoryTypeDocuments:
                path = [self be_getDocumentsDirectoryForFile:fileName];
                break;
            case DirectoryTypeCache:
                path = [self be_getCacheDirectoryForFile:fileName];
                break;
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
            NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:fileName error:nil];
            if (fileAttributes) {
                return [fileAttributes objectForKey:NSFileSize];
            }
        }
    }
    
    return nil;
}

+ (BOOL)be_deleteFile:(NSString * _Nonnull)fileName fromDirectory:(DirectoryType)directory {
    if (fileName.length > 0) {
        NSString *path;
        
        switch (directory) {
            case DirectoryTypeMainBundle:
                path = [self be_getBundlePathForFile:fileName];
                break;
            case DirectoryTypeLibrary:
                path = [self be_getLibraryDirectoryForFile:fileName];
                break;
            case DirectoryTypeDocuments:
                path = [self be_getDocumentsDirectoryForFile:fileName];
                break;
            case DirectoryTypeCache:
                path = [self be_getCacheDirectoryForFile:fileName];
                break;
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
    }
    
    return NO;
}

+ (BOOL)be_moveLocalFile:(NSString * _Nonnull)fileName fromDirectory:(DirectoryType)origin toDirectory:(DirectoryType)destination {
    return [self be_moveLocalFile:fileName fromDirectory:origin toDirectory:destination withFolderName:nil];
}

+ (BOOL)be_moveLocalFile:(NSString * _Nonnull)fileName fromDirectory:(DirectoryType)origin toDirectory:(DirectoryType)destination withFolderName:(NSString * _Nullable)folderName {
    NSString *originPath;
    
    switch (origin) {
        case DirectoryTypeMainBundle:
            originPath = [self be_getBundlePathForFile:fileName];
            break;
        case DirectoryTypeLibrary:
            originPath = [self be_getDocumentsDirectoryForFile:fileName];
            break;
        case DirectoryTypeDocuments:
            originPath = [self be_getLibraryDirectoryForFile:fileName];
            break;
        case DirectoryTypeCache:
            originPath = [self be_getCacheDirectoryForFile:fileName];
            break;
    }
    
    NSString *destinationPath;
    if (folderName) {
        destinationPath = [NSString stringWithFormat:@"%@/%@", folderName, fileName];
    } else {
        destinationPath = fileName;
    }
    
    switch (destination) {
        case DirectoryTypeMainBundle:
            destinationPath = [self be_getBundlePathForFile:destinationPath];
            break;
        case DirectoryTypeLibrary:
            destinationPath = [self be_getLibraryDirectoryForFile:destinationPath];
            break;
        case DirectoryTypeDocuments:
            destinationPath = [self be_getDocumentsDirectoryForFile:destinationPath];
            break;
        case DirectoryTypeCache:
            destinationPath = [self be_getCacheDirectoryForFile:destinationPath];
            break;
    }
    
    if (folderName) {
        NSString *folderPath = [NSString stringWithFormat:@"%@/%@", destinationPath, folderName];
        if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
    }
    
    BOOL copied = NO, deleted = NO;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:originPath]) {
        if ([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:destinationPath error:nil]) {
            copied = YES;
        }
    }
    
    if (destination != DirectoryTypeMainBundle) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:originPath])
            if ([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil]) {
                deleted = YES;
            }
    }
    
    if (copied && deleted) {
        return YES;
    }
    return NO;
}

+ (BOOL)be_duplicateFileAtPath:(NSString * _Nonnull)origin toNewPath:(NSString * _Nonnull)destination {
    if ([[NSFileManager defaultManager] fileExistsAtPath:origin]) {
        return [[NSFileManager defaultManager] copyItemAtPath:origin toPath:destination error:nil];
    }
    return NO;
}

+ (BOOL)be_renameFileFromDirectory:(DirectoryType)origin atPath:(NSString * _Nonnull)path withOldName:(NSString * _Nonnull)oldName andNewName:(NSString * _Nonnull)newName {
    NSString *originPath;
    
    switch (origin) {
        case DirectoryTypeMainBundle:
            originPath = [self be_getBundlePathForFile:path];
            break;
        case DirectoryTypeLibrary:
            originPath = [self be_getDocumentsDirectoryForFile:path];
            break;
        case DirectoryTypeDocuments:
            originPath = [self be_getLibraryDirectoryForFile:path];
            break;
        case DirectoryTypeCache:
            originPath = [self be_getCacheDirectoryForFile:path];
            break;
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:originPath]) {
        NSString *newNamePath = [originPath stringByReplacingOccurrencesOfString:oldName withString:newName];
        if ([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:newNamePath error:nil]) {
            if ([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil]) {
                return YES;
            }
        }
    }
    return NO;
}

+ (id _Nullable)be_getSettings:(NSString * _Nonnull)settings objectForKey:(NSString * _Nonnull)objKey {
    NSString *path = [self be_getLibraryDirectoryForFile:@""];
    path = [path stringByAppendingString:@"/Preferences/"];
    path = [path stringByAppendingString:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    
    NSMutableDictionary *loadedPlist;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    } else {
        return nil;
    }
    
    return loadedPlist[objKey];
}

+ (BOOL)be_setSettings:(NSString * _Nonnull)settings object:(id _Nonnull)value forKey:(NSString * _Nonnull)objKey {
    NSString *path = [self be_getLibraryDirectoryForFile:@""];
    path = [path stringByAppendingString:@"/Preferences/"];
    path = [path stringByAppendingString:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    
    NSMutableDictionary *loadedPlist;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    } else {
        loadedPlist = [[NSMutableDictionary alloc] init];
    }
    
    [loadedPlist setObject:value forKey:objKey];
    
    return [loadedPlist writeToFile:path atomically:YES];
}

+ (id _Nullable)be_getAppSettingsForObjectWithKey:(NSString * _Nonnull)objKey {
    return [self be_getSettings:BE_APP_NAME objectForKey:objKey];
}

+ (BOOL)be_setAppSettingsForObject:(id _Nonnull)value forKey:(NSString * _Nonnull)objKey {
    return [self be_setSettings:BE_APP_NAME object:value forKey:objKey];
}

@end
