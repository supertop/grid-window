//
//  SUPGridWindow.m
//  Castro
//
//  Created by Padraig O Cinneide on 2014-03-24.
//  Copyright (c) 2014 Supertop. All rights reserved.
//

#import "SUPGridWindow.h"
#import "SUPGridView.h"

@interface SUPGridWindow()

@property (nonatomic, strong) SUPGridView *gridView;

@end

@implementation SUPGridWindow

+ (instancetype)sharedGridWindow
{
    static id _sharedClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[[self class] alloc] init];
    });
    return _sharedClient;
}


- (id)init
{
    return [self initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.windowLevel = UIWindowLevelStatusBar+1.0f;
        self.gridView = [[SUPGridView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

        [self addSubview:self.gridView];
        
        self.hidden = NO;
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)toggleHidden
{
    self.hidden = !self.hidden;
}

- (void)setMinorGridSize:(CGSize)gridSize
{
    [self.gridView setMinorGridSize:gridSize];
}

- (void)setMajorGridSize:(CGSize)gridSize
{
    [self.gridView setMajorGridSize:gridSize];
}

- (void)setGridColor:(UIColor *)color
{
    [self.gridView setGridColor:color];
}

@end
