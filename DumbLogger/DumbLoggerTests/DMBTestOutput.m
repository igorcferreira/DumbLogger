//
//  DMBTestOutput.m
//  DumbLogger
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

#import "DMBTestOutput.h"
#import <XCTest/XCTest.h>

@interface DMBTestOutput ()

@property (nonatomic, strong) XCTestExpectation *expectation;
@property (nonatomic, strong) NSString *message;

@end

@implementation DMBTestOutput

- (instancetype) initWithExpectation:(XCTestExpectation *)expectation
                   andDesiredMessage:(NSString *)message
{
    self = [super init];
    if (self) {
        self->_expectation = expectation;
        self->_message = [message copy];
    }
    return self;
}

- (BOOL) putString:(NSString * _Nonnull)message
{
    if ([message isEqualToString:self.message] && self.expectation) {
        [self.expectation fulfill];
        self.expectation = nil;
        return YES;
    }
    return NO;
}

@end
