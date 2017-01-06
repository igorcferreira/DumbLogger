//
//  DumbLogger.m
//  DumbLogger
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

#import "DMBLogger.h"
#import "DMBOutput.h"

@interface DMBLogger ()

@property (nonatomic, strong) id<DMBOutput> output;

@end

@implementation DMBLogger

- (instancetype) initWithOutput:(id<DMBOutput>)output
                    andLogLevel:(DMBLogLevel)level
{
    self = [super init];
    if (self) {
        self->_output = output;
        self->_logLevel = level;
    }
    return self;
}

- (void) putString:(NSString*)message
         withLevel:(DMBLogLevel)level
{
    if (level >= self.logLevel) {
        [self.output putString:message];
    }
}

@end
