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

-( void ) test_root_picker_view_should_have_10_rows
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];

  UIPickerView* rootPickerView = [dcp valueForKey:@"rootNotePickerView"];
  STAssertNotNil( rootPickerView, @"" );
  
  STAssertTrue( [dcp pickerView: rootPickerView numberOfRowsInComponent:0] == 12, @"" );
}

-( void ) test_root_picker_view_should_return_all_notes_chromatic_for_rows
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];
  
  UIPickerView* rootPickerView = [dcp valueForKey:@"rootNotePickerView"];
  STAssertNotNil( rootPickerView, @"" );

  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:0 forComponent: 0] isEqualToString:@"A"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:1 forComponent: 0] isEqualToString:@"A# - Bb"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:2 forComponent: 0] isEqualToString:@"B"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:3 forComponent: 0] isEqualToString:@"C"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:4 forComponent: 0] isEqualToString:@"C# - Db"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:5 forComponent: 0] isEqualToString:@"D"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:6 forComponent: 0] isEqualToString:@"D# - Eb"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:7 forComponent: 0] isEqualToString:@"E"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:8 forComponent: 0] isEqualToString:@"F"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:9 forComponent: 0] isEqualToString:@"F# - Gb"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:10 forComponent: 0] isEqualToString:@"G"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:11 forComponent: 0] isEqualToString:@"G# - Ab"], @"");
}

#pragma mark - Auxilary methods
-( void ) pingView:(UIView* ) view
{
  view.alpha = 1.0f;
}

@end
