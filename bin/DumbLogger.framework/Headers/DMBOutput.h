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
@protocol DMBOutput <NSObject>

- (BOOL) putString:(NSString *)message NS_SWIFT_NAME(put(_:));

@end

#endif /* DMBOutput_h */
