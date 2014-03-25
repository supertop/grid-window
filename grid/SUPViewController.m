//
//  SUPViewController.m
//  grid
//
//  Created by Padraig O Cinneide on 2014-03-25.
//  Copyright (c) 2014 Supertop. All rights reserved.
//

#import "SUPViewController.h"
#import "SUPGridWindow.h"

@interface SUPViewController ()

@end

@implementation SUPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleGrid:(id)sender
{
    [[SUPGridWindow sharedGridWindow] toggleHidden];
}

@end
