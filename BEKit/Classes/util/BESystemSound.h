//
//  BESystemSound.h
//  Pods
//
//  Created by sundanlong on 16/4/13.
//
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

/**
 *  Audio IDs enum - http://iphonedevwiki.net/index.php/AudioServices
 */
typedef NS_ENUM(NSInteger, BEAudioID) {
    /**
     *  New Mail
     */
    BEAudioIDNewMail = 1000,
    /**
     *  Mail Sent
     */
    BEAudioIDMailSent = 1001,
    /**
     *  Voice Mail
     */
    BEAudioIDVoiceMail = 1002,
    /**
     *  Recived Message
     */
    BEAudioIDRecivedMessage = 1003,
    /**
     *  Sent Message
     */
    BEAudioIDSentMessage = 1004,
    /**
     *  Alerm
     */
    BEAudioIDAlarm = 1005,
    /**
     *  Low pPower
     */
    BEAudioIDLowPower = 1006,
    /**
     *  SMS Received 1
     */
    BEAudioIDSMSReceived1 = 1007,
    /**
     *  SMS Received 2
     */
    BEAudioIDSMSReceived2 = 1008,
    /**
     *  SMS Received 3
     */
    BEAudioIDSMSReceived3 = 1009,
    /**
     *  SMS Received 4
     */
    BEAudioIDSMSReceived4 = 1010,
    /**
     *  SMS Received 5
     */
    BEAudioIDSMSReceived5 = 1013,
    /**
     *  SMS Received 6
     */
    BEAudioIDSMSReceived6 = 1014,
    /**
     *  Tweet Sent
     */
    BEAudioIDTweetSent = 1016,
    /**
     *  Anticipate
     */
    BEAudioIDAnticipate = 1020,
    /**
     *  Bloom
     */
    BEAudioIDBloom = 1021,
    /**
     *  Calypso
     */
    BEAudioIDCalypso = 1022,
    /**
     *  Choo Choo
     */
    BEAudioIDChooChoo = 1023,
    /**
     *  Descent
     */
    BEAudioIDDescent = 1024,
    /**
     *  Fanfare
     */
    BEAudioIDFanfare = 1025,
    /**
     *  Ladder
     */
    BEAudioIDLadder = 1026,
    /**
     *  Minuet
     */
    BEAudioIDMinuet = 1027,
    /**
     *  News Flash
     */
    BEAudioIDNewsFlash = 1028,
    /**
     *  Noir
     */
    BEAudioIDNoir = 1029,
    /**
     *  Sherwood Forest
     */
    BEAudioIDSherwoodForest = 1030,
    /**
     *  Speel
     */
    BEAudioIDSpell = 1031,
    /**
     *  Suspance
     */
    BEAudioIDSuspence = 1032,
    /**
     *  Telegraph
     */
    BEAudioIDTelegraph = 1033,
    /**
     *  Tiptoes
     */
    BEAudioIDTiptoes = 1034,
    /**
     *  Typewriters
     */
    BEAudioIDTypewriters = 1035,
    /**
     *  Update
     */
    BEAudioIDUpdate = 1036,
    /**
     *  USSD Alert
     */
    BEAudioIDUSSDAlert = 1050,
    /**
     *  SIM Toolkit Call Dropped
     */
    BEAudioIDSIMToolkitCallDropped = 1051,
    /**
     *  SIM Toolkit General Beep
     */
    BEAudioIDSIMToolkitGeneralBeep = 1052,
    /**
     *  SIM Toolkit Negative ACK
     */
    BEAudioIDSIMToolkitNegativeACK = 1053,
    /**
     *  SIM Toolkit Positive ACK
     */
    BEAudioIDSIMToolkitPositiveACK = 1054,
    /**
     *  SIM Toolkit SMS
     */
    BEAudioIDSIMToolkitSMS = 1055,
    /**
     *  Tink
     */
    BEAudioIDTink = 1057,
    /**
     *  CT Busy
     */
    BEAudioIDCTBusy = 1070,
    /**
     *  CT Congestion
     */
    BEAudioIDCTCongestion = 1071,
    /**
     *  CT Pack ACK
     */
    BEAudioIDCTPathACK = 1072,
    /**
     *  CT Error
     */
    BEAudioIDCTError = 1073,
    /**
     *  CT Call Waiting
     */
    BEAudioIDCTCallWaiting = 1074,
    /**
     *  CT Keytone
     */
    BEAudioIDCTKeytone = 1075,
    /**
     *  Lock
     */
    BEAudioIDLock = 1100,
    /**
     *  Unlock
     */
    BEAudioIDUnlock = 1101,
    /**
     *  Failed Unlock
     */
    BEAudioIDFailedUnlock = 1102,
    /**
     *  Keypressed Tink
     */
    BEAudioIDKeypressedTink = 1103,
    /**
     *  Keypressed Tock
     */
    BEAudioIDKeypressedTock = 1104,
    /**
     *  Tock
     */
    BEAudioIDTock = 1105,
    /**
     *  Beep Beep
     */
    BEAudioIDBeepBeep = 1106,
    /**
     *  Ringer Charged
     */
    BEAudioIDRingerCharged = 1107,
    /**
     *  Photo Shutter
     */
    BEAudioIDPhotoShutter = 1108,
    /**
     *  Shake
     */
    BEAudioIDShake = 1109,
    /**
     *  JBL Begin
     */
    BEAudioIDJBLBegin = 1110,
    /**
     *  JBL Confirm
     */
    BEAudioIDJBLConfirm = 1111,
    /**
     *  JBL Cancel
     */
    BEAudioIDJBLCancel = 1112,
    /**
     *  Begin Recording
     */
    BEAudioIDBeginRecording = 1113,
    /**
     *  End Recording
     */
    BEAudioIDEndRecording = 1114,
    /**
     *  JBL Ambiguous
     */
    BEAudioIDJBLAmbiguous = 1115,
    /**
     *  JBL No Match
     */
    BEAudioIDJBLNoMatch = 1116,
    /**
     *  Begin Video Record
     */
    BEAudioIDBeginVideoRecord = 1117,
    /**
     *  End Video Record
     */
    BEAudioIDEndVideoRecord = 1118,
    /**
     *  VC Invitation Accepted
     */
    BEAudioIDVCInvitationAccepted = 1150,
    /**
     *  VC Ringing
     */
    BEAudioIDVCRinging = 1151,
    /**
     *  VC Ended
     */
    BEAudioIDVCEnded = 1152,
    /**
     *  VC Call Waiting
     */
    BEAudioIDVCCallWaiting = 1153,
    /**
     *  VC Call Upgrade
     */
    BEAudioIDVCCallUpgrade = 1154,
    /**
     *  Touch Tone 1
     */
    BEAudioIDTouchTone1 = 1200,
    /**
     *  Touch Tone 2
     */
    BEAudioIDTouchTone2 = 1201,
    /**
     *  Touch Tone 3
     */
    BEAudioIDTouchTone3 = 1202,
    /**
     *  Touch Tone 4
     */
    BEAudioIDTouchTone4 = 1203,
    /**
     *  Touch Tone 5
     */
    BEAudioIDTouchTone5 = 1204,
    /**
     *  Touch Tone 6
     */
    BEAudioIDTouchTone6 = 1205,
    /**
     *  Touch Tone 7
     */
    BEAudioIDTouchTone7 = 1206,
    /**
     *  Touch Tone 8
     */
    BEAudioIDTouchTone8 = 1207,
    /**
     *  Touch Tone 9
     */
    BEAudioIDTouchTone9 = 1208,
    /**
     *  Touch Tone 10
     */
    BEAudioIDTouchTone10 = 1209,
    /**
     *  Tone Star
     */
    BEAudioIDTouchToneStar = 1210,
    /**
     *  Tone Pound
     */
    BEAudioIDTouchTonePound = 1211,
    /**
     *  Headset Start Call
     */
    BEAudioIDHeadsetStartCall = 1254,
    /**
     *  Headset Redial
     */
    BEAudioIDHeadsetRedial = 1255,
    /**
     *  Headset Answer Call
     */
    BEAudioIDHeadsetAnswerCall = 1256,
    /**
     *  Headset End Call
     */
    BEAudioIDHeadsetEndCall = 1257,
    /**
     *  Headset Call Waiting Actions
     */
    BEAudioIDHeadsetCallWaitingActions = 1258,
    /**
     *  Headset Transition End
     */
    BEAudioIDHeadsetTransitionEnd = 1259,
    /**
     *  Voicemail
     */
    BEAudioIDVoicemail = 1300,
    /**
     *  Received Message
     */
    BEAudioIDReceivedMessage = 1301,
    /**
     *  New Mail 2
     */
    BEAudioIDNewMail2 = 1302,
    /**
     *  Email Sent 2
     */
    BEAudioIDMailSent2 = 1303,
    /**
     *  Alarm 2
     */
    BEAudioIDAlarm2 = 1304,
    /**
     *  Lock 2
     */
    BEAudioIDLock2 = 1305,
    /**
     *  Tock 2
     */
    BEAudioIDTock2 = 1306,
    /**
     *  SMS Received 7
     */
    BEAudioIDSMSReceived1_2 = 1307,
    /**
     *  SMS Received 8
     */
    BEAudioIDSMSReceived2_2 = 1308,
    /**
     *  SMS Received 9
     */
    BEAudioIDSMSReceived3_2 = 1309,
    /**
     *  SMS Received 10
     */
    BEAudioIDSMSReceived4_2 = 1310,
    /**
     *  SMS Received Vibrate
     */
    BEAudioIDSMSReceivedVibrate = 1311,
    /**
     *  SMS Received 11
     */
    BEAudioIDSMSReceived1_3 = 1312,
    /**
     *  SMS Received 12
     */
    BEAudioIDSMSReceived5_3 = 1313,
    /**
     *  SMS Received 13
     */
    BEAudioIDSMSReceived6_3 = 1314,
    /**
     *  Voicemail 2
     */
    BEAudioIDVoicemail2 = 1315,
    /**
     *  Anticipate 2
     */
    BEAudioIDAnticipate2 = 1320,
    /**
     *  Bloom 2
     */
    BEAudioIDBloom2 = 1321,
    /**
     *  Calypso 2
     */
    BEAudioIDCalypso2 = 1322,
    /**
     *  Choo Choo 2
     */
    BEAudioIDChooChoo2 = 1323,
    /**
     *  Descent 2
     */
    BEAudioIDDescent2 = 1324,
    /**
     *  Fanfare 2
     */
    BEAudioIDFanfare2 = 1325,
    /**
     *  Ladder 2
     */
    BEAudioIDLadder2 = 1326,
    /**
     *  Minuet 2
     */
    BEAudioIDMinuet2 = 1327,
    /**
     *  News Flash 2
     */
    BEAudioIDNewsFlash2 = 1328,
    /**
     *  Noir 2
     */
    BEAudioIDNoir2 = 1329,
    /**
     *  Sherwood Forest 2
     */
    BEAudioIDSherwoodForest2 = 1330,
    /**
     *  Speel 2
     */
    BEAudioIDSpell2 = 1331,
    /**
     *  Suspence 2
     */
    BEAudioIDSuspence2 = 1332,
    /**
     *  Telegraph 2
     */
    BEAudioIDTelegraph2 = 1333,
    /**
     *  Tiptoes 2
     */
    BEAudioIDTiptoes2 = 1334,
    /**
     *  Typewriters 2
     */
    BEAudioIDTypewriters2 = 1335,
    /**
     *  Update 2
     */
    BEAudioIDUpdate2 = 1336,
    /**
     *  Ringer View Changed
     */
    BEAudioIDRingerVibeChanged = 1350,
    /**
     *  Silent View Changed
     */
    BEAudioIDSilentVibeChanged = 1351,
    /**
     *  Vibrate
     */
    BEAudioIDVibrate = 4095
};

@interface BESystemSound : NSObject

//播放警告声音，如果手机在静音状态，警告声音将自动触发震动。
+ (void)playSystemSound:(BEAudioID)audioID;

//手机震动
+ (void)playSystemSoundVibrate;

//播放自定义声音
+ (SystemSoundID)playCustomSound:(NSURL * _Nonnull)soundURL;

//清除自定义声音
+ (BOOL)disposeSound:(SystemSoundID)soundID;

@end
