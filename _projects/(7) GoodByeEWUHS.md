---
name: GoodBye EWUHS
tools: [Flutter, Azure Web App]
description: Azure를 통해 호스팅한 간단한 정적 웹앱
image : https://github.com/sangmin0816/GoodByeEWUHS/GoodByeEWUHS/raw/main/README/EWUHS.gif
---

# [GoodBye EWUHS](https://github.com/sangmin0816/GoodByeEWUHS/GoodByeEWHUS)

간단한 플러터 프로젝트로 정적 애플리케이션.
교육실습을 마무리하며 특별한 편지를 써주고 싶어서 3일동안 만들었다. 정확히는 만드는 건 하루고, 배포가 이틀 내내 시간을 잡아먹었다.

# Azure 의 Static Web App 으로 호스팅 과정

1. build 스크립트 없음
![oryx could not find a 'build'](https://github.com/sangmin0816/GoodByeEWUHS/README/image.png)
   * 나는 web으로 빌드해서 올리니깐 괜찮을 줄 알았다(build 명령어 `flutter build web`)
2. requirements.txt 파일이 없음
![requirements.txt](https://github.com/sangmin0816/GoodByeEWUHS/README/image-1.png)
   * requirements가 없으니 requirements.txt 도 없었다. 빈 파일을 만들었다.
3. App Directory Location 을 찾을 수 없음
![/build/web](https://github.com/sangmin0816/GoodByeEWUHS/README/image-2.png)
![build/web](https://github.com/sangmin0816/GoodByeEWUHS/README/image-4.png)
![Azure 공식 문서](https://github.com/sangmin0816/GoodByeEWUHS/README/image-5.png)
   * `/build/web` 으로 했었는데 안 됐다
   * 챗 지피티는 나에게 경로를 `.` 로 하라고 했으나, 안 됐다.
   * 하지만 Azure 가 [공식 문서](https://learn.microsoft.com/ko-kr/azure/static-web-apps/front-end-frameworks)에 써둔 `build/web`이 안되는 건 너무하다.

4. SDK 와 패키지 버전이 너무 낮음
![Low Version](https://github.com/sangmin0816/GoodByeEWUHS/README/image-3.png)
   * get 패키지 버전을 3.26.0 이상, SDK 버전을 2.9.0~3.0.0 사이로 맞췄다.
5. 그 외 기타 등등 여러 이슈

이 모든 과정으로 겪고 배포한 사이트

![EWUHS GIF](https://github.com/sangmin0816/GoodByeEWUHS/README/EWUHS.gif)