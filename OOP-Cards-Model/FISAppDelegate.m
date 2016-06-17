//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISCard.h"
#import "FISCardDeck.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    FISCard *newCard = [[FISCard alloc] init];
    
    NSLog(@"New Card:%@%@", newCard.suit, newCard.rank);
    
    
    FISCardDeck *playCard = [[FISCardDeck alloc] init];
    
    NSLog(@"Play Card:%@", playCard.description);
    
    return YES;
    
}

@end
