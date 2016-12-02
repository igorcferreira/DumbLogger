//
//  DumbLoggerTests.m
//  DumbLoggerTests
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DMBTestOutput.h"
@import DumbLogger;

@interface DumbLoggerTests : XCTestCase

@end

@implementation DumbLoggerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Waiting for log message"];
    id<DMBOutput> output = [[DMBTestOutput alloc] initWithExpectation:expectation
                                                    andDesiredMessage:@"Test"];
    
    DMBLogger *logger = [[DMBLogger alloc] initWithOutput:output
                                              andLogLevel:DMBLogLevelInformation];
    
    [logger putString:@"Test"
            withLevel:DMBLogLevelError];
    
    [self waitForExpectationsWithTimeout:1.f
                                 handler:nil];
}

@end
