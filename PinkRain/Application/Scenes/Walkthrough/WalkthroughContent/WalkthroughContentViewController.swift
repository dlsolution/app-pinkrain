//
//  WalkthroughContentViewController.swift
//  PinkRain
//
//  Created by Duy Linh on 8/14/20.
//  Copyright © 2020 dlsolution. All rights reserved.
//

import UIKit

protocol WalkthroughContentViewControllerDelegate: class {
    func getStartedTouchUpInside()
}

class WalkthroughContentViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!

    weak var delegate: WalkthroughContentViewControllerDelegate?
    var page: Pages

    init(with page: Pages) {
        self.page = page

        super.init(nibName: "WalkthroughContentViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: page.imageName)
        titleLabel.text = page.title
        subtitleLabel.text = page.subTitle

        getStartedButton.isHidden = page.index < Pages.allCases.count - 1
    }

    @IBAction func getStarted(_ sender: UIButton) {
        delegate?.getStartedTouchUpInside()
    }
}
