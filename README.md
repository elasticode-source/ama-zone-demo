# ama-zone-demo
Elasticode onBoarding example
( Graphic assets in this repository is relevant only for iPhone6 )


## Synopsis

Elasticode on boarding example allows you to learn more about how you can personalize your on boarding experience, when it comes to what type of experinces to build and how to address different segments.
This repository includes the relevant project/app upon we have built this demo
It includes 4 screens that are part of the on boarding, where we as developers are trying to figure out what is the best atrtegy to work around this ( with these assets ) 

![alt 1stScreen](http://elasticode-demo.s3.amazonaws.com/amazone.co/1m.jpg)
![alt 2ndScreen](http://elasticode-demo.s3.amazonaws.com/amazone.co/2m.jpg)
![alt 3rdScreen](http://elasticode-demo.s3.amazonaws.com/amazone.co/3m.jpg)
![alt 4thScreen](http://elasticode-demo.s3.amazonaws.com/amazone.co/4m.jpg)


## Code Example
Setting up the enviernemnt is easy, you can see it in our 90 seconds tutorial here 
https://vimeo.com/elasticode/elasticode-sdk-download

Don't forget to sign up to our service, so you can start hacking with our SDK ( it's free ... ) 
https://mc.elasticode.com/signUp.php

Connecting the app key to the SDK is VIA the appDelegate : 
```objective-c
// setting up the property 
@property (strong, nonatomic) ElasticodeOnBoarding* ecob;

// and on the .m file :
self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
self.ecob = [ElasticodeOnBoarding new];
[self.ecob startOnBoradingOnWindow:self.window withElasticodeKey:@"<#app key#>" viewControllerGetterBlock:^UIViewController *{
        UIStoryboard *mainStoryboard = 
          [UIStoryboard storyboardWithName:@"<# Name of storyboard #>"
          bundle: nil];
          UIViewController *mainViewController = (UIViewController*)                
[mainStoryboard instantiateViewControllerWithIdentifier: 
         @"<# storyboard ID #>"];
        return mainViewController;
    }]; 
```



## Motivation

ama-zone.co is an app that enables you to learn the 
1. How to use Elasticode on boarding 
2. How to intigrate the SDK 
3. How to manage and control your experiences VIA the dashboard 
4. How to corrolate relevant experinces to relevant segments ( audiences ) 

## Installation

Using our SDK,  here is a short Video 
https://vimeo.com/elasticode/elasticode-sdk-download


