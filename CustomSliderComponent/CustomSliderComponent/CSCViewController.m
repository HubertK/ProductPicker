//
//  CSCViewController.m
//  CustomSliderComponent
//
//  Created by Helene Brooks on 11/27/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import "CSCViewController.h"

@implementation CSCViewController
@synthesize sliderView;
@synthesize slider;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize light1;
@synthesize light2;
@synthesize light3;
@synthesize lightCollection;
@synthesize spot3;
@synthesize spot2;
@synthesize spot1;
@synthesize spotLights;
@synthesize appleCollection;

@synthesize firstX,firstY,constantY,endY;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.constantY = self.sliderView.center.y;
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
	[panRecognizer setMinimumNumberOfTouches:1];
	[panRecognizer setMaximumNumberOfTouches:1];
	[panRecognizer setDelegate:self];
	[sliderView addGestureRecognizer:panRecognizer];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)move:(id)sender {
	NSLog(@"See a move gesture");
       
   
	//[self.view bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
	CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        
		firstX = [[sender view] center].x;
		firstY = constantY;
	}
    
    
	translatedPoint = CGPointMake(firstX+translatedPoint.x, constantY);
    
//	[[sender view] setCenter:translatedPoint];
    NSInteger light;
    self.endY = translatedPoint.x;
    CGFloat finalX;
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        if (endY > 340 && endY < 700) {
            finalX = self.label2.center.x;
            light = 2;
        }
        
      else if (endY > 701 && endY < 1000) {
            finalX = self.label3.center.x;
          light = 3;
        }
        
        else{
            finalX = self.label1.center.x;
            light = 1;
        }
        translatedPoint = CGPointMake(finalX, constantY);
    }
    
    CGPoint newPos = CGPointMake(finalX, constantY);
    [self animateSLiderToPosition:newPos tag:light];//**************NEW METHOD CALL HERE**************************
//    [UIView animateWithDuration:.35
//                          delay:0
//                        options: UIViewAnimationCurveEaseOut
//                     animations:^{
//                          [[sender view] setCenter:CGPointMake(finalX, constantY)];
//                     } 
//                     completion:^(BOOL finished){
//                         NSLog(@"Done!");
//                          [self turnOnLight:light];
//                     }];
   [[sender view] setCenter:translatedPoint];
    
}
- (void)animateSLiderToPosition:(CGPoint)pos tag:(NSInteger)tag{
    [UIView animateWithDuration:.35
                          delay:0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [sliderView setCenter:pos];
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         [self turnOnLight:tag];
                     }];

}
- (void)turnOnLight:(NSInteger)lightNumber{
    for (UIImageView *light in self.lightCollection) {
        if ([light tag] == lightNumber) {
            light.image = [UIImage imageNamed:@"green.png"];
            
        }
        else{
            light.image = [UIImage imageNamed:@"red.png"];
        }
    }
    for (UIImageView *spotLight in spotLights) {
        if ([spotLight tag] == lightNumber) {
            [self fadeLightIN:spotLight withDuration:.55 complete:YES opacity:0.4];
        }
        else{
            [self fadeLightOUT:spotLight withDuration:.55 complete:YES opacity:0.0];
        }
    }
    for (UIImageView *product in appleCollection) {
        if ([product tag] == lightNumber) {
            [self fadeLightIN:product withDuration:.55 complete:YES opacity:1.0];
        }
        else{
            [self fadeLightOUT:product withDuration:.55 complete:YES opacity:0.1];
        }
    }
    
    
}
- (void) fadeLightIN:(UIView*)light withDuration:(float)duration complete:(BOOL)complete opacity:(float)opac{
    [UIView animateWithDuration:duration
                          delay:0
                        options: UIViewAnimationCurveLinear
                     animations:^{
                         light.alpha = opac;
                     } 
                     completion:^(BOOL finished){
                        
                         if (complete == YES) {
                              NSLog(@"FadedIN!");
                         }
                         else{
                             [self fadeLightOUT:light withDuration:0.01 complete:NO opacity:0.0];
                         }
                        
                     }];

}
- (void) fadeLightOUT:(UIView*)light withDuration:(float)duration complete:(BOOL)complete opacity:(float)opac{
    [UIView animateWithDuration:duration
                          delay:0
                        options: UIViewAnimationCurveLinear
                     animations:^{
                         light.alpha = opac;
                     } 
                     completion:^(BOOL finished){
                         if (complete == YES) {
                             NSLog(@"FadedOUT");
                         }
                         else{
                             [self fadeLightIN:light withDuration:.55 complete:YES opacity:0.4];
                         }
                         
                         
                     }];

}
- (void)viewDidUnload
{
    [self setSlider:nil];
    [self setSliderView:nil];
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [self setLight1:nil];
    [self setLight2:nil];
    [self setLight3:nil];
    [self setLightCollection:nil];
    
    [self setSpot3:nil];
    [self setSpot2:nil];
    [self setSpot1:nil];
    [self setSpotLights:nil];
    [self setAppleCollection:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (IBAction)moveSlider:(id)sender {
    NSInteger buttonTag = [sender tag];
    CGPoint buttonLoc;
    switch (buttonTag) {
        case 1:
            buttonLoc =CGPointMake(label1.center.x, 90+(sliderView.frame.size.height)/2);
            break;
            
        case 2:
            buttonLoc =  buttonLoc =CGPointMake(label2.center.x, 90+(sliderView.frame.size.height)/2);
            break;
            
        case 3:
            buttonLoc =  buttonLoc =CGPointMake(label3.center.x, 90+(sliderView.frame.size.height)/2);
            break;
            
        default:
            break;
    }
    [self animateSLiderToPosition:buttonLoc tag:buttonTag];
}
















@end
