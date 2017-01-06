//
//  DMBOutput.h
//  DumbLogger
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

#ifndef DMBOutput_h
#define DMBOutput_h

NS_SWIFT_NAME(Output)
/**
 Interface that is used to represent a possible output for the log system
 */
@protocol DMBOutput <NSObject>


/**
 Writes a message in the desired output

 @param message Message to be written
 @return Flag to indicate if the message was written or not
 */
- (BOOL) putString:(NSString *)message NS_SWIFT_NAME(put(_:));

@end

#endif /* DMBOutput_h */
