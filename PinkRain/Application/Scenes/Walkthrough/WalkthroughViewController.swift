//
//  WalkthroughViewController.swift
//  PinkRain
//
//  Created by Duy Linh on 8/14/20.
//  Copyright © 2020 dlsolution. All rights reserved.
//

import UIKit

enum Pages: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    case pageThree
    case pageFour
    case pageFive
    case pageSix
    case PageSeven

    var title: String {
        switch self {
        case .pageZero:
            return "Shopertino"
        case .pageOne:
            return "Shopping bag"
        case .pageTwo:
            return "Quick Search"
        case .pageThree:
            return "Wishlist"
        case .pageFour:
            return "Order Tracking"
        case .pageFive:
            return "Notifications"
        case .pageSix:
            return "Stripe Payments"
        case .PageSeven:
            return "Apple Pay"
        }
    }

    var subTitle: String {
        switch self {
        case .pageZero:
            return "Welcome to Shopertino! Buy our products easily and get access to app only exclusives."
        case .pageOne:
            return "Add products to your shopping cart, and check them out later."
        case .pageTwo:
            return "Quickly find the products you like the most."
        case .pageThree:
            return "Build a wishlist with your favorite products to buy them later."
        case .pageFour:
            return "Monitor your orders and get updates when something changes."
        case .pageFive:
            return "Get notifications for new products, promotions and discounts."
        case .pageSix:
            return "We support all payment options, thanks to Stripe."
        case .PageSeven:
            return "Pay with a single click with Apple Pay."
        }
    }

    var imageName: String {
        switch self {
        case .pageZero:
            return "walkthrough-icon-page-0"
        case .pageOne:
            return "walkthrough-icon-page-1"
        case .pageTwo:
            return "walkthrough-icon-page-2"
        case .pageThree:
            return "walkthrough-icon-page-3"
        case .pageFour:
            return "walkthrough-icon-page-4"
        case .pageFive:
            return "walkthrough-icon-page-5"
        case .pageSix:
            return "walkthrough-icon-page-6"
        case .PageSeven:
            return "walkthrough-icon-page-7"
        }
    }

    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        case .pageThree:
            return 3
        case .pageFour:
            return 4
        case .pageFive:
            return 5
        case .pageSix:
            return 6
        case .PageSeven:
            return 7
        }
    }
}

class WalkthroughViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!

    lazy var pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        pageVC.view.backgroundColor = .clear
        pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        return pageVC
    }()

    var pages: [Pages] = Pages.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let initalVC = walkthroughViewController(forPage: pages[0])
        pageViewController.setViewControllers([initalVC], direction: .forward, animated: false, completion: nil)

        pageControl.numberOfPages = pages.count

        view.bringSubviewToFront(pageControl)
    }

    private func walkthroughViewController(forPage page: Pages) -> WalkthroughContentViewController {
        let walkthroughVC = WalkthroughContentViewController(with: page)
        walkthroughVC.delegate = self
        return walkthroughVC
    }
}

// MARK: - WalkthroughViewController
extension WalkthroughViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? WalkthroughContentViewController else {
            return nil
        }
        let index = currentVC.page.index
        if index == 0 {
            return nil
        }
        return walkthroughViewController(forPage: pages[index - 1])
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? WalkthroughContentViewController else { return nil }
        let index = currentVC.page.index
        if index + 1 >= pages.count {
            return nil
        }
        return walkthroughViewController(forPage: pages[index + 1])
    }
}

// MARK: - WalkthroughViewController
extension WalkthroughViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            return
        }
        if let lastVC = pageViewController.viewControllers?.last as? WalkthroughContentViewController {
            pageControl.currentPage = lastVC.page.index
        }
    }
}

// MARK: - WalkthroughContentViewControllerDelegate
extension WalkthroughViewController: WalkthroughContentViewControllerDelegate {
    func getStartedTouchUpInside() {
        let welcomeVC = UINavigationController(rootViewController: WelcomeViewController())
        welcomeVC.modalPresentationStyle = .fullScreen
        present(welcomeVC, animated: true, completion: nil)
    }
}
