//
//  HelloWorldLayer.h
//  AccelTest2
//
//  Created by 재정 이 on 12. 4. 7..
//  Copyright __MyCompanyName__ 2012년. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"


#define RECTCENTER(rect) CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
#define SIGN(x)	((x < 0.0f) ? -1.0f : 1.0f)


// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate,
UIAccelerometerDelegate>
{
    CCSprite *seeker;
    CCSprite *obstacle;
//    NSMutableArray *m_obstacles;
    CCSprite *m_obstacles[ 10];

    

	float xaccel;
	float xvelocity; 
	float yaccel;
	float yvelocity;

};

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
//+(CGPoint) randPosition;


@end
