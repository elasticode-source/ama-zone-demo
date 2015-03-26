//
//  ElasticodeOnBoarding.m
//  Onboard
//
//  Created by Tomer on 28/1/15.
//  Copyright (c) 2015 Elasticode. All rights reserved.
//

#import <ElastiCode/ElastiCode.h>
#import <ElastiCode/ECOnBoarding.h>
#import "ElasticodeOnBoarding.h"
#import "ECSplashScreen.h"

#define onBoardingVersionString @"6.0"

@interface ElasticodeOnBoarding ()
@property (nonatomic,strong) UIViewController* (^getAppRootVCBlock)(void);
@end
@implementation ElasticodeOnBoarding
    

-(void) startOnBoradingOnWindow:(UIWindow*) window
              withElasticodeKey:(NSString*) elasticodeKey
      viewControllerGetterBlock:(UIViewController* (^)(void))getAppRootVCBlock;
{
    self.window = window;
    self.getAppRootVCBlock = getAppRootVCBlock;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleElasticodeSessionStarted) name:ELASTICODE_SESSION_STARTED object:nil];
    
    ECSplashScreen* svc = [ECSplashScreen new];
    self.window.rootViewController = svc;
    [self.window makeKeyAndVisible];
    
#ifdef DEBUG
    [ElastiCode devModeWithLogging:elastiCodeLogLevelDetailed];
#endif
    [ElastiCode startSession:elasticodeKey onBoardingVersion:onBoardingVersionString];
}

-(void) handleOnboardingCompletion{
    [ElastiCode onBoardingGoalReached:onBoardingVersionString];
    UIViewController* vc = self.getAppRootVCBlock();
    if(vc){
        self.window.rootViewController = vc;
    }
}

-(void) handleElasticodeSessionStarted{
    // Session started - let's define the onboarding values
    NSArray* screens = nil;
    
#warning Choose a default onBoarding by uncommenting one of the following templates configurations.
    /*
     * For more information about templates
     * visit: http://docs.elasticode.com/v1.0/docs/ob-templates
     */
//    screens = [self template1];
//    screens = [self template2];
//    screens = [self template3];
//    screens = [self template4];
    screens = [self template5];
//    screens = [self template6];
//    screens = [self template7];
//    screens = [self template8];
//    screens = [self template9];
//    screens = [self template10];
//    screens = [self template11];
    
    ECOnboardingViewController *onboardingVC =
    [ElastiCode createOnBoardingWithScreens:screens
                                WithVersion:onBoardingVersionString
                          completionHandler:^{
                              [self handleOnboardingCompletion];
                          }
                          additionalActions:
     @[
       [ECOnBoardingAction createWithName:@"Show Video" action:^{
        [self showVideo];
    }]]];
    onboardingVC.fadePageControlOnLastPage = YES;
    onboardingVC.view.backgroundColor = [UIColor colorWithRed:0.684 green:0.828 blue:0.827 alpha:1];
    self.window.rootViewController = onboardingVC;

}
-(void) showVideo{
    UIAlertView* av = [[UIAlertView alloc]initWithTitle:@"Video preview" message:@"Here you would add logic to display video content" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];
}

