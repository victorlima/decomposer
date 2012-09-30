//
//  DCCifraPickerViewControllerTests.m
//  Decomposer
//
//  Created by Victor Lima on 9/30/12.
//  Copyright (c) 2012 vlima. All rights reserved.
//

#import "DCCifraPickerViewControllerTests.h"

@implementation DCCifraPickerViewControllerTests

-( void ) test_should_adhere_to_uipickerviewdelegate_and_datasource
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  
  STAssertTrue( [dcp conformsToProtocol:@protocol(UIPickerViewDelegate)], @"" );
  STAssertTrue( [dcp conformsToProtocol:@protocol(UIPickerViewDataSource)], @"" );
}

-( void ) test_all_picker_views_should_have_one_component
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];

  STAssertTrue([dcp numberOfComponentsInPickerView: nil] == 1, @"" );
}

-( void ) test_root_picker_view_should_have_21_rows
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];

  UIPickerView* rootPickerView = [dcp valueForKey:@"rootNotePickerView"];
  STAssertNotNil( rootPickerView, @"" );
  
  STAssertTrue( [dcp pickerView: rootPickerView numberOfRowsInComponent:0] == 21, @"" );
}

#pragma mark - Auxilary methods
-( void ) pingView:(UIView* ) view
{
  view.alpha = 1.0f;
}

@end
