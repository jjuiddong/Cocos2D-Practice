//
//  SecondScene.h
//  studyCocos2d
//
//  Created by 재정 이 on 12. 4. 15..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SecondScene : CCLayerColor <CCStandardTouchDelegate> {
    
    CCSprite *ryu;
    
    
    
}

+(CCScene *) scene;
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end
