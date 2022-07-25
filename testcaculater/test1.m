//
//  test1.m
//  testcaculater
//
//  Created by tujia on 2022/5/18.
//

#import "test1.h"
#import "testcaculater-Swift.h"

@implementation test1

-(instancetype)init
{
    if (self = [super init]) {
        
       // [self test2];
//        NSMutableArray <NSString *>* test = [[NSMutableArray alloc]init];
//        [test addObject:@"1"];
//        [test addObject:@"2"];
//        for (NSInteger i = 0; i<test.count; i++) {
//            
//            [test addObject:[NSString stringWithFormat:@"%ld",i]];
//            NSLog(@"%@",test);
//        }
//        NSLog(@"%@",@"begin");
//        NSString * result = [a longestPalindrome:@"civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"];
//       // NSString * result = [a longestPalindrome2:@"abcbbsabba"];
//        NSLog(@"%@",result);
//        [a findMedianSortedArrays2:@[@(1),@(3),@(6),@(10),@(11)] :@[@(2),@(9),@(12),@(19),@(22),@(29)]];
        //[a zsortWithS:@"asifldksfkljd" row:3];
         //[a letterCombinations1:@"56"];//[a ispalindromeWithX:-2147483647];
        //[a removeDuplicates:@[@1,@1,@2,@2,@5]];
//        Solution * a = [[Solution alloc]init:0];//[[Solution alloc]init];
//        [a test];
        SolutionTwo * a = [[SolutionTwo alloc]initWithCount:2];
        [a test];
        //[SolutionTwo alloc]in
       // objc_msgSend()
//        //NSLog(@"%d",resu);
//        NSString * testP = @"10";
//        NSLog(@"111111%p",testP);
//        [self test5:testP];
//        NSLog(@"%@",testP);
//        NSMutableArray * ar = [NSMutableArray arrayWithArray:@[@7,@5,@2,@9,@4,@1]];
//       // [self sortWithList:ar left:0 right:5];
//       NSNumber * result = [self sortWithList:ar left:0 right:5 first:2];
//        NSLog(@"%@",ar);
    }
    return self;
}

-(void)test5:(NSString * )a{
    NSLog(@"22222%p",a);
    a=@"er";
    NSLog(@"33333%p",a);
}


-(void)test2
{
    //二分查找
    //找出最后一个等于5的元素的下标
    NSArray <NSNumber *> * arr = @[@(1),@(2),@(3),@(5),@(5),@(5),@(8),@(9),@(20)];
    int l = -1;
    int m = (int)arr.count;
    
    while (l+1 != m) {
        NSNumber * x = arr[(l+m)/2];
        if ([x integerValue] > 5) {
            m =(l+m)/2;
        }else{
            l = (l+m)/2;
        }
    }
    NSLog(@"%d",l);
    
}

-(NSNumber *)sortWithList:(NSMutableArray <NSNumber *>*)list left:(NSInteger)left right:(NSInteger)right first:(NSInteger)first
{
  
    if (left>= right) {
        return list[left];
    }
    NSInteger leftIndex = left;
    NSInteger rightIndex = right;
    
    NSNumber * num = list[leftIndex];
    while (leftIndex < rightIndex) {
        
        while (leftIndex<rightIndex && [list[rightIndex] integerValue] >= [num integerValue]) {
            rightIndex = rightIndex-1;
        }
      //  if (leftIndex < rightIndex) {
            list[leftIndex] = list[rightIndex];
        //}
        
        
        while (leftIndex<rightIndex && [list[leftIndex] integerValue] <= [num integerValue]) {
            leftIndex = leftIndex + 1 ;
        }
     //   if (leftIndex<rightIndex) {
            list[rightIndex] = list[leftIndex];
       // }
        
    }
    
   // if (leftIndex>=rightIndex) {
        list[leftIndex] = num;
    //}
    if(leftIndex == first){
        return list[leftIndex];
    }
    if (left > first) {
        return [self sortWithList:list left:left right:rightIndex first:first];//[self sortWithList:list left:left right:rightIndex-1];;
    }else{
        return [self sortWithList:list left:rightIndex+1 right:right first:first];
       // [self sortWithList:list left:rightIndex +1 right:right];
    }
    
    
    
    
}


-(void)test1
{
    NSArray * arr = @[@(1),@(4),@(3),@(9),@(2)];
    int value = 10;
    for (int i = 0; i < arr.count - 1; i++) {
        for (int j = i+1; j<arr.count; j++) {
            if ([arr[i] integerValue] + [arr[j] integerValue] == value) {
                NSLog(@"%d-%d",i,j);
            }
        }
    }
    
    NSMutableArray * arr2 = [NSMutableArray arrayWithCapacity:2];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    for (int i = 0; i<arr.count; i++) {
        if ([dic.allKeys containsObject:arr[i]]) {
            arr2[0] = @(i);
            arr2[1] = [dic objectForKey:arr
                       [i]];
            NSLog(@"%@",arr2);
            break;
        }
        [dic setObject:@(i) forKey:@(value - [arr[i] integerValue])];
    }
}

-(void)test3{
    NSString * str = @"abcabcuiebbplmnosa";
    NSMutableArray * arr = [NSMutableArray array];
    int index = 0;
    int targetindex = 0;
    
    for (int i = 0;i< str.length;i++) {
        if (![arr containsObject:[NSString stringWithFormat:@"%c",[str characterAtIndex:i]]]) {
            index++;
            [arr addObject:[NSString stringWithFormat:@"%c",[str characterAtIndex:i]]];
            if (index > targetindex) {
                targetindex = index;
            }
            //index = 0;
        }else{
            
            NSUInteger currentindex = [arr indexOfObject:[NSString stringWithFormat:@"%c",[str characterAtIndex:i]]];
            //[arr rem];
            [arr addObject:[NSString stringWithFormat:@"%c",[str characterAtIndex:i]]];
            [arr removeObjectsInRange:NSMakeRange(0, currentindex + 1)];
            
            index = (int)arr.count;
            //[arr addObject:[NSString stringWithFormat:@"%c",[str characterAtIndex:i]]];
        }
    }
    NSLog(@"%d",targetindex);
    NSString * aa = @"dede";
    char a = [aa characterAtIndex:3];
}

-(void)insersort
{
    NSArray * data = @[@(1),@(5),@(3),@(10),@(2)];
    NSMutableArray * aa = [[NSMutableArray alloc]initWithArray:data];
    
//    for (int i = ; <#condition#>; <#increment#>) {
//        <#statements#>
//    }
    
    
}

@end
