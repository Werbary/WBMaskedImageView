//
//  ViewController.m
//  masked
//
//  Created by Иван Труфанов on 03.10.15.
//  Copyright © 2015 Werbary. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView.originalImage = [UIImage imageNamed:@"original_image.png"];
    self.imageView.maskImage = [UIImage imageNamed:@"mask_image.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
