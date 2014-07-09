//
//  JTTAppDelegate.m
//  PriceTrendChart
//
//  Created by julius on 14-7-9.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "JTTAppDelegate.h"
#import "JTTLineChartView.h"

@implementation JTTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    JTTLineChartViewComponent *component = [[JTTLineChartViewComponent alloc]init];
    component.points = [NSArray arrayWithObjects:@"1",@"2.7",@"4.2",@"1",@"3.5",@"0.3",@"4.5",@"1",@"2.7",@"4.2",@"1",@"3.5",@"0.3",@"4.5",@"0",  nil];
    component.colour = PCColorGreen;
    
    JTTLineChartViewComponent *component1 = [[JTTLineChartViewComponent alloc]init];
    component1.points = [NSArray arrayWithObjects:@"4.5",@"4",@"4.2",@"1.3",@"1.5",@"2",@"2.5", @"4.5",@"4",@"4.2",@"1.3",@"1.5",@"2",@"2.5", @"0",nil];
    component1.colour = PCColorYellow;
    
    JTTLineChartViewComponent *component2 = [[JTTLineChartViewComponent alloc]init];
    component2.points = [NSArray arrayWithObjects:@"0.5",@"1",@"1.5",@"1.3",@"1.5",@"5",@"2.5",@"0.5",@"1",@"1.5",@"1.3",@"1.5",@"5",@"2.5", @"0",nil];
    component2.colour = PCColorRed;
    
    
    NSArray *totalDataMax = [NSArray arrayWithObjects:@"4.5",@"4",@"4.2",@"1.3",@"3.5", @"5",@"4.5",@"4.5",@"4",@"4.2",@"1.3",@"3.5", @"5",@"4.5",@"0",nil];
    
    NSMutableArray *components = [[NSMutableArray alloc]init];
    [components addObject:component];
    [components addObject:component1];
    [components addObject:component2];

    
    JTTLineChartView * lineChartView = [[JTTLineChartView alloc]initWithFrame:CGRectMake(0, 100, 320, 300)];
    
    lineChartView.components = components;
    lineChartView.maxDatas = totalDataMax;
    
    
    lineChartView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:lineChartView];
    
    self.window.backgroundColor = PCColorDefault;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
