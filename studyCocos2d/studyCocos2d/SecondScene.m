//
//  SecondScene.m
//  studyCocos2d
//
//  Created by 재정 이 on 12. 4. 15..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "SecondScene.h"
#import "SimpleAudioEngine.h"
#import "ThirdScene.h"


@implementation SecondScene


// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SecondScene *layer = [SecondScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(id) init
{
	if( (self=[super initWithColor:ccc4(0 , 0, 0, 0)])) {
        
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        self.isTouchEnabled = YES;
        
        // background layer (parallaxNode)
        CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
        background.anchorPoint = ccp(0.5,0.5);
        
        CCParallaxNode *voidNode = [CCParallaxNode node];
        [voidNode addChild:background z:1 parallaxRatio:ccp(1.0, 0) positionOffset:ccp(size.width/2, size.height/2)];
        CCLayer *gameLayer = [CCLayer node];
        [gameLayer addChild:voidNode z:2];
        [self addChild:gameLayer];
        
        CCMoveBy *go = [CCMoveBy actionWithDuration:4 position:ccp(-160,0)];
        CCActionInterval *goBack = [go reverse];
        CCSequence *seq = [CCSequence actions:go, goBack, nil];
//        [gameLayer runAction:[CCRepeatForever actionWithAction:seq]];
                              

//        CCSpriteBatchNode *ryuBatch = [CCSpriteBatchNode batchNodeWithFile:@"ryu.png" capacity:50];
//        [self addChild:ryuBatch];        
//        NSString *aniName = @"particleTest.plst";
        NSString *aniName = @"ryu.plist";
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:aniName];
        NSMutableArray *aniFrames = [NSMutableArray array];
        for (int i=0; i < 13; ++i)
        {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"%d.png", i+1]];
            [aniFrames addObject:frame];
        }
        
        ryu = [CCSprite spriteWithSpriteFrame:[aniFrames objectAtIndex:0]];
        ryu.position = ccp(250,200);
//        [gameLayer addChild:ryu z:3];
        [voidNode addChild:ryu z:3 parallaxRatio:ccp(2.0,0) positionOffset:ccp(240,200)];        
        
        CCAnimation *animation = [CCAnimation animationWithSpriteFrames:aniFrames delay:0.3f];        
        CCAnimate *animate = [CCAnimate actionWithAnimation:animation];
        animate = [CCRepeatForever actionWithAction:animate];
        [ryu runAction:animate];
            
        
        // Sound
        [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"House_of_books.mp3"];
        
        
        // ParticleSystem
//        id particleSystem = [[CCParticleSystem alloc] initWithTotalParticles:<#(NSUInteger)#>
        
        
        // UI
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
                         itemFromNormalImage:@"btn_blue_normal.png"
                         selectedImage:@"btn_blue_select.png"
                         target:self 
                         selector:@selector(doClick3:)],
                        
                        [CCMenuItemImage 
                         itemFromNormalImage:@"btn_blue_normal.png"
                         selectedImage:@"btn_blue_select.png"
                         target:self 
                         selector:@selector(doClick4:)],
                        
                        [CCMenuItemImage 
                         itemFromNormalImage:@"btn_blue_normal.png"
                         selectedImage:@"btn_blue_select.png"
                         target:self 
                         selector:@selector(doClick5:)]
                        
                        , nil];
    
        [menu alignItemsHorizontally];
        menu.position = ccp(240, 50);
        [gameLayer addChild:menu z:4];

        // Timer
        [self schedule:@selector(callEveryFrame:)];
        [self schedule:@selector(tick:) interval:1.0];
        
    }
    
    return self;    
}

-(void) callEveryFrame: (ccTime)dt
{

}

-(void) tick: (ccTime)dt
{
    printf("tick \n" );
}


-(void) doClick1: (CCMenuItem*) menuItem 
{
    //    NSLog(@"doClick");
    printf( "secondScene doClick1 %d \n", menuItem.tag );
    
    [[CCDirector sharedDirector] popScene];
//    [[CCDirector sharedDirector] replaceScene:[
    
    
}

-(void) doClick2: (CCMenuItem*) menuItem 
{
    //    NSLog(@"doClick");
    printf( "secondScene doClick2 %d \n", menuItem.tag );
    [[SimpleAudioEngine sharedEngine] playEffect:@"neigh3.wav"];
    
//    [[CCDirector sharedDirector] pause]; // animation, schedule stop
    
}

-(void) doClick3: (CCMenuItem*) menuItem 
{
    //    NSLog(@"doClick");
    printf( "secondScene doClick3 %d \n", menuItem.tag );
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"House_of_books.mp3"];

}

-(void) doClick4: (CCMenuItem*) menuItem 
{
    //    NSLog(@"doClick");
    printf( "secondScene doClick4 %d \n", menuItem.tag );
    
//    CCParticleSystem *particleTest = [CCParticleExplosion node];
//    CCParticleSystem *particleTest = [CCParticleFire node];
//    CCParticleSystem *particleTest = [CCParticleFireworks node];
//    CCParticleSystem *particleTest = [CCParticleFlower node];
//    CCParticleSystem *particleTest = [CCParticleGalaxy node];
//    CCParticleSystem *particleTest = [CCParticleMeteor node];
//    CCParticleSystem *particleTest = [CCParticleRain node];
//    CCParticleSystem *particleTest = [CCParticleSmoke node];
//    CCParticleSystem *particleTest = [CCParticleSnow node];
    CCParticleSystem *particleTest = [CCParticleSystemQuad particleWithFile:@"particleTest.plist"];
//    CCParticleSystem *particleTest = [CCParticleSystemQuad particleWithFile:@"explosion.plist"];    
    
    
//    particleTest.texture =[[CCTextureCache sharedTextureCache] addImage:@"snow.jpg"];
//    particleTest.texture =[[CCTextureCache sharedTextureCache] addImage:@"particleTexture.png"];    
    
    [self addChild:particleTest z:5 tag:100];
    
}

-(void) doClick5: (CCMenuItem*) menuItem 
{
    [[CCDirector sharedDirector] pushScene:[ThirdScene scene]];


}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CCParticleSystem *particleSystem = (CCParticleSystem*)[self getChildByTag:100];
    
    NSArray *array = [touches allObjects];
    if (1 <= array.count)
    {
        UITouch *touch = [array objectAtIndex:0];
        CGPoint pos = [touch locationInView:nil];
        if (particleSystem)
            particleSystem.position = ccp(pos.y, pos.x);
    }
}
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CCParticleSystem *particleSystem = (CCParticleSystem*)[self getChildByTag:100];
    
    NSArray *array = [touches allObjects];
    if (1 <= array.count)
    {
        UITouch *touch = [array objectAtIndex:0];
        CGPoint pos = [touch locationInView:nil];
        if (particleSystem)
            particleSystem.position = ccp(pos.y, pos.x);
    }
    
}
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
- (void)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
