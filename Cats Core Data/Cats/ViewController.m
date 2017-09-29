//
//  ViewController.m
//  Cats
//
//  Created by Paul on 2017-09-25.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "ViewController.h"
#import "FlickrAPI.h"
#import "CatPhotoCollectionViewCell.h"
#import "DetailedViewController.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) NSArray <FlickrPhoto*> *catPhotoArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self networkRequest:@"wolves" complete:^(NSArray<FlickrPhoto *> *results) {
        self.catPhotoArray = results;
        
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
        
    }];
    
}

//allows user to add in a string and this method will query
-(NSURLComponents*) userSearch:(NSString *)searchString {
    
    NSURLComponents *components = [[NSURLComponents alloc] init];
    
    components.scheme = @"https";
    components.host = @"api.flickr.com";
    components.path = @"/services/rest/";
    
    
    //this query component can seperate the entire key and value of the entire thing.
    components.query = @"method=flickr.photos.search&api_key=c7049e84540c2a5084fedc19025bb099&tags=userinput &has_geo=1&extras=geo&format=json&nojsoncallback=1";
    //create a new mutable array.
    NSMutableArray *queryItems = [components.queryItems mutableCopy];
    
    //searches for the queryitems "tag" and take in the user's search parameter
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"tags" value:searchString];
    [queryItems addObject:searchItem];
    components.queryItems = [queryItems copy];
    return components;
    
}

-(void)networkRequest:(NSString*)query complete:(void (^)(NSArray<FlickrPhoto*>* results))complete{
    //    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:[self createNewUrl]];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURL *url = [self userSearch:query].URL;
    //convert url to nsurlrequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request  completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        //happening inside this block of code.
        // this is where we get the results
        if (error != nil) {
            NSLog(@"error in url session: %@", error.localizedDescription);
            abort(); // TODO: display an alert or something
        }
        // TODO: check the response code we got; if it's >= 300 something is wrong
        // remember to check status code, we need to cast response to a NSHTTPURLResponse
        if (((NSHTTPURLResponse*)response).statusCode >= 300) {
            NSLog(@"Unexpected http response: %@", response);
            abort(); // TODO: display an alert or something
        }
        
        NSError *err = nil;
        NSDictionary* result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
        if (err != nil) {
            NSLog(@"Something went wrong parsing JSON: %@", err.localizedDescription);
            abort();
        }
        //short way of doing [[NSMutableArray alloc]init];
        NSMutableArray<FlickrPhoto*> *photosArray = [@[] mutableCopy];
        
        //creates an empty array where i am accessing the dictionary-array and then saving its array to my mutable array.
        for (NSDictionary *photoInfo in result[@"photos"][@"photo"]) {
            //use the instance method of flickrPhoto to save the item into the method.
            [photosArray addObject:[[FlickrPhoto alloc]initWithInfo:photoInfo]];
        }
        
        //save the mutable array of photos to the input of "complete" block.
        complete(photosArray);
        
        
    }];
    
    [dataTask resume];
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //catPhotoArray is set to a json-array
    return self.catPhotoArray.count;

}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CatPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    //we set our array equal to the array of the json even tho it was wrapped around a dictionary therefore we dont need to need access sections then items.
    [cell setFlickrPhoto:self.catPhotoArray[indexPath.item]]; //this line is called everytime user scrolls down to new screem and the cellclass is continuously setting pictures.
    

    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"dvcSegue"]){
        
        DetailedViewController *controller = [segue destinationViewController];
        //taking the cell information from cellforitematindexpath which contains the cat image already and we are calling the catphotocollectiionviewcell to access the property to set it to each other.
        CatPhotoCollectionViewCell *cell = (CatPhotoCollectionViewCell *)sender;
        
        
        controller.flickrPhoto = cell.flickrPhoto;
        

    }
    
    
}

    



@end
