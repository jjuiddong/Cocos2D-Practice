//
//  HelloWorldLayer.m
//  AccelTest2
//
//  Created by 재정 이 on 12. 4. 7..
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


+(CGPoint) randPosition
{
	CGSize size = [[CCDirector sharedDirector] winSize];
    
    int rx = rand();
    int ry = rand();
    int x = remainderl(rx, size.width);
    int y = remainderl(ry, size.height);
    if (x < 0)
        x = size.width + x;
    if (y < 0)
        y = size.height + y;
    
    CGPoint p = CGPointMake(x, y);
    return p;
}



// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
//		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
//		label.position =  ccp( size.width /2 , size.height/2 );
//		[self addChild: label];
		
        seeker = [CCSprite spriteWithFile:@"seeker.png"];
        seeker.position = ccp( size.width/2, size.height/2 );
        [self addChild:seeker];
        
//        m_obstacles = [NSMutableArray array];
        for (int i=0; i < 10; ++i)
        {
            if (0 == remainder(i, 2))
            {
             m_obstacles[ i] = [CCSprite spriteWithFile:@"obstacle.png"];
            }
            else 
            {
             m_obstacles[ i] = [CCSprite spriteWithFile:@"obstacle2.png"];
            }
            
//            spr.position = ccp(rand() % size.width, rand() % size.height);

            int rx = rand();
            int ry = rand();
            int x = remainderl(rx, size.width);
            int y = remainderl(ry, size.height);
            if (x < 0)
                x = size.width + x;
            if (y < 0)
                y = size.height + y;

            CGPoint p = CGPointMake(x, y);
            [ m_obstacles[ i] setPosition:p];
            [self addChild: m_obstacles[ i]];
//            m_obstacles[ i] = spr;
        }

        
        xaccel = 2.0f;
        yaccel = 2.0f;
        xvelocity = 0.0f;
        yvelocity = 0.0f;

        [[UIAccelerometer sharedAccelerometer] setDelegate: self];

        [NSTimer scheduledTimerWithTimeInterval:0.03f 
                                          target:self selector:@selector(tick)
                                        userInfo:nil repeats:YES];
		
	}
	return self;
}

-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    const float xx = [acceleration x];
    const float yy = [acceleration y];

    const float vx = 9.8f * xx * 2.5f;
    const float vy = 9.8f * yy * 2.5f;
    xvelocity += vx;
    yvelocity += vy;

    float xfriction = xvelocity * 0.1f;
    float yfriction = yvelocity * 0.1f;
    xvelocity -= xfriction * (1.f - xx);
    yvelocity -= yfriction * (1.f - yy);
  
}
         
         
-(void) tick
{
    CGPoint p = seeker.position;
    CGPoint p2;
    p2.x = p.x + xvelocity * 0.03f;
    p2.y = p.y + yvelocity * 0.03f;
    
    CGSize size = [[CCDirector sharedDirector] winSize];
//    if (p2.x < 0)
//        p2.x = size.width;
//    if (p2.y < 0)
//        p2.y = size.height;
//    if (p2.x > size.width)
//        p2.x = 0;
//    if (p2.y > size.height)
//        p2.y = 0;   
  
    if (p2.x <=0 || p2.x > size.width ||
        p2.y <= 0 || p2.y > size.height)
    {
        seeker.position = ccp(size.width/2, size.height/2);
        xvelocity = 0.f;
        yvelocity = 0.f;
    }
    else 
    {
        seeker.position = p2;        
    }   
    

    CGRect heroRect = CGRectMake(0, 0, 32, 32);
    heroRect.origin = seeker.position;
    
//    const int cnt = [m_obstacles count];
    for (int i=0; i < 10; ++i)
    {
        CCSprite *spr = m_obstacles[ i];
        CGRect rect = CGRectMake(0, 0, 32, 32);
        rect.origin = spr.position;
  
        if (CGRectIntersectsRect(rect, heroRect))
        {
            int rx = rand();
            int ry = rand();
            int x = remainderl(rx, size.width);
            int y = remainderl(ry, size.height);
            if (x < 0)
                x = size.width + x;
            if (y < 0)
                y = size.height + y;
            
            CGPoint p = CGPointMake(x, y);
            spr.position = p;            
        }
        
    }  
    

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
