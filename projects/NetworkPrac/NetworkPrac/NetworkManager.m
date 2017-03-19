//
//  NetworkManager.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "NetworkManager.h"
#import "DataCenter.h"

static NSString *ROOT_URL = @"https://fc-ios.lhy.kr/api";
static NSString *SIGN_UP = @"/member/signup/";
static NSString *LOG_IN = @"/member/login/";
static NSString *LOG_OUT = @"/member/logout/";
static NSString *POSTCREATE = @"/post/";
static NSString *POSTLIST = @"/post/";
static NSString *POSTRETIREVE = @"/post/<post_pk>/";





@implementation NetworkManager 

///ROOT_URL문자열 뒤에 경로를 붙여 NSMutableURLRequest를 만들어 반환합니다.
- (NSMutableURLRequest *)mutableRequestWithApiURL:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ROOT_URL,urlStr]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    return request;
}


#pragma mark - Account

- (void)signUpRequestToServerWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion{
    
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSMutableURLRequest *request = [self mutableRequestWithApiURL:SIGN_UP];
    request.HTTPMethod = @"POST";
    
    //body data
    NSString *dataStr = [NSString stringWithFormat:@"username=%@&password1=%@&password2=%@",userName,password,password];
    request.HTTPBody = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    
    //upload task
    NSURLSessionUploadTask *signUpTask = [defaultSession uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        
        if (error == nil) {
            if (statusCode == 201) {
                completion(YES, dataDict);
            } else if(statusCode == 400){
                completion(NO, dataDict);
            } else {
                NSLog(@"What the... %ld",statusCode);
            }
        } else {
            completion(NO, dataDict);
        }

    }];
    
    [signUpTask resume]; 
}


- (void)loginRequestToServerWithUserName:(NSString *)userName password:(NSString *)password completion:(CompletionBlock)completion{
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSMutableURLRequest *request = [self mutableRequestWithApiURL:LOG_IN];
    request.HTTPMethod = @"POST";
    
    //body data
    NSString *dataStr = [NSString stringWithFormat:@"username=%@&password=%@",userName,password];
    request.HTTPBody = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    
    //upload task
    NSURLSessionUploadTask *logInTask = [defaultSession uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        
        if (error == nil) {
            if (statusCode == 200) {
                completion(YES, dataDict);
            } else if(statusCode == 400){
                completion(NO, dataDict);
            } else {
                completion(NO, dataDict);
                NSLog(@"What the... %ld",statusCode);
            }
        } else {
            completion(NO, dataDict);
        }
        
    }];
    
    [logInTask resume];
}


- (void)logOutRequestToServerWithToken:(NSString *)token {
    
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSMutableURLRequest *request = [self mutableRequestWithApiURL:LOG_OUT];
    NSString *headerStr = [NSString stringWithFormat:@"Token %@",token];
    
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    [request setValue:headerStr forHTTPHeaderField:@"Authorization"];

    //upload task
    NSURLSessionUploadTask *logOutTask = [defaultSession uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (error == nil && [[dataDict objectForKey:@"detail"] isEqualToString:@"Successfully logged out."]) {
            NSLog(@"logOut완료!");
        } else {
            //재시도...?
        }
        
    }];
    
    [logOutTask resume];
    
}

- (void)logOutRequestToServerWithToken:(NSString *)token completion:(CompletionBlock)completion {
    
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSMutableURLRequest *request = [self mutableRequestWithApiURL:LOG_OUT];
    NSString *headerStr = [NSString stringWithFormat:@"Token %@",token];
    
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    [request setValue:headerStr forHTTPHeaderField:@"Authorization"];
    
    //upload task
    NSURLSessionUploadTask *logOutTask = [defaultSession uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        
        if (error == nil) {
            if (statusCode == 200) {
                completion(YES, dataDict);
            } else if(statusCode == 401){
                completion(NO, dataDict);
            } else {
                completion(NO, dataDict);
                NSLog(@"What the... %ld",statusCode);
            }
        } else {
            completion(NO, dataDict);
        }
        
    }];
    
    [logOutTask resume];
    
}

#pragma mark - Posts

///각 페이지별 포스트데이터를 로드합니다.
- (void)getPostDataOnPage:(NSInteger)page completion:(CompletionBlock)completion {
    
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSString *pageStr = [NSString stringWithFormat:@"?page=%ld",page];
    NSMutableURLRequest *request = [self mutableRequestWithApiURL:[POSTLIST stringByAppendingString:pageStr]];
    
    request.HTTPMethod = @"GET";
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    
    //upload task
    NSURLSessionUploadTask *getPosts = [defaultSession uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        
        if (error == nil) {
            if (statusCode == 200) {
                completion(YES, dataDict);
            } else if(statusCode == 404){
                completion(NO, dataDict);
            } else {
                completion(NO, dataDict);
                NSLog(@"What the... %ld",statusCode);
            }
        } else {
            completion(NO, dataDict);
        }
        
        
    }];
    
    
    [getPosts resume];
    
}

///이미지를 로드합니다.
- (void)loadImageWithURL:(NSURL *)url postPK:(NSInteger)postPK {
    
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"GET";
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    
    //data task
    NSURLSessionDataTask *loadImage = [defaultSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [[[DataCenter sharedData] postImageDictionary] setObject:data forKey:[NSNumber numberWithInteger:postPK]];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"gotImage" object:nil userInfo:@{@"Post_PK" : [NSNumber numberWithInteger:postPK]}];
    }];
    
    
    [loadImage resume];

}


///글을 포스팅합니다.
- (void)postTitle:(NSString *)title content:(NSString *)content imageData:(NSData *)imageData completion:(CompletionBlock)completion {
    
    //session
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    //body data - multipart
    NSString *boundary = @"--------BOUNDARY";
    NSMutableData *data = [NSMutableData data];
    
        // title
        [data appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name = \"title\"\r\n\r\n%@",title] dataUsingEncoding:NSUTF8StringEncoding]];
        
        // content
        [data appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name = \"content\"\r\n\r\n%@",content] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //image
        [data appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name = \"img_cover\"; filename=\"image.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:[@"Content-Type:application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:imageData];

        //last boundary
        [data appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];

    //request
    NSMutableURLRequest *request = [self mutableRequestWithApiURL:POSTCREATE];
    request.HTTPMethod = @"POST";
    request.HTTPBody = data;
    
    
    //HTTPHeader
    NSString *multiPartContentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:multiPartContentType forHTTPHeaderField: @"Content-Type"];
    
    NSString *authTokenStr = [NSString stringWithFormat:@"Token %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"Token"]];
    [request setValue:authTokenStr forHTTPHeaderField:@"Authorization"];

    //uploadtask
    NSURLSessionUploadTask *postingTask = [defaultSession uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        
        if (error == nil) {
            if (statusCode == 201) {
                completion(YES, dataDict);
            } else if(statusCode == 400){
                completion(NO, dataDict);
            } else {
                completion(NO, dataDict);
                NSLog(@"What the... %ld",statusCode);
            }
        } else {
            completion(NO, dataDict);
        }
        
        
    }];
    
    [postingTask resume];

    
}


@end
