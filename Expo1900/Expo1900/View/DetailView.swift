//
//  DetailView.swift
//  Expo1900
//
//  Created by 이원빈 on 2022/06/24.
//

import UIKit

class DetailView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        return imageView
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    private var rootViewController: UIViewController?
    
    init(_ rootViewController: UIViewController) {
        super.init(frame: .null)
        self.rootViewController = rootViewController
        addAllSubviews()
        designateViewBackgroundColor()
        designateScrollViewConstraints()
        designateStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailView {
    
    private func designateScrollViewConstraints() {
        guard let rootViewController = rootViewController else { return }
        scrollView.leadingAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: rootViewController.view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor).isActive = true
    }
    
    private func designateStackViewConstraints() {
        stackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func designateViewBackgroundColor() {
        rootViewController?.view.backgroundColor = .systemBackground
    }
    
    private func addAllSubviews() {
        rootViewController?.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(itemImageView)
        stackView.addArrangedSubview(descriptionLabel)
    }
}
