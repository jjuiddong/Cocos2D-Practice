//
//  ThirdScene.h
//  studyCocos2d
//
//  Created by 재정 이 on 12. 4. 21..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ThirdScene : CCLayerColor <CCStandardTouchDelegate> {
    
    int particleType;
    
}

+(CCScene *) scene;
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;


@end
