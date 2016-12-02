//
//  LogLevel.h
//  DumbLogger
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

#ifndef DMBLogLevel_h
#define DMBLogLevel_h


/**
 Enum to set the log level of the DMBLogger object

 - DMBLogLevelInformation: Messages used to put some information about code execution.
 - DMBLogLevelWarning: Misbehaviour in the execution that was handled by the system.
 - DMBLogLevelError: Execution error.
 - DMBLogLevelNone: Message without specific log level. Always printed.
 */
typedef NS_ENUM(NSUInteger, DMBLogLevel) {
    /** Messages used to put some information about code execution. */
    DMBLogLevelInformation = 0,
    /** Misbehaviour in the execution that was handled by the system. */
    DMBLogLevelWarning = 1,
    /** Execution error. */
    DMBLogLevelError = 2,
    /** Message without specific log level. Always printed. */
    DMBLogLevelNone = 3
};

#endif /* LogLevel_h */
