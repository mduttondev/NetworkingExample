//
//  NetworkingCoordinator.h
//  Albany
//
//  Created by Matthew Dutton on 10/1/15.
//  Copyright © 2015 Echo Interaction Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsynchronousOperation.h"

@interface NetworkingCoordinator : NSObject


//add properties that need to be stored for the session

+ (instancetype)sharedCoordinator;

- (void)addOperation:(AsynchronousOperation *)operation;

@end
