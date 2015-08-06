//
//  ASObject.m
//  UITableViewDynamicCellsHomework
//
//

#import "ASObject.h"

@implementation ASObject


- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        self.name = [self randomName];
        self.averageMark = [self randomMark];
        
        if (self.averageMark < 3.0) {
            self.color = [UIColor redColor];
        } else if (self.averageMark <= 4 && self.averageMark > 3){
            self.color = [UIColor colorWithRed:0 green:0.6 blue:0.7 alpha:1];
        } else {
            self.color = [UIColor colorWithRed:0 green:0.7 blue:0 alpha:1];
        }
    }
    
    return self;
}


-(UIColor*) randomColor {
    CGFloat r = (float)(arc4random()%256) / 255.f;
    CGFloat g = (float)(arc4random()%256) / 255.f;
    CGFloat b = (float)(arc4random()%256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    
}

-(NSString*) randomName {
    
    NSString* namesString = @"Александр Александра Алексей Алена Алина Алла Анастасия Анатолий Ангелина Андрей Анисья Анна Антон Антонина Анфим Анфиса Аполлинария Арина Аркадий Арсений Артем Артемий Вадим Валентин Валентина Валерий Валерия Варвара Василий Василиса Венера Вера Вета Виктор Викторина Виктория Вилена Виолетта Виталий Виталина Влада Владана Владимир Владислав Владислава Владлен Влас Всеволод Вячеслав Макария Максим Маргарита Марина Мария Марк Мартин Марфа Матвей Мила Милада Милана Милена Милица Мира Мирослав Мирослава Мирра Михаил Сабина Савва Савелий Светлана Святослав Севастьян Семен Серафима Сергей Сидор Соня Софья Спартак Станислав Стелла Степан";
    
    NSArray* namesArray = [namesString componentsSeparatedByString:@" "];
    
    NSInteger randomNumber = arc4random() % [namesArray count];

    NSString* name = [NSString stringWithFormat:@"%@", [namesArray objectAtIndex:randomNumber]];
    
    return name;

 }

-(CGFloat) randomMark {
    float randomNum = (float)(arc4random()%5) + (float)((arc4random()%256) / 255.f);
    return randomNum;
}




@end