-(NSArray*) template1
{
    ECOnBoardingScreenTemplate1* screen1 = [[ECOnBoardingScreenTemplate1 alloc]init];
    screen1.label.text = @"Every thing you ever... \n Thought about retail apps \n Is about to change!";
    screen1.label.textColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1];
    screen1.label.fontName = @"TimeNewRomanPS-ItalicMT";
    screen1.label.fontSize = 15;
    screen1.ctaButton.show = YES;
    screen1.ctaButton.type = CTAButtonType_withText_google;
    [screen1.image setImageNameForIPhone4:@"" forIPhone5:@"" forIPhone6:@"" forIPhone6Plus:@""];
    screen1.backgroundColor = [UIColor colorWithRed:0.000 green:0.384 blue:0.627 alpha:1];
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template2
{
    ECOnBoardingScreenTemplate2* screen1 = [[ECOnBoardingScreenTemplate2 alloc]init];
    screen1.label.text = @"Are You Ready?";
    screen1.label.textColor = [UIColor colorWithRed:0.349 green:0.341 blue:0.341 alpha:1];
    screen1.ctaButton.show = YES;
    screen1.ctaButton.type = CTAButtonType_withText_facebook;
    [screen1.image setImageNameForIPhone4:@"" forIPhone5:@"" forIPhone6:@"" forIPhone6Plus:@""];
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template3
{
    ECOnBoardingScreenTemplate3* screen1 = [[ECOnBoardingScreenTemplate3 alloc]init];
    screen1.label.text = @"Are You Ready?";
    screen1.label.textColor = [UIColor colorWithRed:0.349 green:0.341 blue:0.341 alpha:1];
    screen1.label2.text = @"Calendar Madness!";
    screen1.label2.textColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1];
    screen1.label2.fontName = @"HelveticaNeue-Bold";
    screen1.label2.fontSize = 16;
    screen1.label3.text = @"So, Are you ready to get your calendar get more organized ?";
    screen1.label3.textColor = [UIColor colorWithRed:0.486 green:0.408 blue:0.408 alpha:1];
    screen1.label3.fontName = @"HelveticaNeue-BoldItalic";
    screen1.ctaButton.show = YES;
    screen1.ctaButton.type = CTAButtonType_withText_google;
    [screen1.image setImageNameForIPhone4:@"" forIPhone5:@"" forIPhone6:@"" forIPhone6Plus:@""];
    screen1.overlayColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1];
    screen1.backgroundColor = [UIColor colorWithRed:0.878 green:0.882 blue:0.886 alpha:1];
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template4
{
    ECOnBoardingScreenTemplate4* screen1 = [[ECOnBoardingScreenTemplate4 alloc]init];
    screen1.label.text = @"Are you ready? \n Cause we are! \n Let's get this one started:)";
    screen1.label.textColor = [UIColor colorWithRed:0.400 green:0.322 blue:0.322 alpha:1];
    screen1.label.fontName = @"Palatino-Italic";
    screen1.label.fontSize = 18;
    screen1.ctaButton.show = YES;
    screen1.ctaButton.type = CTAButtonType_withText_facebook;
    screen1.ctaButton2.show = YES;
    screen1.ctaButton2.type = CTAButtonType_withText_google;
    screen1.ctaButton3.show = NO;
    screen1.backgroundColor = [UIColor colorWithRed:1.000 green:0.976 blue:0.976 alpha:1];
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template5
{
    ECOnBoardingScreenTemplate5* screen1 = [[ECOnBoardingScreenTemplate5 alloc]init];
    screen1.label.text = @"Transform your Amazon\nBuying experience\nFrom Just \"Buy\" to\n\"Get The Best Deal\"";
    screen1.label.textColor = [UIColor whiteColor];
    screen1.label.fontName = @"Helvetica-Light";
    screen1.label.fontSize = 25;
    screen1.label.textOffsetY = 312;
    screen1.ctaButton.show = NO;
    screen1.ctaButton.type = CTAButtonType_withText_facebook;
    screen1.ctaButton2.show = NO;
    screen1.ctaButton2.type = CTAButtonType_withText_google;
    screen1.ctaButton3.show = YES;
    screen1.ctaButton3.type = 0;
    screen1.ctaButton3.text = @"Let's get started";
    screen1.ctaButton3.textColor = [UIColor colorWithRed:0.051 green:0.212 blue:0.337 alpha:1]; /*#0d3656*/
    screen1.ctaButton3.backgroundColor = [UIColor whiteColor];
    screen1.ctaButton3.fontSize = 30;
    screen1.ctaButton3.fontName = @"HelveticaNeue-light";
    [screen1.image setImageNameForIPhone4:@"" forIPhone5:@"" forIPhone6:@"ScreenDeals_clean.jpg" forIPhone6Plus:@""];
    screen1.ctaButton3.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template6
{
    ECOnBoardingScreenTemplate6* screen1 = [[ECOnBoardingScreenTemplate6 alloc]init];
    screen1.label.textColor = [UIColor colorWithRed:0.969 green:0.773 blue:0.624 alpha:1];
    screen1.label.fontName = @"HoeflerText-BlackItalic";
    screen1.label.fontSize = 30;
    screen1.ctaButton.show = YES;
    screen1.ctaButton.type = CTAButtonType_withText_twitter;
    screen1.ctaButton2.show = YES;
    screen1.ctaButton2.fontName = @"HoeflerText-Black";
    screen1.ctaButton2.textColor = [UIColor colorWithRed:0.165 green:0.196 blue:0.294 alpha:1];
    screen1.ctaButton2.backgroundColor = [UIColor colorWithRed:0.882 green:0.898 blue:0.933 alpha:1];
    screen1.ctaButton2.fontSize = 20;
    screen1.ctaButton2.text = @"Sign up";
    screen1.ctaButton3.show = YES;
    screen1.ctaButton3.fontName = @"HoeflerText-Black";
    screen1.ctaButton3.textColor = [UIColor colorWithRed:0.165 green:0.196 blue:0.294 alpha:1];
    screen1.ctaButton3.backgroundColor = [UIColor colorWithRed:0.780 green:0.800 blue:0.859 alpha:1];
    screen1.ctaButton3.fontSize = 20;
    screen1.ctaButton3.text = @"Sign in";
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template7
{
    ECOnBoardingScreenTemplate7* screen1 = [[ECOnBoardingScreenTemplate7 alloc]init];
    screen1.label.text = @"Are You Ready?";
    screen1.label.textColor = [UIColor colorWithRed:0.349 green:0.341 blue:0.341 alpha:1];
    screen1.ctaButton.show = YES;
    screen1.ctaButton.type = CTAButtonType_withText_facebook;
    screen1.ctaButton2.show = YES;
    screen1.ctaButton2.textColor = [UIColor colorWithRed:0.180 green:0.075 blue:0.063 alpha:1];
    screen1.ctaButton2.backgroundColor = [UIColor colorWithRed:0.859 green:0.792 blue:0.651 alpha:1];
    screen1.ctaButton2.fontSize = 20;
    screen1.ctaButton2.text = @"Sign up";
    screen1.ctaButton3.show = YES;
    screen1.ctaButton3.textColor = [UIColor colorWithRed:0.180 green:0.075 blue:0.063 alpha:1];
    screen1.ctaButton3.backgroundColor = [UIColor colorWithRed:0.859 green:0.792 blue:0.651 alpha:1];
    screen1.ctaButton3.fontSize = 20;
    screen1.ctaButton3.text = @"Sign in";
    [screen1.image setImageNameForIPhone4:@"" forIPhone5:@"" forIPhone6:@"" forIPhone6Plus:@""];
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template8
{
    ECOnBoardingScreenTemplate8* screen1 = [[ECOnBoardingScreenTemplate8 alloc]init];
    screen1.label.textColor = [UIColor colorWithRed:0.188 green:0.910 blue:0.451 alpha:1];
    screen1.label.fontSize = 30;
    screen1.label2.textColor = [UIColor colorWithRed:0.329 green:0.220 blue:0.863 alpha:1];
    screen1.label2.fontSize = 20;
    screen1.ctaButton.show = YES;
    screen1.ctaButton.type = CTAButtonType_withText_twitter;
    screen1.backgroundColor = [UIColor colorWithRed:0.698 green:0.298 blue:0.388 alpha:1];
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template9
{
    ECOnBoardingScreenTemplate9* screen1 = [[ECOnBoardingScreenTemplate9 alloc]init];
    screen1.label.text = @"Are You Ready?";
    screen1.label.textColor = [UIColor colorWithRed:0.349 green:0.341 blue:0.341 alpha:1];
    screen1.label.fontName = @"Helvetica";
    screen1.label2.text = @"Get ready to get the best out of your new app";
    screen1.label2.textColor = [UIColor colorWithRed:0.259 green:0.153 blue:0.118 alpha:1];
    screen1.label2.fontName = @"HelveticaNeue-Bold";
    screen1.label2.fontSize = 20;
    screen1.ctaButton.show = YES;
    screen1.ctaButton.type = CTAButtonType_withText_facebook;
    [screen1.image setImageNameForIPhone4:@"" forIPhone5:@"" forIPhone6:@"" forIPhone6Plus:@""];
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template10
{
    ECOnBoardingScreenTemplate10* screen1 = [[ECOnBoardingScreenTemplate10 alloc]init];
    screen1.label.textColor = [UIColor colorWithRed:0.490 green:0.631 blue:0.443 alpha:1];
    screen1.label.fontName = @"Menlo-Bold";
    screen1.label.fontSize = 30;
    screen1.label2.textColor = [UIColor colorWithRed:0.490 green:0.631 blue:0.443 alpha:1];
    screen1.label2.fontName = @"Menlo-Bold";
    screen1.label2.fontSize = 20;
    screen1.ctaButton.show = YES;
    screen1.ctaButton.fontName = @"Menlo-Bold";
    screen1.ctaButton.textColor = [UIColor colorWithRed:0.314 green:0.137 blue:0.098 alpha:1];
    screen1.ctaButton.backgroundColor = [UIColor colorWithRed:0.922 green:0.745 blue:0.608 alpha:1];
    screen1.ctaButton.useRoundCorners = NO;
    screen1.ctaButton.fontSize = 20;
    screen1.ctaButton.text = @"Sign up";
    screen1.ctaButton2.show = YES;
    screen1.ctaButton2.fontName = @"Menlo-Bold";
    screen1.ctaButton2.textColor = [UIColor colorWithRed:0.314 green:0.137 blue:0.098 alpha:1];
    screen1.ctaButton2.backgroundColor = [UIColor colorWithRed:0.906 green:0.659 blue:0.467 alpha:1];
    screen1.ctaButton2.fontSize = 20;
    screen1.ctaButton2.text = @"Sign in";
    screen1.backgroundColor = [UIColor colorWithRed:0.314 green:0.137 blue:0.098 alpha:1];
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}
-(NSArray*) template11
{
    ECOnBoardingScreenTemplate11* screen1 = [[ECOnBoardingScreenTemplate11 alloc]init];
    screen1.label.textColor = [UIColor colorWithRed:0.490 green:0.631 blue:0.443 alpha:1];
    screen1.label.fontName = @"Menlo-Bold";
    screen1.label.fontSize = 30;
    screen1.label2.textColor = [UIColor colorWithRed:0.490 green:0.631 blue:0.443 alpha:1];
    screen1.label2.fontName = @"Menlo-Bold";
    screen1.label2.fontSize = 20;
    screen1.label2.textOffsetY = 150;
    screen1.ctaButton.show = YES;
    screen1.ctaButton.fontName = @"Menlo-Bold";
    screen1.ctaButton.textColor = [UIColor colorWithRed:0.314 green:0.137 blue:0.098 alpha:1];
    screen1.ctaButton.backgroundColor = [UIColor colorWithRed:0.922 green:0.745 blue:0.608 alpha:1];
    screen1.ctaButton.useRoundCorners = NO;
    screen1.ctaButton.fontSize = 20;
    screen1.ctaButton.text = @"Sign up";
    screen1.ctaButton2.show = YES;
    screen1.ctaButton2.fontName = @"Menlo-Bold";
    screen1.ctaButton2.textColor = [UIColor colorWithRed:0.314 green:0.137 blue:0.098 alpha:1];
    screen1.ctaButton2.backgroundColor = [UIColor colorWithRed:0.906 green:0.659 blue:0.467 alpha:1];
    screen1.ctaButton2.fontSize = 20;
    screen1.ctaButton2.text = @"Sign in";
    [screen1.image setImageNameForIPhone4:@"" forIPhone5:@"" forIPhone6:@"" forIPhone6Plus:@""];
    screen1.ctaButton.actionObject = [ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];
    return @[screen1];
}@end
