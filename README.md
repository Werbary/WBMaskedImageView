# WBMaskedImageView
Easily add mask to any image in image view

# How to use
1. Initialize image view (programmatically or in storyboard)
2. Set original image
3. Set mask image
4. That's done :)

# Example
```obj-c
WBMaskedImageView *imgView = [[WBMaskedImageView alloc] initWithFrame:frame];
imgView.originalImage = [UIImage imageNamed:@"original_image.png"];
imgView.maskImage = [UIImage imageNamed:@"mask_image.png"];
```