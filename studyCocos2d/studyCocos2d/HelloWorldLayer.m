//
//  HelloWorldLayer.m
//  studyCocos2d
//
//  Created by 재정 이 on 12. 4. 11..
//  Copyright __MyCompanyName__ 2012년. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "SecondScene.h"

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
	if( (self=[super initWithColor:ccc4(0 , 0, 0, 0)])) {
		
        self.isTouchEnabled = YES;
        
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        character = [CCSprite spriteWithFile:@"person_small.png"];
        character.position = ccp(100, 100);
        character.anchorPoint = ccp(1, 0.);
        [self addChild:character z:3];

        character_run = [CCSprite spriteWithFile:@"person_run.png"];
//        character_run.position = ccp(300, 150);
        character_run.position = ccp(50, 50);
        character_run.anchorPoint = ccp(0, 1);
//        [self addChild:character_run z:2];
//        [character addChild:character_run];
        
        
//        parent = [CCSprite node];
//        [parent setTextureRect:CGRectMake(0, 0, 150, 150)];
//        [parent setColor:ccWHITE];
//        parent.position = ccp(140, 160);
//        [self addChild:parent];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"eifjeifjiejfiefjiejfiejfiejeijfeijfeijfiejfiejifj" dimensions:CGSizeMake(300, 100) alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeCharacterWrap fontName:@"Marker felt" fontSize:16];
        label.position = ccp(size.width/2, size.height/2);
//        [self addChild:label];
  ;
        
        CCMenu *menu = [CCMenu menuWithItems: 
                            [CCMenuItemImage 
                            itemFromNormalImage:@"btn_normal.png"
                            selectedImage:@"btn_select.png"
                            target:self 
                            selector:@selector(doClick1:)],

                        [CCMenuItemImage 
                         itemFromNormalImage:@"btn_blue_normal.png"
                         selectedImage:@"btn_blue_select.png"
                         target:self 
                         selector:@selector(doClick2:)],

                        [CCMenuItemImage 
                         itemFromNormalImage:@"btn_normal.png"
                         selectedImage:@"btn_select.png"
                         target:self 
                         selector:@selector(doClick3:)],

                        [CCMenuItemImage 
                         itemFromNormalImage:@"btn_normal.png"
                         selectedImage:@"btn_select.png"
                         target:self 
                         selector:@selector(doClick4:)]

                        , nil];
        
        [menu alignItemsHorizontally];
        menu.position = ccp(240, 50);
        [self addChild:menu];

	}
	return self;
}

-(void) doClick1: (CCMenuItem*) menuItem 
{
//    NSLog(@"doClick");
    printf( "doClick1 %d \n", menuItem.tag );
    
//    id myAction = [CCJumpBy actionWithDuration:1 position:ccp(200,0) height:50 jumps:3];
//    id myAction = [CCRotateBy actionWithDuration:3 angle:360];
//    id myAction = [CCBlink actionWithDuration:2 blinks:10];
//    id myAction = [CCFadeIn actionWithDuration:2];
//        id myAction = [CCFadeOut actionWithDuration:2];
//    id myAction = [CCTintBy actionWithDuration:2 red:0 green:255 blue:0];
//    id myAction = [CCTintTo actionWithDuration:2 red:0 green:255 blue:0];
//    [character runAction:myAction];

    [[CCDirector sharedDirector] pushScene:[SecondScene scene]];
    
//    CCScene *scene = [CCTransitionFade transitionWithDuration:2 scene:[SecondScene scene]];
//    CCScene *scene = [CCTransitionFlipX transitionWithDuration:2 scene:[SecondScene scene]];    
//    CCScene *scene = [CCTransitionProgressRadialCCW  transitionWithDuration:2 scene:[SecondScene scene]];        
//    [[CCDirector sharedDirector] pushScene:scene];

    
}

-(void) doClick2: (CCMenuItem*) menuItem 
{
    //    NSLog(@"doClick");
    printf( "doClick2 %d \n", menuItem.tag );

//    id myAction = [CCJumpBy actionWithDuration:1 position:ccp(200,0) height:50 jumps:3];
    id myAction1 = [CCMoveBy actionWithDuration:2 position:ccp(100,100)];
    id myAction2 = [CCMoveBy actionWithDuration:2 position:ccp(80,-80)];
    id myAction3 = [CCMoveBy actionWithDuration:2 position:ccp(0,80)];
    [character runAction:[CCSequence actions: myAction1, myAction2, myAction3, nil]];
}

-(void) doClick3: (CCMenuItem*) menuItem 
{
    //    NSLog(@"doClick");
    printf( "doClick3 %d \n", menuItem.tag );
    
    id myAction1 = [CCMoveBy actionWithDuration:2 position:ccp(100,100)];
    id myAction2 = [CCScaleBy actionWithDuration:2 scale:0.5];
    id totalAction = [CCSpawn actions:myAction1, myAction2, nil];
    [character runAction:totalAction];                
}


-(void) doClick4: (CCMenuItem*) menuItem 
{
    //    NSLog(@"doClick");
    printf( "doClick3 %d \n", menuItem.tag );
    
    id myAction =[CCMoveBy actionWithDuration:2 position:ccp(200,100)];
//    id action = [CCEaseIn actionWithAction:myAction rate:5];
//      id action = [CCEaseElastic actionWithAction:myAction period:1];
//      id action = [CCEaseBounce actionWithAction:myAction];    
      id action = [CCEaseBackInOut actionWithAction:myAction];        
    
    [character runAction:action];                
}


-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
//    CGSize size = [[CCDirector sharedDirector] winSize];
//    CGPoint point = [touch locationInView:[touch view]];
//    character.position = ccp(point.x, 320-size.height);
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
