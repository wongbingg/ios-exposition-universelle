# 만국박람회

# 소개
본프 웡빙이 함께 진행해봤습니다 !! 😛
프랑스 만국박람회 내용을 테이블 뷰를 이용하여 표현한 어플

# 👥 팀원

### 짝프로그래밍
bonf , wongbing
[웡빙 깃허브](https://github.com/wongbingg)
[bonf 깃허브](https://github.com/apwierk2451)

# Step1
기간 : 2022.6.13(월) ~ 2022.6.14(화)

## 모델타입 구현
"items.json" 파일, "exposition_universelle_1900.json" 파일
- **Item.swift** (items 파일의 모델타입을 구현했다.)
- **Exposition.swift** (exposition_universelle_1900 파일의 모델타입을 구현했다.)
## snake케이스와 축약형
- CodingKey를 이용하여 JSON 키 값을 스위프트의 네이밍에 맞게 변환했다.

## JSON 테스트

- 각 JSON 파일마다 manager 를 만들어 파싱이 되는지 테스트를 진행했다.
--- 

## 문제점에서 해결한 점
- **로컬에 있는 json 파일을 파싱하는 방법에 대한 고민.**
파일의 경로를 찾는 과정에서 다른 사용자가 pull을 받았을 때 경로를 찾지 못하는 문제가 발생했다.
`Bundle.main.path(forResource: 파일명, ofType: 파일타입, inDirectory: 파일경로(상위 폴더이름))` 메서드를 이용하여 상대 경로를 찾아줬다.
`try? String(contentsOfFile: ).data(using: .utf8)`메서드를 이용하여 Data타입으로 변환하였고, 디코딩을 할 수 있었다.</br>

- **`DecodingError`**
기존의 `ItemDataManager` 에서 getData() 메서드를 수행하여 json을 읽어왔다. 이를 이용해 유닛테스트를 진행하였고, 똑같이 `ExpositionDataManager` 에서도 같은 getData()메서드를 사용하여 테스트를 진행 하였는데 typeMismatch 오류가 생겼다.
  > typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
    
  **해석:** `Array<Any>` 를 decode 하는 것을 예상 했지만,`dictionary` 가 들어왔다 ! 
    decode 메서드에 type파라미터에 배열이 들어갔기 때문이었다. 배열에서 딕셔너리 타입으로 바꿔주니 오류가 해결 되었다. 대괄호 하나 차이로 인해 오류가 났던 것이었다. 파일로 직접 열어서 확인해보니, "items.json" 에선 [{}] 배열 타입의 json 이 들어있고, "exposition_universelle_1900.json" 에선 {} 딕셔너리 타입의 json 이 들어있었다. 
    ```swift=
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
    ```

- **본프와 웡빙의 xcode 버전이 달라 테스트코드가 실행되지 않는 문제**
본프가 작성한 테스트코드를 웡빙이 pull 을 받고 웡빙 xcode에서 테스트를 실행했을 때, 오류가 났다. xcode의 버전 차이 때문인 것 같았다. iOS Deployment Target 이 15.5 로 설정 되어있어 오류가 난 것인데, 이것을 15.2 로 설정 해주니 해결이 되었다.
![](https://i.imgur.com/rn65HjB.png)

# Step2
기간 : 2022.6.15(수) ~ 2022.6.17(금)

## 구현사항
<p>
<div class=pull-left>
<img src="https://i.imgur.com/4STBcUU.gif" width="300" height="600"/><img src="https://i.imgur.com/ki5XeDs.pnghttps://i.imgur.com/4STBcUU.gif" width="50" height="600"/>
</div>


### - Storyboard ID를 이용한 네비게이션
뷰 간의 이동을 하기 위해서 각 뷰의 식별자가 필요했는데, 코드로 뷰를 짠 경우 이 식별자 지정을 할 수가 없었다, 그래서 뷰마다 빈 ViewController 를 만들어 준뒤, Storyboard ID 를 지정해주어 사용 하였다. 

### - 화면전환 및 데이터 전달 
다음 뷰를 인스턴스화 시키는 `instantiate(from:, bundle:, identifier:)` 메서드를 만들어주어 , 뷰간 이동과 데이터 전달을 시켜주었습니다. 

### - 오토레이아웃
tableView에서 각 cell 마다`tableView.estimatedRowHeight = 200`,
`tableView.rowHeight = UITableView.automaticDimension`를 이용하여, content의 크기에 따라 rowheight를 맞춰주었습니다.
`image.contentMode = .scaleAspectFit`를 사용해 image의 크기를 ImageView에 맞게 설정해주고, imageView의 오토레이아웃을 설정해주었습니다.
</p>


</br>

</br>


### constraints

```swift
imageNameView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
imageNameView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.2).isActive = true
imageNameView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
imageNameView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

subStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
subStackView.leadingAnchor.constraint(equalTo: imageNameView.trailingAnchor, constant: 10).isActive = true
subStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
subStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
```





## 화면 구성

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


## 🛠Trouble Shooting🛠

### - 줄바꿈이 되지 않는 문제
 JSON에서 파싱된 Data의 줄바꿈을 하기 위하여 replacingOccurences 메서드를 사용했다.
title.text 내의 "(" 를 "\n("로 변경하도록 구현했다.
``` swift
    title.text = result.title
    title.text = title.text?.replacingOccurrences(of: "(", with: "\n(")
    title.textAlignment = .center
```
<img src="https://i.imgur.com/u3W5HEU.png" width="250" height="500"/>
<img src="https://i.imgur.com/66t1M9e.png" width="250" height="500"/>

### - 스크롤이 되지 않는 문제
UIViewController 로 뷰를 구성하니 위아래 스크롤이 되지 않았다. 그래서, 모든 UI요소를 새로 만들어준 UIScrollerView 에 다시 추가해준 뒤, UIScrollView - SuperView 와의 Constraints 을 설정 해주었다. 

### - 사진의 크기조절 
stackView에 사진과 버튼을 addArrangedSubview 해줬을 때 사진만 크게 나와 버튼을 클릭할 수 없는 문제가 발생했다. 사진의 크기를 resize하여 문제를 해결했다.
```swift=
func resizeImage(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage? {
    UIGraphicsBeginImageContext(CGSize(width: width, height: height))
    image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage
}
```

<img src="https://i.imgur.com/Iih7Yd6.png" width="250" height="500"/>
<img src="https://i.imgur.com/wuVmwG0.png" width="250" height="500"/>

## 궁금한 점

### - 해금의 사진크기

해금의 사진크기만 위아래로 길게 뻗어지는 현상이 발생하였습니다. 이 사진 하나 때문에 작업 진행이 원활하게 되지 않았습니다. 

```swift   
imageNameView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.9).isActive = true
```
contentView가 아닌 self.heightAnchor를 이용하였더니 해결되었습니다.
```swift   
imageNameView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
```
self.contentView.heightAnchor와 self.heightAnchor의 차이가 궁금합니다.

## 참고한 것

### - translatesAutoresizingMaskIntoConstraints
A Boolean value that determines whether the view's autoresizing mask is translated into Auto Layout constraints.
뷰의 자동 조절 마스크가 자동 레이아웃 제약 조건으로 변환되는지 여부를 결정하는 부울 값.


**Declaration**
```swift
var translatesAutoresizingMaskIntoConstraints: Bool { get set }
```
**Discussion**

Note that the autoresizing mask constraints fully specify the view’s size and position; therefore, you cannot add additional constraints to modify this size or position without introducing conflicts. If you want to use Auto Layout to dynamically calculate the size and position of your view, you must set this property to false, and then provide a non ambiguous, nonconflicting set of constraints for the view

코드로 오토레이아웃을 작성 해주려면 이 속성은 false 로 해주어야 한다. 
