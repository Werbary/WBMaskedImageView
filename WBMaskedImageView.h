//
//  WBMaskedImageView.h
//  masked
//
//  Created by Иван Труфанов on 03.10.15.
//  Copyright © 2015 Werbary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBMaskedImageView : UIImageView
@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, strong) UIImage *maskImage;
@end
