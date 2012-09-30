//
//  DCCifraPickerViewController.m
//  Decomposer
//
//  Created by Victor Lima on 9/30/12.
//  Copyright (c) 2012 vlima. All rights reserved.
//

#import "DCCifraPickerViewController.h"

@interface DCCifraPickerViewController () {
  IBOutlet UIPickerView* rootNotePickerView;
  IBOutlet UIPickerView* majorMinorPickerView;
  IBOutlet UIPickerView* otherPickerView;
}


@end

@implementation DCCifraPickerViewController

+( DCCifraPickerViewController* ) cifraPickerViewController
{
  return [[DCCifraPickerViewController alloc] initWithNibName:@"DCCifraPickerViewController.xib" bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
