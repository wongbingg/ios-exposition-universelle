//
//  MainView.swift
//  Expo1900
//
//  Created by 이원빈 on 2022/06/24.
//

import UIKit

final class PosterView: UIView {
    private let numberFormatter = NumberFormatter()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        return imageView
    }()
    
    // MARK: - visitor horizontal stack
    private lazy var visitorsStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    private let visitorsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "방문객 :"
        return label
    }()
    
    private let visitorsTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - location horizontal stack
    private lazy var locationStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    private let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "개최지 :"
        return label
    }()
    
    private let locationTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - duration horizontal stack
    private lazy var durationStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    private let durationTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "개최 기간 :"
        return label
    }()
    
    private let durationTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - description
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.accessibilityLabel = "파리 만국박람회 1900 설명"
        return label
    }()
    
    // MARK: - enter button horizontal stack
    private lazy var enterButtonStackView: UIStackView = {
        let stackView = makeHorizontalStackView()
        return stackView
    }()
    
    private lazy var leftImageView: UIImageView = {
        return makeImageView(named: "flag", x: 60, y: 40)
    }()
    
    private lazy var rightImageView: UIImageView = {
        return makeImageView(named: "flag", x: 60, y: 40)
    }()
    
    let enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("한국의 출품작 보러가기", for: .normal)
        enterButton.setTitleColor(.systemBlue, for: .normal)
        return enterButton
    }()
    
    // MARK: - Initializers
    init() {
        super.init(frame: .null)
        addAllSubviews()
        setupScrollViewConstraints()
        setupStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(with model: Exposition) {
        titleLabel.text = model.title
        visitorsTextLabel.text = "\(model.visitors) 명"
        locationTextLabel.text = model.location
        durationTextLabel.text = model.duration
        descriptionLabel.text = model.description
    }
}

// MARK: - Methods
private extension PosterView {
    
    func makeHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }

    func makeImageView(named: String, x: CGFloat, y: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: x).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: y).isActive = true
        imageView.image = UIImage(named: named)
        return imageView
    }
    
    func addAllSubviews() {
        addSubview(scrollView)
        
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
    
    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            stackView.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor
            ),
            stackView.trailingAnchor.constraint(
                equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
            stackView.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                constant: -10
            )
        ])
    }
}
