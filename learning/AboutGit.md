# About Git

##Git이란?
- VCS 시스템의 하나로, 2005년 [리누스 토발즈](https://namu.wiki/w/리누스%20토르발스)가 만들었다.
~~Subversion을 쓰다가 엄청나게 빡쳐서 개발한 분산형 버전 관리 프로그램.~~
- GitHub와 Git을 한몸으로 착각하지 않아야 한다. GitHub는 원격 Repositary의 대표적인 서비스일 뿐, Git은 다른 서비스에서도 사용할 수 있는 버전 관리 시스템(VCS)이다.
![Git logo](images/git.svg)
##VCS(Version Control System)란?
- 드류 휴스턴이 [드롭박스](https://namu.wiki/w/Dropbox)를 만들 때, 개발자들이 쓰는 Git과 같은 버전을 파일 관리용으로 일반인들도 쉽게 이용할 수 있으면 어떨까 하는 생각에서 출발했다고 합니다. 일반인 입장에서는 오히려 VCS를 드롭박스의 개발자 버전이라고 생각하면 편할 것 같다.
- 주요기능으로는 로컬 및 원격 버전 관리(Git), 협업 지원 기능, 브랜치를 통한 병렬 관리 등이 있다.

##Git에서의 작업 흐름
- Working Directory -> Staging Area -> Repositary의 세 가지로 나뉜다.
1. Working Directory: 실제 작업을 하는 공간이다. 설정파일이나 OS에 따라서 필요한 숨김파일 등등 개발에 필요한 온갖 파일이 다 들어있는 ~~혼돈의 카오스~~
2. Staging Area: 지금까지 한 작업 중에서 올릴 것과 올리지 않을 것을 구분해서 올릴 것만 고르는 공간이다. 새롭게 개발한 기능이나 ~~어른들의 사정으로 인해~~ 대형 판올림같은 경우 나가는 시기를 조절해야 할 수 있다. 
3. Repositary: 하나의 분기점으로써 쌓는 공간이다. 커밋을 통해 그 버전의 결과물을 다시 불러올 수 있도록 끊어서 여기까지 했음을 나타내는 단계인데, 역시 이 부분에 제대로 수정 사항을 적어놓지 않으면 ~~카오스~~혼란을 일으킬 수 있기 때문에, 주의해야 한다. ~~그냥 맞기 싫으면 바지런히 쓰자~~

##Local과 Remote Repositary
- 다시한번 드롭박스. 드롭박스를 보면 로컬에 파일이 멀쩡히 저장되어 있고, 또 그 복사본이 서버에 멀쩡히 저장되어 있다. 로컬에 저장된 파일 중 하나가 수정되면 그걸 그대로 둔 채로 변경 부분을 서버에도 반영한다. 서버는 다시 반영된 파일을 각기 로컬 저장소에 멀쩡히 복사한다. 이를 통해 **사용 기기 및 클라우드 각각에 멀쩡한 파일이 존재하도록** 하는 것. 그래서 한 쪽에서 수정하면 다른 쪽에서도 수정되는데, 이렇게 서로 다른 컴퓨터에서도 한 프로젝트에 대한 작업을 충돌 없이 수행하기 위해서 이 두가지를 나누어 놓았다.
- 나누었을 때의 장점 : 1. 네트워크 연결 없이 작업이 가능한 점(따라서 서버에 요청하는 횟수도 줄어든다.) / 2. 어느 한 쪽의 파일에 문제가 생기더라도 둘 중 하나로 덮어써서 복구가 가능 / 3. 

##.gitignore
- 깃이 무시해야 할 파일들의 리스트이다. 개인 컴퓨터의 설정 파일이나 언어에 따라 생성되는 파일 등등 챙겨야할 게 많은데, [여기](gitignore.io)에서 자동으로 생성할 수 있으니 참고할 것.
- 개인 작업의 경우에는 그렇게 중요한 부분이 아니지만, 협업을 하는 경우에는 꼭 Repositary 생성 직후에 세팅해줄 것. ~~까닥하면 또다시 혼돈의 카오스.~~

##그 밖의 Git관련 용어
- add : 작업폴더(Working Directory)에서 작업할 때, 변경된 것을 Git이 인지하고 Staging 할 목록에 추가한다.
- commit : 반영하기로 결정된 파일(Staged files)을 Repository에 반영하는 것을 말한다. 로컬이나 원격이나 둘 다 같은 용어를 사용하는데, 로컬 Repository에 이미 커밋된 내용을 원격에 반영하는 경우는 'push'라고 한다.
- pull : 원격 Repository에 저장된 버전을 로컬에 동기화하는 것을 말한다. 이 과정에서 만약 내가 수정해놓은 부분과 같은 부분에 수정이 있었던 것이 확인되면 충돌이 일어난다.
- merge : 같은 파일이 수정되었지만 서로 수정한 부분이 다른 경우로, Git이 이를 판단해서 작업 폴더의 파일과 섞어 준다.