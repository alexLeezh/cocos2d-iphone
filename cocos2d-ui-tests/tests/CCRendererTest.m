#import "TestBase.h"

@interface CCRendererTest : TestBase @end
@implementation CCRendererTest

- (void)setupProgressNodeTest
{
	// Radial timer
	{
		NSString *image = @"Tiles/05.png";
		CGPoint position = ccp(0.1, 0.25);
		CCTime interval = 1.0/60.0;
		
		CCSprite *sprite = [CCSprite spriteWithImageNamed:image];
		sprite.positionType = CCPositionTypeNormalized;
		sprite.position = position;
		sprite.color = [CCColor grayColor];
		[self.contentNode addChild:sprite];
		
		CCProgressNode *progress = [CCProgressNode progressWithSprite:[CCSprite spriteWithImageNamed:image]];
		progress.type = CCProgressNodeTypeRadial;
		progress.positionType = CCPositionTypeNormalized;
		progress.position = position;
		[self.contentNode addChild:progress];
		
		[self scheduleBlock:^(CCTimer *timer) {
			progress.percentage = 100.0*(0.5 + 0.5*sin(timer.invokeTime*M_PI));
			[timer repeatOnceWithInterval:interval];
		} delay:interval];
	}
	
	// Radial timer with animating midpoint.
	{
		NSString *image = @"Tiles/05.png";
		CGPoint position = ccp(0.1, 0.5);
		CCTime interval = 1.0/60.0;
		
		CCSprite *sprite = [CCSprite spriteWithImageNamed:image];
		sprite.positionType = CCPositionTypeNormalized;
		sprite.position = position;
		sprite.color = [CCColor grayColor];
		[self.contentNode addChild:sprite];
		
		CCProgressNode *progress = [CCProgressNode progressWithSprite:[CCSprite spriteWithImageNamed:image]];
		progress.type = CCProgressNodeTypeRadial;
		progress.positionType = CCPositionTypeNormalized;
		progress.position = position;
		[self.contentNode addChild:progress];
		
		[self scheduleBlock:^(CCTimer *timer) {
			progress.midpoint = ccpAdd(ccp(0.5, 0.5), ccpMult(ccpForAngle(timer.invokeTime), 0.25));
			progress.percentage = 100.0*(0.5 + 0.5*sin(timer.invokeTime*M_PI));
			
			[timer repeatOnceWithInterval:interval];
		} delay:interval];
	}
	
	{
		NSString *image = @"Tiles/05.png";
		CGPoint position = ccp(0.2, 0.25);
		CCTime interval = 1.0/60.0;
		
		CCSprite *sprite = [CCSprite spriteWithImageNamed:image];
		sprite.positionType = CCPositionTypeNormalized;
		sprite.position = position;
		sprite.color = [CCColor grayColor];
		[self.contentNode addChild:sprite];
		
		CCProgressNode *progress = [CCProgressNode progressWithSprite:[CCSprite spriteWithImageNamed:image]];
		progress.type = CCProgressNodeTypeBar;
		progress.midpoint = ccp(0.5, 0);
		progress.barChangeRate = ccp(0, 1);
		progress.positionType = CCPositionTypeNormalized;
		progress.position = position;
		[self.contentNode addChild:progress];
		
		[self scheduleBlock:^(CCTimer *timer) {
			progress.percentage = 100.0*(0.5 + 0.5*sin(timer.invokeTime*M_PI));
			
			[timer repeatOnceWithInterval:interval];
		} delay:interval];
	}
	
	{
		NSString *image = @"Tiles/05.png";
		CGPoint position = ccp(0.2, 0.5);
		CCTime interval = 1.0/60.0;
		
		CCSprite *sprite = [CCSprite spriteWithImageNamed:image];
		sprite.positionType = CCPositionTypeNormalized;
		sprite.position = position;
		sprite.color = [CCColor grayColor];
		[self.contentNode addChild:sprite];
		
		CCProgressNode *progress = [CCProgressNode progressWithSprite:[CCSprite spriteWithImageNamed:image]];
		progress.type = CCProgressNodeTypeBar;
		progress.midpoint = ccp(0, 0.5);
		progress.barChangeRate = ccp(1, 0);
		progress.positionType = CCPositionTypeNormalized;
		progress.position = position;
		[self.contentNode addChild:progress];
		
		[self scheduleBlock:^(CCTimer *timer) {
			progress.percentage = 100.0*(0.5 + 0.5*sin(timer.invokeTime*M_PI));
			
			[timer repeatOnceWithInterval:interval];
		} delay:interval];
	}
	
	{
		NSString *image = @"Tiles/05.png";
		CGPoint position = ccp(0.3, 0.25);
		CCTime interval = 1.0/60.0;
		
		CCSprite *sprite = [CCSprite spriteWithImageNamed:image];
		sprite.positionType = CCPositionTypeNormalized;
		sprite.position = position;
		sprite.color = [CCColor grayColor];
		[self.contentNode addChild:sprite];
		
		CCProgressNode *progress = [CCProgressNode progressWithSprite:[CCSprite spriteWithImageNamed:image]];
		progress.type = CCProgressNodeTypeBar;
		progress.midpoint = ccp(1, 0.5);
		progress.barChangeRate = ccp(1, 0);
		progress.positionType = CCPositionTypeNormalized;
		progress.position = position;
		[self.contentNode addChild:progress];
		
		[self scheduleBlock:^(CCTimer *timer) {
			progress.percentage = 100.0*(0.5 + 0.5*sin(timer.invokeTime*M_PI));
			
			[timer repeatOnceWithInterval:interval];
		} delay:interval];
	}
	
	{
		NSString *image = @"Tiles/05.png";
		CGPoint position = ccp(0.3, 0.5);
		CCTime interval = 1.0/60.0;
		
		CCSprite *sprite = [CCSprite spriteWithImageNamed:image];
		sprite.positionType = CCPositionTypeNormalized;
		sprite.position = position;
		sprite.color = [CCColor grayColor];
		[self.contentNode addChild:sprite];
		
		CCProgressNode *progress = [CCProgressNode progressWithSprite:[CCSprite spriteWithImageNamed:image]];
		progress.type = CCProgressNodeTypeBar;
		progress.midpoint = ccp(0.5, 1);
		progress.barChangeRate = ccp(0, 1);
		progress.positionType = CCPositionTypeNormalized;
		progress.position = position;
		[self.contentNode addChild:progress];
		
		[self scheduleBlock:^(CCTimer *timer) {
			progress.percentage = 100.0*(0.5 + 0.5*sin(timer.invokeTime*M_PI));
			
			[timer repeatOnceWithInterval:interval];
		} delay:interval];
	}
}

- (void)setupDrawNodeTest
{
	CCDrawNode *draw = [CCDrawNode node];
	
	[draw drawDot:ccp(100, 100) radius:50 color:[CCColor redColor]];
	[draw drawSegmentFrom:ccp(100, 200) to:ccp(200, 200) radius:25 color:[CCColor blueColor]];
	
	CGPoint points1[] = {
		{300, 100},
		{350,  50},
		{400, 100},
		{400, 200},
		{350, 250},
		{300, 200},
	};
	[draw drawPolyWithVerts:points1 count:sizeof(points1)/sizeof(*points1) fillColor:[CCColor greenColor] borderWidth:5.0 borderColor:[CCColor whiteColor]];
	
	CGPoint points2[] = {
		{325, 125},
		{375, 125},
		{350, 200},
	};
	[draw drawPolyWithVerts:points2 count:sizeof(points2)/sizeof(*points2) fillColor:[CCColor blackColor] borderWidth:0.0 borderColor:[CCColor whiteColor]];
	
	[self.contentNode addChild:draw];
}

@end

