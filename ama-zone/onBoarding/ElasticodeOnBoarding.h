//
//  ElasticodeOnBoarding.h
//  Onboard
//
//  Created by Tomer on 28/1/15.
//  Copyright (c) 2015 Elasticode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ElasticodeOnBoarding : NSObject

@property (strong, nonatomic) UIWindow *window;

-(void) startOnBoradingOnWindow:(UIWindow*) window
              withElasticodeKey:(NSString*) elasticodeKey
      viewControllerGetterBlock:(UIViewController* (^)(void))getAppRootVCBlock;
@end
