//
//  DMBConsoleOutput.m
//  DumbLogger
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

#import "DMBConsoleOutput.h"

@interface DMBConsoleOutput ()

@property (nonatomic, strong) NSString *messageMask;

@end

@implementation DMBConsoleOutput

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _loadMessageMask];
    }
    return self;
}

- (void) _loadMessageMask
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *entry = NSLocalizedStringFromTableInBundle(@"Log entry",
                                                         @"Localizable",
                                                         bundle,
                                                         @"Title of the entry in the log");
    self.messageMask = [NSString stringWithFormat:@"%@: %@",entry, @"%@"];
}

- (BOOL) putString:(NSString *)message
{
    NSLog(self.messageMask, message);
    return YES;
}

@end
