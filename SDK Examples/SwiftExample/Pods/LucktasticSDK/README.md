# Lucktastic SDK

This SDK helps to show Ad in UITableView.

## Getting Started

- Read this Readme doc

## Requirements

- iOS 8.0 or later

## Installation

### Installation Requirements

LucktasticSDK uses SDWebImage library, you must install it in your project like this:

- pod 'SDWebImage', '~>3.8'

There are two ways to use LucktasticSDK in your project:

- using CocoaPods
- by cloning the project into your repository

### Installation with CocoaPods

Locally

```
pod 'LucktasticSDK', :path => 'PATH WHERE THE SDK REPOSITORY IS CLONED'
```
By version

```
pod 'LucktasticSDK', :git => 'https://github.com/JumpRampGames/LucktasticSDK-iOS.git', :tag => '1.2'
```
Latest version

```
pod 'LucktasticSDK', :git => 'https://github.com/JumpRampGames/LucktasticSDK-iOS.git'
```

### Installation with build configurations

LucktasticSDK is developed with "LOCAL_STAGING", "LOCAL_PRODUCTION" "STAGING" and "PRODUCTION" configurations.
For testing you must add this code to your project Podfile:

```
pod 'LucktasticSDK', :git => 'https://github.com/JumpRampGames/LucktasticSDK-iOS.git'

post_install do |installer_representation|
installer_representation.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
        if config.name == 'Local Staging'
            config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', "LOCAL_STAGING=1"]
        else if config.name == 'Local Production'
            config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', "LOCAL_PRODUCTUON=1"]
        else if config.name == 'Staging'
        	config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', "STAGING=1"]
        else if config.name == 'Production'
        	config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', "PRODUCTION=1"]
        end
    end
    end
    end
end
end
end
```

Add build configurations in your project, or use our SDK example project.

### Installation Manually

- You must clone the repo
- Open LucktasticSDK.xcodeproj
- Change build scheme to "UniversalBuilder" and press "Edit scheme"
- Click on "Run" row and change "Build Configuration" to one of this configurations:
"Local Staging", "Local Production", "Staging" or "Production"
- Close the popup, and press Run.

LucktasticSDK.framework will appear on your desktop

- Add LucktasticSDK.framework to root folder of your project
- Go to project targets, add LucktasticSDK.framework to "Embedded Binaries" and "Linked Frameworks and Libraries"

## How To Use

#### Initialization

```
+(void)initWithAppId:(NSString *_Nullable)appId options:(nullable NSDictionary *)options success:(void(^_Nullable)())success failure:(nullable void (^) ( NSError * _Nullable error ))failure;
```

- "appId"   - id of Application which uses SDK.
- "options" - user information data.
- "success" - called when init function is completed successfuly.
- "failure" - called when there is parsing error or error from the server response.

#### Display Ad in UItableView

```
+(AdCell *_Nullable)requestAdWithPlacementId:(NSString *_Nullable)placementId success:(void(^_Nullable)())success failure:(nullable void (^) ( NSError * _Nullable error ))failure;
```

- "AdCell"      - UITableViewCell with Ad information
- "placementId" - Ad placement id
- "success"     - called when init function is completed successfuly.
- "failure"     - called when there is parsing error or error from the server response.

## License

This project is licensed under the MIT License

