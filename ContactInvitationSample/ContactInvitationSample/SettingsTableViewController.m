//
//  SettingsTableViewController.m
//  ContactInvitationSample
//
//  Created by Wayne Burkett on 8/30/18.
//  Copyright © 2018 ForeSee. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "TextFieldTableViewCell.h"
#import <EXPCore/EXPCore.h>
#import <EXPPredictive/EXPPredictive.h>

typedef enum TableSections : NSUInteger {
    EmailEntrySection = 0,
    PhoneNumberEntrySection,
    PreferredTypeSelectionSection,
    ResetStateSection,
    SectionCount
} TableSections;

NSString * const PreferredContactTypeKey = @"PreferredContactTypeKey";

@interface SettingsTableViewController ()

@property (nonatomic, strong) NSUserDefaults *storage;
@property (nonatomic, getter=isDirty) BOOL dirty;

@end

@implementation SettingsTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.storage = [NSUserDefaults standardUserDefaults];
        self.dirty = NO;
    }
    return self;
}

#pragma mark - Preferred type

- (EXPContactType)preferredContactType {
    NSNumber *preferredType = [self.storage objectForKey:PreferredContactTypeKey];
    if (preferredType) {
        return [preferredType unsignedIntegerValue];
    }
    return kEXPPhoneNumber;
}

- (void)setPreferredContactType:(EXPContactType)preferredContactType {
    [EXPPredictive setPreferredContactType:preferredContactType];
    [self.storage setInteger:preferredContactType forKey:PreferredContactTypeKey];
    [self.storage synchronize];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return SectionCount;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case EmailEntrySection:
            return @"E-mail";
        case PhoneNumberEntrySection:
            return @"Phone Number";
        case PreferredTypeSelectionSection:
            return @"Preferred Contact Type";
    }
    return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section == ResetStateSection) {
        return @"This will clear stored contact details and reset the SDK to its initial state";
    }
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section <= PhoneNumberEntrySection) {
        return 1;
    } else if (section == PreferredTypeSelectionSection) {
        return 2;
    } else if (section == ResetStateSection) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = @"";
    UITableViewCell *cell;
    switch (indexPath.section) {
        case EmailEntrySection:
            return [self createEmailEntryCellForTableView:tableView];
        case PhoneNumberEntrySection:
            return [self createPhoneNumberEntryCellForTableView:tableView];
        case PreferredTypeSelectionSection:
            switch (indexPath.row) {
                case kEXPEmail:
                    str = @"E-mail";
                    break;
                case kEXPPhoneNumber:
                    str = @"Phone Number";
                    break;
                default:
                    str = @"Unknown";
                    break;
            }
            cell = [self createSimpleCellForTableView:tableView
                                                 text:str
                                             selected:(self.preferredContactType == indexPath.row)];
            break;
        case ResetStateSection:
            cell = [self createSimpleCellForTableView:tableView
                                                 text:@"Reset State"
                                             selected:false];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = [UIColor redColor];
            break;
        default:
            break;
    }
    self.dirty = NO;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == PreferredTypeSelectionSection) {
        [self setPreferredContactType:indexPath.row];
    } else if (indexPath.section == ResetStateSection) {
        [EXPCore resetState];
        [EXPPredictive setInviteHandler:nil];
        [self clearFields];
    }
    [tableView reloadData];
}

#pragma mark - Cells

- (UITableViewCell *)createEmailEntryCellForTableView:(UITableView *)tableView {
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCell"];
    cell.textField.tag = EmailEntrySection;
    cell.textField.placeholder = @"example@verint.com";
    cell.textField.keyboardType = UIKeyboardTypeEmailAddress;
    cell.textField.text = [EXPPredictive contactDetailsForType:kEXPEmail];
    cell.textField.delegate = self;
    return cell;
}

- (UITableViewCell *)createPhoneNumberEntryCellForTableView:(UITableView *)tableView {
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCell"];
    cell.textField.tag = PhoneNumberEntrySection;
    cell.textField.placeholder = @"555-555-5555";
    cell.textField.keyboardType = UIKeyboardTypePhonePad;
    cell.textField.text = [EXPPredictive contactDetailsForType:kEXPPhoneNumber];
    cell.textField.delegate = self;
    return cell;
}

- (UITableViewCell *)createSimpleCellForTableView:(UITableView *)tableView text:(NSString *)text selected:(BOOL)selected {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GenericCell"];
    cell.textLabel.text = text;
    cell.accessoryType = (selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone);
    return cell;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (!self.isDirty) {
        [EXPPredictive setContactDetails:[self trim:textField.text] forType:(textField.tag == EmailEntrySection) ? kEXPEmail : kEXPPhoneNumber];
    }
}

#pragma mark - Util

- (void)clearFields {
    [self.storage removeObjectForKey:PreferredContactTypeKey];
    self.dirty = YES;
}

- (NSString *)trim:(NSString *)str {
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
