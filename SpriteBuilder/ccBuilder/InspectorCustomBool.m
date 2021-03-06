/*
 * CocosBuilder: http://www.cocosbuilder.com
 *
 * Copyright (c) 2012 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "InspectorCustomBool.h"
#import "CCNode+NodeInfo.h"
#import "AppDelegate.h"
#import "CustomPropSetting.h"

@implementation InspectorCustomBool

- (IBAction)checkBoxAction:(NSButtonCell *)sender {
    [[AppDelegate appDelegate] saveUndoStateWillChangeProperty:propertyName];
    [selection setCustomPropertyNamed:propertyName value:[NSString stringWithFormat:@"%d",(int)sender.state]];
    [self updateFont];
}

-(BOOL) value {
    [self updateFont];
    return [[selection customPropertyNamed:propertyName] boolValue];
}

-(void) updateFont {
    bool defaultValue = NO;
    for (CustomPropSetting *setting in selection.customProperties) {
        if ([setting.name isEqualToString:propertyName]) {
            if ([setting.value isEqualToString:setting.defaultValue]) {
                defaultValue = YES;
                break;
            }
        }
    }
    if (!defaultValue) {
        propName.font = [NSFont boldSystemFontOfSize:propName.font.pointSize];
    } else {
        propName.font = [NSFont systemFontOfSize:propName.font.pointSize];
    }
}

@end
