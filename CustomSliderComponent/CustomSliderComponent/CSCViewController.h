//
//  CSCViewController.h
//  CustomSliderComponent
//
//  Created by Helene Brooks on 11/27/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCViewController : UIViewController<UIGestureRecognizerDelegate>{
    CGFloat firstX;
    CGFloat firstY;
}
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (nonatomic) CGFloat firstX;
@property (nonatomic) CGFloat firstY;
@property (nonatomic) CGFloat constantY;
@property (nonatomic) CGFloat endY;;
@property (weak, nonatomic) IBOutlet UIImageView *slider;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UIImageView *light1;
@property (weak, nonatomic) IBOutlet UIImageView *light2;
@property (weak, nonatomic) IBOutlet UIImageView *light3;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *lightCollection;
@property (weak, nonatomic) IBOutlet UIImageView *spot3;
@property (weak, nonatomic) IBOutlet UIImageView *spot2;
@property (weak, nonatomic) IBOutlet UIImageView *spot1;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *spotLights;
@property (nonatomic) BOOL isRunning;
- (IBAction)moveSlider:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *appleCollection;
- (void)turnOnLight:(NSInteger)lightNumber;
- (void) fadeLightIN:(UIView*)light withDuration:(float)duration complete:(BOOL)complete opacity:(float)opac;
- (void) fadeLightOUT:(UIView*)light withDuration:(float)duration complete:(BOOL)complete opacity:(float)opac;
- (void)animateSLiderToPosition:(CGPoint)pos tag:(NSInteger)tag;
@property (weak, nonatomic) IBOutlet UIImageView *powerUpBotton;
- (IBAction)PowerUp:(id)sender;
@end
