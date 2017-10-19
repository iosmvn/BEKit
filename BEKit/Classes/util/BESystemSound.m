//
//  BESystemSound.m
//  Pods
//
//  Created by sundanlong on 16/4/13.
//
//

#import "BESystemSound.h"
#import "BELog.h"

@implementation BESystemSound

+ (void)playSystemSound:(BEAudioID)audioID {
    AudioServicesPlaySystemSound(audioID);
}

+ (void)playSystemSoundVibrate {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (SystemSoundID)playCustomSound:(NSURL * _Nonnull)soundURL {
    SystemSoundID soundID;
    
    OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);
    if (error != kAudioServicesNoError) {
        BELog(@"Could not load %@", soundURL);
    }
    return soundID;
}

+ (BOOL)disposeSound:(SystemSoundID)soundID {
    OSStatus error = AudioServicesDisposeSystemSoundID(soundID);
    if (error != kAudioServicesNoError) {
        BELog(@"Error while disposing sound %i", (unsigned int)soundID);
        return NO;
    }
    
    return YES;
}

@end
