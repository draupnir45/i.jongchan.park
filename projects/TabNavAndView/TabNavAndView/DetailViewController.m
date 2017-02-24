//
//  DetailViewController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DetailViewController.h"
#import "PokemonData.h"
#import "SettingData.h"

@interface DetailViewController ()

@property UIImageView *bigImage;
@property UIButton *closeButton;
@property PokemonData *sharedData;
@property SettingData *settings;

@property BOOL isFavorited;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *favoriteBtn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sharedData = [PokemonData sharedData];
    self.settings = [SettingData sharedSettings];
    CGSize frameSize = self.view.frame.size;
    
    if ([self.settings.favoritePokemonIndexes containsObject:[NSNumber numberWithInteger:self.pokemonIndex]]) {
        self.isFavorited = YES;
    }
    
    [self updateFavorite];
    
    self.title = self.sharedData.pokemonName[self.pokemonIndex];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(frameSize.width * 1 / 6, 120, frameSize.width * 2 / 3, frameSize.width * 2 / 3)];
    [self.bigImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/%ld.png",self.pokemonIndex + 1]]];
    [self.view addSubview:self.bigImage];
    
    self.descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(15, (self.bigImage.frame.origin.y + frameSize.width * 2 / 3 + 50), frameSize.width -30, frameSize.height - (self.bigImage.frame.origin.y + frameSize.width * 2 / 3 + 50))];
    self.descriptionView.text = self.sharedData.pokemonDescription[self.pokemonIndex];
    self.descriptionView.textColor = [UIColor blackColor];
    [self.descriptionView setFont:[UIFont systemFontOfSize:20  weight:0.0]];
    self.descriptionView.editable = NO;
    self.descriptionView.scrollEnabled = YES;
//    self.descriptionView.layoutManager.delegate = self;
    
    
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
    if ([self.settings.favoritePokemonIndexes containsObject:indexNumber]) {
        [self.settings.favoritePokemonIndexes removeObject:indexNumber];
        [self setIsFavorited:NO];
    } else {
        if ((self.settings.isBattleSixEnabled && [self.settings.favoritePokemonIndexes count]<6) || !self.settings.isBattleSixEnabled) {
                [self.settings.favoritePokemonIndexes addObject:indexNumber];
                [self setIsFavorited:YES];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"6마리가 다 찼습니다!"
                                                                           message:@"즐겨찾기 목록에서 수정하시겠어요?" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                [alert dismissViewControllerAnimated:YES completion:nil];
            }];
            [alert addAction:cancel];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                UINavigationController *settingNav = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingNaviCon"];
                [self presentViewController:settingNav animated:YES completion:^{
                    [settingNav.topViewController performSegueWithIdentifier:@"FavoritePokemonSegue" sender:self];
                
                }];
                [alert dismissViewControllerAnimated:YES completion:nil];
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }

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
