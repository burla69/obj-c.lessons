//
//  ViewController.m
//  UITableViewDynamicCellsHomework
//
//

#import "ViewController.h"
#import "ASObject.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray* storageArray;
@property (strong, nonatomic) NSMutableArray* goodArray;
@property (strong, nonatomic) NSMutableArray* middleArray;
@property (strong, nonatomic) NSMutableArray* badArray;

@end

@implementation ViewController

//================================================================
//Супермен.
//
//14. Средний бал для студентов ставьте рандомно от 2 до 5
//15. После того, как вы сгенерировали 30 студентов вам надо их разбить на группы:
//отличники, хорошисты, троечники и двоечники
//16. Каждая группа это секция с соответствующим названием.
//17. Студенты внутри своих групп должны быть в алфовитном порядке
//18. Отобразите группы студентов с их оченками в таблице.
//================================================================

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    self.goodArray      = [[NSMutableArray alloc] init];
    self.middleArray    = [[NSMutableArray alloc] init];
    self.badArray       = [[NSMutableArray alloc] init];

    
    for (int i = 0; i < 30; i++) {
        
        ASObject* object = [[ASObject alloc]init];
        
        if (object.averageMark < 3) {
            [self.badArray addObject:object];
        } else if (object.averageMark <= 4) {
            [self.middleArray addObject:object];
        } else {
            [self.goodArray addObject:object];
        }
    }
    
    self.storageArray   = [NSMutableArray arrayWithObjects:self.goodArray,self.middleArray, self.badArray, nil];

    [self.goodArray setArray:[self sortArray:self.goodArray]];
    [self.middleArray setArray:[self sortArray:self.middleArray]];
    [self.badArray setArray:[self sortArray:self.badArray]];
    
    NSLog(@"This is change for git testing");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Helping methods

-(NSArray*) sortArray: (NSMutableArray*) arrayForSorting {
    
    NSArray *sortedArray;
    sortedArray = [arrayForSorting sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [(ASObject*)a name];
        NSString *second = [(ASObject*)b name];
        return [first compare:second];
    }];
    
    return sortedArray;
}


#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.storageArray objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray* sectionNames = [NSArray arrayWithObjects:@"Отличники", @"Хорошисты", @"Двоишники", nil];
    
    if ([sectionNames count] == [self.storageArray count]) {
        return [sectionNames objectAtIndex:section];
    }
    
    return  @"Секция";
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* indentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifier];
        
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    cell.textLabel.text = [[[self.storageArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] name];
    
    NSString* tempString = [NSString stringWithFormat:@"Average mark: %f", [[[self.storageArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] averageMark]];
    
    cell.detailTextLabel.text = tempString;
    
    cell.backgroundColor = [[[self.storageArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] color];
    
    return cell;
    
}




@end
