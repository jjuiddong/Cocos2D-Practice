//
//  HelloWorldLayer.h
//  studyCocos2d
//
//  Created by 재정 이 on 12. 4. 11..
//  Copyright __MyCompanyName__ 2012년. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate,
CCTargetedTouchDelegate>
{
    CCSprite *character;
    CCSprite *character_run;
    CCSprite *parent;    
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event;

- (void)doClick1: (CCMenuItem*) menuItem;
- (void)doClick2: (CCMenuItem*) menuItem;
- (void)doClick3: (CCMenuItem*) menuItem;
- (void)doClick4: (CCMenuItem*) menuItem;


@end
