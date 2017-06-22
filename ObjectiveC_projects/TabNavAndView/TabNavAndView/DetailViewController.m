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
#import "PokeWikiWebViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bigImage;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UILabel *descriptionView;
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
    
    if ([self.settings.favoritePokemonIndexes containsObject:[NSNumber numberWithInteger:self.pokemonIndex]]) { //즐겨찾기 포켓몬인지 확인합니다.
        self.isFavorited = YES;
    }
    
    [self updateFavorite];
    
    self.title = self.sharedData.pokemonName[self.pokemonIndex];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.bigImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/%ld.png",self.pokemonIndex + 1]]];
    [self.descriptionView setText: self.sharedData.pokemonDescription[self.pokemonIndex]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
            
            
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                    UINavigationController *settingNav = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingNaviCon"];
                    [self presentViewController:settingNav animated:YES completion:^{
                        [settingNav.topViewController performSegueWithIdentifier:@"FavoritePokemonSegue" sender:self];
                    
                    }];
                    [alert dismissViewControllerAnimated:YES completion:nil];
            }];
            [alert addAction:ok];
            [alert addAction:cancel];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"webViewSegue"]) {
        UINavigationController *navi = segue.destinationViewController;
        PokeWikiWebViewController *webView = (PokeWikiWebViewController *)navi.topViewController;
        
        NSString *urlString = [NSString stringWithFormat:@"http://ko.pokemon.wikia.com/wiki/%@/",self.title];
        webView.title = [NSString stringWithFormat:@"%@(포켓몬위키)",self.title];
        webView.urlString = urlString;
        
    }
    
}


@end
