//
//  ArithmeticTestVC.m
//  iOSOffer
//
//  Created by dengbinOld on 2020/4/9.
//  Copyright © 2020 dengsir. All rights reserved.
//

#import "ArithmeticTestVC.h"

@interface ArithmeticTestVC ()

@end

@implementation ArithmeticTestVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    {
        char a[]="hello world!";
        charReverse(a);
    }
}
//字符串反转
void charReverse (char *cha) {
    // 定义头部指针
    char *begin = cha;
    // 定义尾部指针
    char *end = cha + strlen(cha) -1;
    
    
    while (begin < end) {
        
        char temp = *begin;
        *(begin) = *end;
        *(end) = temp;
        begin++;
        end--;
    }
    
    printf("%s\n",cha);
    while(*cha != '\0'){
    　printf("%c ",*cha++);
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
