//
//  ThirdScene.m
//  studyCocos2d
//
//  Created by 재정 이 on 12. 4. 21..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "ThirdScene.h"


@implementation ThirdScene


// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ThirdScene *layer = [ThirdScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(id) init
{
	if( (self=[super initWithColor:ccc4(0 , 0, 0, 0)])) {

//		CGSize size = [[CCDirector sharedDirector] winSize];

        self.isTouchEnabled = YES;
        particleType = 0;

        CCSprite *blue = [CCSprite spriteWithFile:@"pepper_blue.png"];
        blue.position = ccp(200, 200);
        [self addChild:blue];

        CCSprite *green = [CCSprite spriteWithFile:@"pepper_green.png"];
        green.position = ccp(250, 200);
        [self addChild:green];

        CCSprite *purple = [CCSprite spriteWithFile:@"pepper_purple.png"];
        purple.position = ccp(300, 200);
        [self addChild:purple];

        CCSprite *red = [CCSprite spriteWithFile:@"pepper_red.png"];
        red.position = ccp(200, 250);
        [self addChild:red];

        CCSprite *yellow = [CCSprite spriteWithFile:@"pepper_yellow.png"];
        yellow.position = ccp(250, 250);
        [self addChild:yellow];
        
        id myAction1 = [CCScaleTo actionWithDuration:2 scale:5];
        [blue runAction:myAction1];
        id myAction2 = [CCScaleTo actionWithDuration:2 scale:5];        
        [green runAction:myAction2];
        id myAction3 = [CCScaleTo actionWithDuration:2 scale:5];        
        [purple runAction:myAction3];
        id myAction4 = [CCScaleTo actionWithDuration:2 scale:5];        
        [red runAction:myAction4];
        id myAction5 = [CCScaleTo actionWithDuration:2 scale:5];
        [yellow runAction:myAction5];
        
        
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
                         selector:@selector(doClick4:)]
                                                
                        , nil];
        
        [menu alignItemsHorizontally];
        menu.position = ccp(240, 50);
        [self addChild:menu];

        
    }

    return self;
}

- (void) doClick1: (CCMenuItem*) menuItem 
{
    [[CCDirector sharedDirector] popScene];
    
}

- (void) doClick2: (CCMenuItem*) menuItem 
{
    particleType = 0;
    
}

- (void) doClick3: (CCMenuItem*) menuItem 
{
    particleType = 1;
}

- (void) doClick4: (CCMenuItem*) menuItem 
{
    particleType = 2;
    
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    
    NSArray *array = [touches allObjects];
    if (1 <= array.count)
    {
        UITouch *touch = [array objectAtIndex:0];
        CGPoint pos = [touch locationInView:nil];
        int tag = 100;

        CCParticleSystem *particleSystem = nil;
        switch (particleType) {
            case 0:
                particleSystem = [CCParticleSystemQuad particleWithFile:@"explosion.plist"];
                break;
            case 1:
                particleSystem = [CCParticleSystemQuad particleWithFile:@"sunExplosion.plist"];
                break;
            case 2:
            {
                tag = 102;
                CCParticleSystem *particle = (CCParticleSystem*)[self getChildByTag:102];
                if (!particle)
                    particleSystem = [CCParticleSystemQuad particleWithFile:@"skyParticle.plist"];
            }
            break;
        }
        
        if (particleSystem)
        {
            particleSystem.position = ccp(pos.y, pos.x);
            [self addChild:particleSystem z:5 tag:tag];
        }
    }
    
}
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CCParticleSystem *particle = (CCParticleSystem*)[self getChildByTag:102];
    
    NSArray *array = [touches allObjects];
    if (1 <= array.count)
    {
        UITouch *touch = [array objectAtIndex:0];
        CGPoint pos = [touch locationInView:nil];
        if (particle)
            particle.position = ccp(pos.y, pos.x);
    }    
    
}
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    
    
}
- (void)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
