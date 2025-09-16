---
name: GoodBye EWUHS
tools: [Flutter, Azure Web App]
description: Azure를 통해 호스팅한 간단한 정적 웹앱
image : https://github.com/sangmin0816/GoodByeEWUHS/raw/main/README/EWUHS.gif
---

# [GoodBye EWUHS](https://github.com/sangmin0816/GoodByeEWUHS/GoodByeEWHUS)

간단한 플러터 프로젝트로 정적 애플리케이션입니다. 교육실습을 마무리하며 담당 반학생들에게 특별한 편지를 써주고 싶어 3일동안 만들었습니다. 구성 및 코드 작성은 하루안에 끝났지만, Azure와 깃헙을 연결해 배포하는 과정에 오류가 많이 발생해 이틀이 더 소요되었습니다.


## Azure 의 Static Web App 으로 호스팅 과정

1. build 스크립트 없음
![oryx could not find a 'build'](https://github.com/sangmin0816/GoodByeEWUHS/raw/main/README/image.png)
   * (build 명령어 `flutter build web`)
2. requirements.txt 파일이 없음
![requirements.txt](https://github.com/sangmin0816/GoodByeEWUHS/raw/main/README/image-1.png)
   * requirements가 없으니 requirements.txt 도 없었기에 빈 파일을 만들어 해결함
3. App Directory Location 을 찾을 수 없음
![/build/web](https://github.com/sangmin0816/GoodByeEWUHS/raw/main/README/image-4.png)
![build/web](https://github.com/sangmin0816/GoodByeEWUHS/raw/main/README/image-5.png)
![Azure 공식 문서](https://github.com/sangmin0816/GoodByeEWUHS/README/image-5.png)
   * `/build/web` 으로 했었으나 안 됨
   * 챗 지피티는 나에게 경로를 `.` 로 하라고 했으나, 안 됨.
   * 하지만 Azure 가 [공식 문서](https://learn.microsoft.com/ko-kr/azure/static-web-apps/front-end-frameworks)에 써둔 `build/web`도 되지 않음

4. SDK 와 패키지 버전이 너무 낮음
![Low Version](https://github.com/sangmin0816/GoodByeEWUHS/raw/main/README/image-3.png)
   * get 패키지 버전을 3.26.0 이상, SDK 버전을 2.9.0~3.0.0 사이로 맞춤
5. 그 외 기타 등등 여러 이슈

## 배포 사이트

![EWUHS GIF](https://github.com/sangmin0816/GoodByeEWUHS/raw/main/README/EWUHS.gif)