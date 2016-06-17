//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by John Hussain on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck

- (instancetype) init{
    
    self = [super init];
    
    if (self) {
        
        _remainingCards = [[NSMutableArray alloc] init];
        
        _dealtCards = [[NSMutableArray alloc] init];
        
        [self generateCards];
    }
    
    return self;
}

- (void)generateCards {
    
    for (NSString *suit in [FISCard validSuits]) {
        
        for (NSString *rank in [FISCard validRanks]) {
            
            FISCard *newCard = [[FISCard alloc] initWithSuit:suit rank:rank];
            
            [self.remainingCards addObject:newCard];
        }
    }
}


- (FISCard *) drawNextCard{
    
    if (self.remainingCards.count == 0) {
        
        NSLog(@"Cannot draw anymore cards. The deck is empty!");

        return nil;
    }
    
    FISCard *cardDrawn = self.remainingCards[0];
    
    [self.dealtCards addObject:cardDrawn];
    
    [self.remainingCards removeObjectAtIndex:0];
    
    return cardDrawn;
}

- (void) resetDeck{
    
    [self gatherDealtCards];
    
    [self shuffleRemainingCards];
}

- (void) gatherDealtCards{
    
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    
    [self.dealtCards removeAllObjects];
    
}

- (void) shuffleRemainingCards{
    
    [self.remainingCards mutableCopy];
    
    for (NSUInteger i = 0; i < [self.remainingCards count]; i++) {
        
        NSUInteger randomIndex = arc4random_uniform((uint32_t)[self.remainingCards count]);
        
        FISCard *randomCard = self.remainingCards[randomIndex];
        
        [self.remainingCards removeObjectAtIndex:randomIndex];
        
        [self.remainingCards addObject:randomCard];
    }

}

- (NSString *)description {
    
    NSMutableString *cardsLeft = [[NSMutableString alloc] init];
    
    [cardsLeft appendFormat:@"Remaining cards\ncount: %lu", self.remainingCards.count];
    
    [cardsLeft appendString:@"\ncards:"];
    
    for (NSUInteger i = 0; i < self.remainingCards.count; i++) {
        
        if (i % 13 == 0) {
            
            [cardsLeft appendString:@"\n"];
        }
        
        FISCard *card = self.remainingCards[i];
        
        [cardsLeft appendFormat:@"  %@", card.description];
    }
    
    return cardsLeft;
}


@end
