# 만국박람회 🏛

# 소개 🫡
본프 웡빙이 함께 진행해봤습니다 !! 😛
프랑스 만국박람회 내용을 테이블 뷰를 이용하여 표현한 어플


# 팀원 👥 

### 짝프로그래밍 👨🏻‍❤️‍👨🏾
<table><tr><td valign="top" width="50%" align="center" border="1">

[bonf](https://github.com/apwierk2451)
</td><td valign="top" width="50%" align="center">
    
[웡빙](https://github.com/wongbingg)        
</td></tr>
<tr><td valign="top" width="50%">

![](https://i.imgur.com/yGJljLR.jpg)        
</td><td valign="top" width="50%">
        
![](https://i.imgur.com/fQDo8rV.jpg)
</td></tr>
</table>

### 구동 영상
<img src="https://user-images.githubusercontent.com/95114036/175763950-92f5c5e1-f512-4012-ac82-49b8e328b47a.gif" width="700" height="680"/>

### 이번 프로젝트 핵심경험 안내
- [x]  Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- [x]  스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
- [x]  테이블뷰의 Delegate와 Data Source의 역할의 이해
- [x]  테이블뷰의 셀의 재사용 이해
- [x]  테이블뷰의 전반적인 동작 방식의 이해
- [x]  주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
- [x]  내비게이션 컨트롤러를 활용한 화면 전환
- [x]  뷰 컨트롤러 사이의 데이터 전달
- [x]  Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- [x]  스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
- [x]  테이블뷰의 Delegate와 Data Source의 역할의 이해
- [x]  테이블뷰의 셀의 재사용 이해
- [x]  테이블뷰의 전반적인 동작 방식의 이해
- [x]  주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
- [x]  내비게이션 컨트롤러를 활용한 화면 전환
- [x]  뷰 컨트롤러 사이의 데이터 전달
- [x]  오토 레이아웃을 적용하여 다양한 기기에 대응
- [ ]  Word Wrapping / Line Wrapping / Line Break 방식의 이해
- [x]  접근성(Accessibility)의 개념과 필요성 이해
- [x]  Dynamic Types를 통해 텍스트 접근성 향상

## TimeLine
- **Step1** [모델타입 구현]
기간 : 2022.6.13(월) ~ 2022.6.14(화)
[step1 PR 메세지](https://github.com/yagom-academy/ios-exposition-universelle/pull/171#event-6813191893)
- **Step2** [JSON파싱 및 UI구현]
기간 : 2022.6.15(수) ~ 2022.6.17(금)
[step2 PR 메세지](https://github.com/yagom-academy/ios-exposition-universelle/pull/178#discussion_r902581229)
- **Step3** [오토레이아웃, Accessibility 지정]
기간 : 2022.6.21(화) ~ 2022.6.22(수)
[step3 PR 메세지](https://github.com/yagom-academy/ios-exposition-universelle/pull/185#event-6875566232)
## 모델타입 UML 
![](https://i.imgur.com/C7p86TU.png)

## 화면 UI 구성

### MainViewController
- navigationItem.title = "메인"
- scrollView
    - stackView
        - **title**
        - **posterView**
        - **visitorStack**
            - visitorsTitle
            - visitorsText
        - **locationStack**
            - locationTitle
            - locationText
        - **durationStack**
            - durationTitle
            - durationText
        - **description**
        - **buttonStack**
            - firstFlagView
            - button
            - secondFlagView

### ItemTableViewController
- navigationItem.title = "한국의 출품작"
- ItemTableViewCell
    - stackView
        - **imageNameView**
        - subStackView 
            - **nameLabel**
            - **shortDescriptionLabel**

### DetailViewController
- navigationItem.title = ItemTableViewCell.nameLabel
- stackView
    - **imageNameView**
    - **descrriptionLabel**

## Accessibility

<img src="https://user-images.githubusercontent.com/95114036/175759664-f35adaa9-6605-4ef5-aa7c-8e6a7d996925.gif" width="250" height="500"/>
</td><td valign="top" width="50%">

## Device Orientation
- **첫번째 화면만 세로모드 고정**
    
<table><tr><td valign="top" width="50%" align="center" border="1">
<strong>첫번째 화면</strong>
</td><td valign="top" width="50%" align="center">
<strong>나머지 화면</strong>
</td></tr><tr><td valign="top" width="50%">
<img src="https://user-images.githubusercontent.com/95671495/174949389-5c3ef202-4e57-4f03-b810-dbb905f82548.gif" width="350" height="350"/>
</td><td valign="top" width="50%">
    <img src="https://user-images.githubusercontent.com/95671495/174949512-9cba4c2e-9b89-4a35-8d70-4e81cba5b70c.gif"width="350" height="350"/>
</td></tr></table>

---

## 🛠Trouble Shooting🛠
<details>
    
### - 줄바꿈이 되지 않는 문제
 JSON에서 파싱된 Data의 줄바꿈을 하기 위하여 replacingOccurences 메서드를 사용했다.
title.text 내의 "(" 를 "\n("로 변경하도록 구현했다.
``` swift
    title.text = result.title
    title.text = title.text?.replacingOccurrences(of: "(", with: "\n(")
    title.textAlignment = .center
```
    
<table><tr><td valign="top" width="50%" align="center">
    <strong>수정 전</strong>
</td><td valign="top" width="50%" align="center">
    <strong>수정 후</strong>
</td></tr><tr><td valign="top" width="50%">
<img src="https://i.imgur.com/u3W5HEU.png" width="250" height="500"/>
</td><td valign="top" width="50%">
  <img src="https://i.imgur.com/66t1M9e.png" width="250" height="500"/>
    </td></tr></table> 


### - 로컬에 있는 json 파일을 파싱하는 방법에 대한 고민.
파일의 경로를 찾는 과정에서 다른 사용자가 pull을 받았을 때 경로를 찾지 못하는 문제가 발생했다.
`Bundle.main.path(forResource: 파일명, ofType: 파일타입, inDirectory: 파일경로(상위 폴더이름))` 메서드를 이용하여 상대 경로를 찾아줬다.
`try? String(contentsOfFile: ).data(using: .utf8)`메서드를 이용하여 Data타입으로 변환하였고, 디코딩을 할 수 있었다.</br>

### - DecodingError
기존의 `ItemDataManager` 에서 getData() 메서드를 수행하여 json을 읽어왔다. 이를 이용해 유닛테스트를 진행하였고, 똑같이 `ExpositionDataManager` 에서도 같은 getData()메서드를 사용하여 테스트를 진행 하였는데 typeMismatch 오류가 생겼다.
  > typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
    
  **해석:** `Array<Any>` 를 decode 하는 것을 예상 했지만,`dictionary` 가 들어왔다 ! 
    decode 메서드에 type파라미터에 배열이 들어갔기 때문이었다. 배열에서 딕셔너리 타입으로 바꿔주니 오류가 해결 되었다. 대괄호 하나 차이로 인해 오류가 났던 것이었다. 파일로 직접 열어서 확인해보니, "items.json" 에선 [{}] 배열 타입의 json 이 들어있고, "exposition_universelle_1900.json" 에선 {} 딕셔너리 타입의 json 이 들어있었다. 
    ```swift
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
    ```

### - 사진의 크기조절 
stackView에 사진과 버튼을 addArrangedSubview 해줬을 때 사진만 크게 나와 버튼을 클릭할 수 없는 문제가 발생했다. 사진의 크기를 resize하여 문제를 해결했다.
```swift
func resizeImage(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage? {
    UIGraphicsBeginImageContext(CGSize(width: width, height: height))
    image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage
}
```
이후에 오토레이아웃을 이용하여 imageView의 Size를 더 간단하게 설정할 수 있었다.
```swift
imageView.widthAnchor.constraint(equalToConstant: x).isActive = true
imageView.heightAnchor.constraint(equalToConstant: y).isActive = true
```

<img src="https://i.imgur.com/Iih7Yd6.png" width="250" height="500"/><img src="https://i.imgur.com/wuVmwG0.png" width="250" height="500"/>
    
### - 화면전환 깨짐
<img src="https://user-images.githubusercontent.com/95671495/175250174-c8108c71-fcdc-4454-a8ad-9cafc02e6ff7.gif" width="250" height="500"/>
  
- backgoundColor를 systemBackground 로 지정해주었더니 해결 되었다. 
    
### - 해금의 사진크기

해금의 사진크기만 위아래로 길게 뻗어지는 현상이 발생하였습니다. 이 사진 하나 때문에 작업 진행이 원활하게 되지 않았습니다. 

![](https://i.imgur.com/XL5SyIi.png)
contentView가 아닌 self.heightAnchor를 이용하였더니 해결되었다.
![](https://i.imgur.com/Oy88MCE.png)
self.contentView.heightAnchor와 self.heightAnchor의 차이 => 같은 계층에 있는 contentView에 제약을 걸어주게 되면 imageView 크기와 함께 늘어나게 되어서 안되고, 부모 계층에 있는 itemTableViewCell의 heightAnchor에 제약을 맞춰 주었더니 해결이 되었다.

<table>
    <tr><td valign="top" width="30%" align="center">
<strong>수정 전</strong>
    </td><td valign="top" width="30%" align="center">
<strong>수정 전</strong>
    </td><td valign="top" width="30%" align="center">
<strong>수정 후</strong>
    </td></tr><tr><td valign="top" width="30%">
<img src="https://i.imgur.com/Zpc7MPj.png" width="220" height="440"/>
    </td><td valign="top" width="30%">
<img src="https://i.imgur.com/C8DrYUN.png" width="220" height="440"/>
    </td><td valign="top" width="30%">
<img src="https://i.imgur.com/juYmK7f.png" width="220" height="440"/>
    </td></tr></table>                                           
<img width="1333" alt="스크린샷 2022-06-25 오후 1 31 27" src="https://user-images.githubusercontent.com/95671495/175768631-6ee1ca70-9bd8-4b31-8383-5296fa1bfc02.png">
<img width="1333" alt="스크린샷 2022-06-25 오후 1 32 13" src="https://user-images.githubusercontent.com/95671495/175768636-f4617bf3-12f3-4b55-96cf-619d7e0a25ac.png">                                                              
</div>
</details>


