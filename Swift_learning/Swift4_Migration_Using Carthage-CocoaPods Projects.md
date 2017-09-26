## Using Carthage/CocoaPods Projects
Here are some important points to consider when migrating a project with external dependencies using package managers like Carthage, CocoaPods, or the Swift Package Manager.

다음은 Swift Package Manager나 CocoaPods, Carthage 같은 외부 디펜던시를 사용하는 프로젝트를 마이그레이팅할 때 중요한 포인트들입니다.

- It is recommended to use source dependencies rather than binary Swift modules, because Swift 3.1 modules will not be compatible with Swift 3.2/4 modules, unless you can get distributions that were built in Swift 3.2 or Swift 4 mode.
- 바이너리 Swift 모듈보다 소스 디펜던시를 사용하는 것이 권장되는데, Swift 3.2 나 Swift 4 모드로 빌드된 배포를 받을 수 없다면 (기존의) Swift 3.1 모듈이 Swift 3.2 / 4 모듈과 호환되지 않을 것이기 때문입니다. 
- Make sure your source dependencies build successfully in Swift 3.2 mode as well as your own targets.
- 소스 디펜던시가 3.2 모드와 당신의 (빌드)타겟들에서 성공적으로 빌드되는지 확인하세요. 
- If you have setup framework search paths for finding the binary Swift modules inside Carthage’s build folder, either remove the search paths or clean the build folder, so that you are sure that you are only using the Swift modules that are built from your Xcode workspace.
- 만약 Carthage의 빌드 폴더 안에 있는 바이너리 Swift 모듈을 찾기 위한 서치 패스를 설정했다면, 서치 패스을 제거(remove)하거나 빌드 폴더의 내용을 지워서(clean), 당신의 Xcode 워크스페이스에서 빌드된 스위프트 모듈만 사용되도록 하십시오.
- It is not necessary to migrate your source dependencies as long as they can build in Swift 3.2 mode.
- 당신의 소스 디펜던시가 Swift 3.2 모드로 빌드될 수 있다면 마이그레이션 하지 않아도 괜찮습니다.