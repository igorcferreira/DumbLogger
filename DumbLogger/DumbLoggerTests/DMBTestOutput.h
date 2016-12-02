//
//  DMBTestOutput.h
//  DumbLogger
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
@import DumbLogger;

@class XCTestExpectation;

NS_ASSUME_NONNULL_BEGIN

@interface DMBTestOutput : NSObject <DMBOutput>

- (instancetype) init NS_UNAVAILABLE;
- (instancetype) initWithExpectation:(XCTestExpectation *)expectation
                   andDesiredMessage:(NSString *)message NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
