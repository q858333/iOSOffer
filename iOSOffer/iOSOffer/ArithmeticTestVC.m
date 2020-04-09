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
    {
        char a[]="hehllo world!";
       char c = findFirstChar(a);
        printf("\n--->%c",c);
    }
}



//第一个出现的无重复字符
char findFirstChar(char* cha)
{
    char result = '\0';
    
    // 定义一个数组 用来存储各个字母出现次数
    int array[256];
    
    // 对数组进行初始化操作
    for (int i=0; i<256; i++) {
        array[i] =0;
    }
    // 定义一个指针 指向当前字符串头部
    char* p = cha;
    // 遍历每个字符
    while (*p != '\0') {
        // 在字母对应存储位置 进行出现次数+1操作
        char temp = *(p++);
        array[temp]++;
    }
    
    // 将P指针重新指向字符串头部
    p = cha;
    // 遍历每个字母的出现次数
    while (*p != '\0') {
        // 遇到第一个出现次数为1的字符，打印结果
        if (array[*p] == 1)
        {
            result = *p;
            break;
        }
        // 反之继续向后遍历
        p++;
    }
    
    return result;
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
