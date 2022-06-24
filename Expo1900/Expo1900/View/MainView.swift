//
//  MainView.swift
//  Expo1900
//
//  Created by 이원빈 on 2022/06/24.
//

import UIKit

class MainView: UIView {
    
    let expositionDataManager = ExpositionDataManager()
    let numberFormatter = NumberFormatter()
    
    lazy var expositionModel: Exposition? = {
        return expositionDataManager.fetchData()
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = makeLabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.numberOfLines = 0
        label.text = expositionModel?.title
        label.text = label.text?.replacingOccurrences(of: "(", with: "\n(")
        label.textAlignment = .center
        return label
    }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        return imageView
    }()
    
    lazy var visitorsStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    lazy var visitorsTitleLabel: UILabel = {
        let titleLabel = makeLabel()
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.text = "방문객 :"
        return titleLabel
    }()
    
    lazy var visitorsTextLabel: UILabel = {
        let textLabel = makeLabel()
        numberFormatter.numberStyle = .decimal
        textLabel.text = "\(numberFormatter.string(for: expositionModel?.visitors) ?? "") 명"
        textLabel.numberOfLines = 0
        return textLabel
    }()
    
    lazy var locationStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    lazy var locationTitleLabel: UILabel = {
        let titleLabel = makeLabel()
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.text = "개최지 :"
        return titleLabel
    }()
    
    lazy var locationTextLabel: UILabel = {
        let textLabel = makeLabel()
        textLabel.text = "\(expositionModel?.location ?? "")"
        textLabel.numberOfLines = 0
        return textLabel
    }()
    
    lazy var durationStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    lazy var durationTitleLabel: UILabel = {
        let titleLabel = makeLabel()
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.text = "개최 기간 :"
        return titleLabel
    }()
    
    lazy var durationTextLabel: UILabel = {
        let textLabel = makeLabel()
        let duration = expositionModel?.duration
        textLabel.text = "\(duration ?? "")"
        textLabel.numberOfLines = 0
        textLabel.accessibilityLabel = (duration?.replacingOccurrences(of: "-", with: "부터") ?? "") + "까지"
        return textLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = makeLabel()
        label.numberOfLines = 0
        label.text = expositionModel?.description ?? ""
        label.accessibilityLabel = "파리 만국박람회 1900 설명"
        return label
    }()
    
    lazy var enterButtonStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    lazy var leftImageView: UIImageView = {
        return makeImageView(named: "flag", x: 60, y: 40)
    }()
    
    lazy var rightImageView: UIImageView = {
        return makeImageView(named: "flag", x: 60, y: 40)
    }()
    
    let enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("한국의 출품작 보러가기", for: .normal)
        enterButton.setTitleColor(.systemBlue, for: .normal)
        return enterButton
    }()
    
    private var rootViewController: UIViewController?
    
    init(_ rootViewController: UIViewController) {
        super.init(frame: .null)
        self.rootViewController = rootViewController
        
        addAllSubviews()
        designateScrollViewConstraints()
        designateStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainView {
    
    func makeHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }
    
    func makeImageView(named: String, x: CGFloat, y: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: x).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: y).isActive = true
        imageView.image = UIImage(named: named)
        return imageView
    }
    
    func addAllSubviews() {
        guard let rootViewController = rootViewController else { return }
        rootViewController.view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(posterImageView)
        stackView.addArrangedSubview(visitorsStackView)
        stackView.addArrangedSubview(locationStackView)
        stackView.addArrangedSubview(durationStackView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(enterButtonStackView)
        
        visitorsStackView.addArrangedSubview(visitorsTitleLabel)
        visitorsStackView.addArrangedSubview(visitorsTextLabel)
        
        locationStackView.addArrangedSubview(locationTitleLabel)
        locationStackView.addArrangedSubview(locationTextLabel)
        
        durationStackView.addArrangedSubview(durationTitleLabel)
        durationStackView.addArrangedSubview(durationTextLabel)
        
        enterButtonStackView.addArrangedSubview(leftImageView)
        enterButtonStackView.addArrangedSubview(enterButton)
        enterButtonStackView.addArrangedSubview(rightImageView)
    }
    
    func designateScrollViewConstraints() {
        guard let rootViewController = rootViewController else { return }
        scrollView.leadingAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: rootViewController.view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor).isActive = true
    }
    
    func designateStackViewConstraints() {
        stackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
}
