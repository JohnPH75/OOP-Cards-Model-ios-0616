//
//  Card.h
//  OOP-Cards-Model
//
//  Created by Chris Gonzales on 6/10/14.
//  Copyright (c) 2014 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, getter=isFaceUp) BOOL FaceUp;
@property (nonatomic) CGRect frame;

- (NSString *)description;
- (void)flipCard;

@end