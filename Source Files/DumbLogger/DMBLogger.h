//
//  DumbLogger.h
//  DumbLogger
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMBLogLevel.h"
#import "DMBOutput.h"

NS_SWIFT_NAME(DumbLogger)
/**
 Logger that can be configured with different output streams and level filter
 */
@interface DMBLogger : NSObject

NS_ASSUME_NONNULL_BEGIN

/**
 Current log level
 */
@property (nonatomic, assign) DMBLogLevel logLevel;


/**
 Simple init is unavailable to force the object to be created with a specif log level.

 @return Broken object
 */
- (instancetype) init NS_UNAVAILABLE;

/**
 Init the logger with the level restriction that is gonna be used to filter
 the output messages.

 @param output  Parser and printer of the message
 @param level   Level of messages that will be outputed
 @return Configured logger object
 */
- (instancetype) initWithOutput:(id<DMBOutput>)output
                    andLogLevel:(DMBLogLevel)level NS_DESIGNATED_INITIALIZER NS_SWIFT_NAME(init(output:level:));

/**
 Put a new message entry in the log stack. This stack is clear
 accordling to the parser, level and output queue.

 @param message Entry message
 @param level Level category of this entry
 */
- (void) putString:(NSString*)message
         withLevel:(DMBLogLevel)level NS_SWIFT_NAME(put(_:level:));

@end

NS_ASSUME_NONNULL_END
