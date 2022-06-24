//
//  DetailViewController.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/16.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailView: DetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateData(from model: Item?) { // setupDetailView() 이후로 실행 시키는 방법 ..
        guard let model = model else { return }
        detailView = DetailView(self)
        navigationItem.title = model.name
        detailView?.itemImageView.image = UIImage(named: model.imageName)
        detailView?.descriptionLabel.text = model.description
    }
}

