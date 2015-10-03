//
//  WBMaskedImageView.m
//  masked
//
//  Created by Иван Труфанов on 03.10.15.
//  Copyright © 2015 Werbary. All rights reserved.
//

#import "WBMaskedImageView.h"

@implementation WBMaskedImageView

- (void)setOriginalImage:(UIImage *)originalImage {
    _originalImage = originalImage;
    
    [self updateImage];
}
- (void)setMaskImage:(UIImage *)maskImage {
    _maskImage = maskImage;
    
    [self updateImage];
}

- (void) updateImage {
    if (_originalImage && _maskImage) { //All right, make mask
        UIImage *maskedImage = [WBMaskedImageView maskImage:_originalImage withMaskImage:_maskImage];
        self.image = maskedImage;
    } else if (_originalImage) { //Have only original image, show it
        self.image = _originalImage;
    } else if (_maskImage) { //Have only mask, show it
        self.image = _maskImage;
    }
}

#pragma mark - Image processing
+ (UIImage *) maskImage:(UIImage *)image withMaskImage:(UIImage *)maskImage {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGImageRef maskImageRef = [maskImage CGImage];
    
    // create a bitmap graphics context the size of the image
    CGContextRef mainViewContentContext = CGBitmapContextCreate (NULL, maskImage.size.width, maskImage.size.height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
    
    
    if (mainViewContentContext==NULL)
        return NULL;
    
    CGFloat ratio = 0;
    
    ratio = maskImage.size.width/ image.size.width;
    
    if(ratio * image.size.height < maskImage.size.height) {
        ratio = maskImage.size.height/ image.size.height;
    }
    
    CGRect rect1  = {{0, 0}, {maskImage.size.width, maskImage.size.height}};
    CGRect rect2  = {{-((image.size.width*ratio)-maskImage.size.width)/2 , -((image.size.height*ratio)-maskImage.size.height)/2}, {image.size.width*ratio, image.size.height*ratio}};
    
    
    CGContextClipToMask(mainViewContentContext, rect1, maskImageRef);
    CGContextDrawImage(mainViewContentContext, rect2, image.CGImage);
    
    
    // Create CGImageRef of the main view bitmap content, and then
    // release that bitmap context
    CGImageRef newImage = CGBitmapContextCreateImage(mainViewContentContext);
    CGContextRelease(mainViewContentContext);
    
    UIImage *theImage = [UIImage imageWithCGImage:newImage];
    
    CGImageRelease(newImage);
    
    // return the image
    return theImage;
}
@end
