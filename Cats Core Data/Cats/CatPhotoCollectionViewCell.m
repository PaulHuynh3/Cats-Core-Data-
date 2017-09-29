//
//  CatPhotoCollectionViewCell.m
//  Cats
//
//  Created by Paul on 2017-09-25.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "CatPhotoCollectionViewCell.h"
#import "FlickrPhoto.h"
#import "FlickrAPI.h"

@interface CatPhotoCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *catNameLabel;


@end

@implementation CatPhotoCollectionViewCell

-(void)setFlickrPhoto:(FlickrPhoto *)flickrPhoto{
    _flickrPhoto = flickrPhoto;

    //downloads and loads the photo everytime i scroll down
    [FlickrAPI loadImageForPhoto:flickrPhoto complete:^(UIImage *result) {
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            
    //this sets the flickrphoto.image = result so that in the future i can do stuff with it eles my flickrphoto image will be nil.
    //everytime the collectionview indexpath is called(as i scroll down) it will assign it to that var.
    
            flickrPhoto.image = result;
            self.imageView.image = result;
            //i can retrieve this information because json provides the title but not images
            self.catNameLabel.text = flickrPhoto.title;
        }];
    }];

    
}
    



@end
