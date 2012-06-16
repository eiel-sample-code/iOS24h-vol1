//
//  ALViewController.m
//  Demo
//
//  Created by えいる on 12/06/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ALViewController.h"
#import "HRColorPickerViewController.h"
#import "ALPageView.h"

@interface ALViewController ()
{
    NSArray* i_views;
}

@end

@implementation ALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 160, 44);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    
    ALPageView* pageView;
    CGRect frame = CGRectMake(80, 120, 160, 240);
    pageView = [[ALPageView alloc] initWithFrame:frame];
    [self.view addSubview:pageView];
    pageView.delegate = self;
    
    NSMutableArray* views = [NSMutableArray array];
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor blueColor];
    [views addObject:view];
    
    view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];
    [views addObject:view];
    i_views = views;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)tapButton:(id)sender
{
    HRColorPickerViewController* cont;
    cont = [[HRColorPickerViewController alloc] initWithColor:[UIColor whiteColor]
                                                    fullColor:YES
                                                    saveStyle:HCPCSaveStyleSaveAlways];
    [self.navigationController pushViewController:cont animated:YES];
}

#pragma mark - ALPageViewDelegate
- (NSInteger)numberOfPagesWithPageView:(ALPageView *)pageView
{
    return [i_views count];
}

- (UIView*)pageView:(ALPageView*)pageView viewAtIndex:(NSInteger)index
{
    return [i_views objectAtIndex:index];
}

@end
