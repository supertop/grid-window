//
//  SUPGridWindow.h
//  Castro
//
//  Created by Padraig O Cinneide on 2014-03-24.
//  Copyright (c) 2014 Supertop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUPGridWindow : UIWindow

+ (instancetype)sharedGridWindow;

- (void)toggleHidden;

- (void)setMajorGridSize:(CGSize)gridSize;
- (void)setMinorGridSize:(CGSize)gridSize;
- (void)setGridColor:(UIColor *)gridColor;

@end
