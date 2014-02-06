//
//  HelloWorldLayer.m
//  IPhonSf2
//
//  Created by 재정 이 on 12. 4. 8..
//  Copyright __MyCompanyName__ 2012년. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init])) {
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

        self.isTouchEnabled = YES;        
        
        background = [CCSprite spriteWithFile:@"sf2st-blanka.jpg"];
        background.position = ccp( size.width/2, size.height/2);
        [self addChild:background];
        
        ryuPng =[CCSprite spriteWithFile:@"ryu.png"];
        ryuPng.position = ccp(size.width/2, 30);
        [self addChild:ryuPng];
        
        
        
        
        ryuBatch = [CCSpriteBatchNode batchNodeWithFile:@"ryu.png" capacity:50];
        [self addChild:ryuBatch];        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"ryu.plist"];
        
        ryu = [CCSprite spriteWithSpriteFrameName:@"1.png"];
        ryu.position = ccp( size.width/2, size.height/2 ); 
        [self addChild:ryu];
        
        NSMutableArray *animFrames = [NSMutableArray array];
		for(int i = 1; i < 14; i++) {            
			CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"%d.png",i]];
            
            // adjust position control
            CGRect r = [frame rectInPixels];
            CGPoint pos = {r.size.width/2, -50};
            frame.offsetInPixels = pos;
			[animFrames addObject:frame];
		}
        
        ryuAni = [CCAnimation animationWithSpriteFrames:animFrames delay:1.5/13.0];
		[ryu runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:ryuAni]]];
        
	
	}
	return self;
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
	CGPoint location = [self convertTouchToNodeSpace: touch];
    ryu.position = location;    
}


- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{    
    
}


- (void)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}



// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
