//
//  SplashScreen.m
//  Onboard
//
//  Created by Tomer on 28/1/15.
//  Copyright (c) 2015 Elasticode. All rights reserved.
//

#import "ECSplashScreen.h"
#import "MONActivityIndicatorView.h"

@implementation ECSplashScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // now that the view has loaded we can generate the content
    [self generateView];
}

-(void) generateView
{
    self.view.backgroundColor = [UIColor blueColor];
    NSString* imgName = [self splashImageName];
    UIImage* img = [UIImage imageNamed:imgName];
    UIImageView* imgV = [[UIImageView alloc] initWithFrame:self.view.frame];
    imgV.image = img;
    [self.view addSubview:imgV];

    MONActivityIndicatorView *indicatorView = [[MONActivityIndicatorView alloc] init];
    indicatorView.delegate = self;
    indicatorView.numberOfCircles = 5   ;
    indicatorView.radius = 20;
    indicatorView.internalSpacing = 3;
    
    CGPoint centerPoint = self.view.center;
    centerPoint.x -= (indicatorView.numberOfCircles * (indicatorView.radius + indicatorView.internalSpacing));
    indicatorView.center = centerPoint;
    [self.view addSubview:indicatorView];
    [indicatorView startAnimating];
}

- (NSString *)splashImageName{
    CGSize viewSize = self.view.bounds.size;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [@"Portrait" isEqualToString:dict[@"UILaunchImageOrientation"]])
            return dict[@"UILaunchImageName"];
    }
    return nil;
}

- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView
      circleBackgroundColorAtIndex:(NSUInteger)index{
    UIColor* circleColor = [UIColor lightGrayColor];
    switch (index) {
        case 0:
            circleColor = [UIColor whiteColor];
            break;
        case 1:
            circleColor = [UIColor whiteColor];
            break;
        case 2:
            circleColor = [UIColor whiteColor];
            break;
        case 3:
            circleColor = [UIColor whiteColor];
            break;
        case 4:
            circleColor = [UIColor whiteColor];
            break;

            
        default:
            break;
    }
    return circleColor;
}
@end
