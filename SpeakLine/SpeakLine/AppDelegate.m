//
//  AppDelegate.m
//  SpeakLine
//
//  Created by Oleg on 05.02.2026.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@implementation AppDelegate

@synthesize window = _window;
@synthesize textField = _textField;
@synthesize speakButton = _speakButton;
@synthesize stopButton = _stopButton;
@synthesize tableView = _tableView;

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"init");
        _speechSynth = [[AVSpeechSynthesizer alloc] init];
        _speechSynth.delegate = self;
        _voices = [AVSpeechSynthesisVoice speechVoices];
    }
    return self;
}

- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];

    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", _textField);
        return;
    }
    AVSpeechUtterance *utterance =
        [AVSpeechUtterance speechUtteranceWithString:string];
    // Apply currently selected voice if available
    NSInteger selectedRow = [_tableView selectedRow];
    if (selectedRow >= 0 && selectedRow < (NSInteger)[_voices count]) {
        AVSpeechSynthesisVoice *voice =
            (AVSpeechSynthesisVoice *)[_voices objectAtIndex:selectedRow];
        if ([voice isKindOfClass:[AVSpeechSynthesisVoice class]]) {
            utterance.voice = voice;
        }
    }
    [_speechSynth speakUtterance:utterance];
    NSLog(@"Have started to say: %@", string);

    [_stopButton setEnabled:YES];
    [_speakButton setEnabled:NO];
    [_tableView setEnabled:NO];
}

- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
    didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"didFinishSpeechUtterance");
    [_stopButton setEnabled:NO];
    [_speakButton setEnabled:YES];
    [_tableView setEnabled:YES];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
    didCancelSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"didCancelSpeechUtterance");
    [_stopButton setEnabled:NO];
    [_speakButton setEnabled:YES];
    [_tableView setEnabled:YES];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv {
    return (NSInteger)[_voices count];
}

- (id)tableView:(NSTableView *)tv
    objectValueForTableColumn:(NSTableColumn *)tableColumn
                          row:(NSInteger)row {
    AVSpeechSynthesisVoice *voice =
        (AVSpeechSynthesisVoice *)[_voices objectAtIndex:row];
    return voice.name;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger row = [_tableView selectedRow];
    if (row == -1) {
        return;
    }
    AVSpeechSynthesisVoice *selectedVoice =
        (AVSpeechSynthesisVoice *)[_voices objectAtIndex:row];
    NSLog(@"new voice = %@ (%@)", selectedVoice.name, selectedVoice.language);
}

- (void)awakeFromNib {
    // When the table view appears on screen, select a reasonable default voice
    // Try to match the system language first
    NSString *preferredLang = [[NSLocale preferredLanguages] firstObject];
    NSInteger defaultRow = NSNotFound;
    for (NSInteger i = 0; i < (NSInteger)[_voices count]; i++) {
        AVSpeechSynthesisVoice *voice =
            (AVSpeechSynthesisVoice *)[_voices objectAtIndex:i];
        if ([voice.language hasPrefix:preferredLang]) {
            defaultRow = i;
            break;
        }
    }
    if (defaultRow == NSNotFound && [_voices count] > 0) {
        defaultRow = 0;
    }
    if (defaultRow != NSNotFound) {
        NSIndexSet *indices = [NSIndexSet indexSetWithIndex:defaultRow];
        [_tableView selectRowIndexes:indices byExtendingSelection:NO];
        [_tableView scrollRowToVisible:defaultRow];
    }
}
@end
