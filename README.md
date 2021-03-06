# ama-zone-demo
Elasticode onBoarding example
(Graphic assets in this repository is relevant only for iPhone6)


## Synopsis
Elasticode on boarding example allows you to learn more,
about how you can personalize your on boarding experience,  
when it comes to what type of experiences to build and how to address different segments.  
This repository includes the relevant project/app upon we have built this demo.  
It includes 4 screens that are part of the on boarding, where we as developers are trying to figure out what is the best strategy to work around this (with these assets)  
![preview-gif](http://elasticode-demo.s3.amazonaws.com/amazone.co/ama-zone-preview.gif)

## Code Example
Setting up the environment is easy, you can see it in our 90 seconds tutorial 
[here](https://vimeo.com/elasticode/elasticode-sdk-download)

Don't forget to sign up to our service, so you can start hacking with our SDK (it's free ...) 
https://mc.elasticode.com/signUp.php

Connecting the app key to the SDK is VIA the appDelegate : 
```objective-c
// setting up the property 
@property (strong, nonatomic) ElasticodeOnBoarding* ecob;

// and on the .m file :
self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
self.ecob = [ElasticodeOnBoarding new];
[self.ecob startOnBoradingOnWindow:self.window withElasticodeKey:@"<#app key#>" 
viewControllerGetterBlock:^UIViewController *{
        UIStoryboard *mainStoryboard = 
          [UIStoryboard storyboardWithName:@"<# Name of storyboard #>"
          bundle: nil];
          UIViewController *mainViewController = (UIViewController*)                
[mainStoryboard instantiateViewControllerWithIdentifier: 
         @"<# storyboard ID #>"];
        return mainViewController;
}];
```

Elasticode enables you to build personalized based experiences for you on boarding,  
for some specific scenarios we need to deal with the case of providing a default experience,  
once that if if there is no connectivity to sync or for any other reason would still popup and appear to the end user, as such we need to provide an **Experience**.

You can find all the template types and their corosponding structure and code here:
http://docs.elasticode.com/v1.0/docs/ob-templates

Here is an example of such a code block that would display one screen:
```objective-c

ECOnBoardingScreenTemplate5* screen1 = [[ECOnBoardingScreenTemplate5 alloc]init];
screen1.label.text = @"Be The Crowd!";
screen1.label.textColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1];
screen1.label.fontName = @"Helvetica-Light";
screen1.label.fontSize = 19;
screen1.ctaButton.show = YES;
screen1.ctaButton.type = CTAButtonType_withText_facebook;
screen1.ctaButton2.show = YES;
screen1.ctaButton2.type = CTAButtonType_withText_google;
screen1.ctaButton3.show = YES;
screen1.ctaButton3.type = CTAButtonType_withText_linkedin;

// we need to add the  resources to all 4 sizes 
// As a default, you can use the same size and we would adjsust it
// (ratio might be a bit off though...)

[screen1.image setImageNameForIPhone4:@"" forIPhone5:@"" forIPhone6:@"" forIPhone6Plus:@""];

// Action is important, it's the actual action that happens when someone clicks on the call-to-action button

screen1.ctaButton.actionObject = 
[ECOnBoardingAction createWithName:@"Continue" action:^{ [self handleOnboardingCompletion]; }];

```

## Templates

We have two types of templates:

**Templates numbered 1-3** - These templates are configured based on their uniques structure, just as they appear in the images and their display




![alt Templates](http://elasticode-demo.s3.amazonaws.com/amazone.co/templates1.png)

**Templates numbered 4-11** - These 8 templates are 4 specific templates that are branched out into 4 templates that are represented by 4 different structures only they are different in the fact that each of them own two main options 
- Background with an image
- Background with color 


![alt Templates with backgorund](http://elasticode-demo.s3.amazonaws.com/amazone.co/templates2.png)

## Motivation

ama-zone.co is an app that enables you to learn the  
1. How to use Elasticode on boarding  
2. How to integrate the SDK  
3. How to manage and control your experiences VIA the dashboard  
4. How to correlate relevant experiences to relevant segments ( audiences )  

## Installation

Using our SDK,  here is a short Video 
https://vimeo.com/elasticode/elasticode-sdk-download
