//
//  GetAmenitiesOperation.h
//  Albany
//
//  Created by Matthew Dutton on 10/16/15.
//  Copyright © 2015 Echo Interaction Group. All rights reserved.
//

#import "AsynchronousOperation.h"
#import <Parse/Parse.h>

@interface GetAmenitiesOperation : AsynchronousOperation

@property (nonatomic, copy) void (^successBlock)(NSArray * entries);

@property (nonatomic, copy) void (^errorBlock)(NSError * error);

@end
