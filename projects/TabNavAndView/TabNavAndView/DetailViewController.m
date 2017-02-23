//
//  DetailViewController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DetailViewController.h"
#import "PokemonDataSingleton.h"

@interface DetailViewController ()

@property UIImageView *bigImage;
@property UIButton *closeButton;
@property PokemonDataSingleton *sharedData;
@property BOOL isFavorited;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *favoriteBtn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sharedData = [PokemonDataSingleton sharedData];
    CGSize frameSize = self.view.frame.size;
    
    if ([self.sharedData.favoritePokemon containsObject:[NSNumber numberWithInteger:self.pokemonIndex]]) {
        self.isFavorited = YES;
    }
    
    [self updateFavorite];
    
    self.title = self.sharedData.pokemonName[self.pokemonIndex];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(frameSize.width * 1 / 6, 120, frameSize.width * 2 / 3, frameSize.width * 2 / 3)];
    [self.bigImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/%ld.png",self.pokemonIndex + 1]]];
    [self.view addSubview:self.bigImage];
    
    self.descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(45, (self.bigImage.frame.origin.y + frameSize.width * 2 / 3 + 50), frameSize.width -90, frameSize.height - (self.bigImage.frame.origin.y + frameSize.width * 2 / 3 + 50))];
    self.descriptionView.text = self.sharedData.pokemonDescription[self.pokemonIndex];
    self.descriptionView.textColor = [UIColor blackColor];
    [self.descriptionView setFont:[UIFont systemFontOfSize:20  weight:0.0]];
    self.descriptionView.editable = NO;
    self.descriptionView.scrollEnabled = YES;
    
    
    [self.view addSubview:self.descriptionView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)closeButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)favoriteRegister:(id)sender {
    

    NSNumber *indexNumber = [NSNumber numberWithInteger:self.pokemonIndex];
    if ([self.sharedData.favoritePokemon containsObject:indexNumber]) {
        [self.sharedData.favoritePokemon removeObject:indexNumber];
        [self setIsFavorited:NO];
    } else {
        [self.sharedData.favoritePokemon addObject:indexNumber];
        [self setIsFavorited:YES];
    }
    
    [self updateFavorite];
    
}

- (void)updateFavorite {
    if (self.isFavorited) {
        [self.favoriteBtn setImage:[UIImage imageNamed:@"star_selected"]];
    } else {
        [self.favoriteBtn setImage:[UIImage imageNamed:@"star"]];
    }
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    if ([segue.identifier isEqualToString:@"webViewSegue"]) {
//        PokeWikiWebViewController *webView = segue.destinationViewController;
//        NSString *urlString = @"http://ko.pokemon.wikia.com/wiki/이상해씨/";
//        
//        webView.urlString = urlString;
//        
//    }
//    
//}

@end
