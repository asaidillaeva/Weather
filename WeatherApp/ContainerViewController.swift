//
//  ContainerViewController.swift
//  WeatherApp
//
//  Created by Aliia Saidillaeva  on 27/6/22.
//

import UIKit

class ContainerViewController: UIViewController {
    
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    lazy var navController = UINavigationController(rootViewController: homeVC)
    
    private var menuState: MenuState = .closed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(handlePanGesture(_:)))
        navController.view.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    private func setup(){
        setupSubviews()
    }
    
    private func setupSubviews() {
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        homeVC.delegate = self
        homeVC.view.layer.cornerRadius = 40
        homeVC.view.layer.masksToBounds = true
        addChild(navController)
        view.addSubview(navController.view)
        navController.didMove(toParent: self)
        
    }
    
    func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
        if shouldShowShadow {
            navController.view.layer.shadowOpacity = 0.8
        } else {
            navController.view.layer.shadowOpacity = 0.0
        }
    }
}

extension ContainerViewController: HomeViewControllerDelegate{
    func didTapMenuButton() {
        switch menuState {
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navController.view.frame.origin.x = 0
            } completion: { done in
                if done {
                    self.menuState = .closed
                    self.showShadowForCenterViewController(false)
                }
            }
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navController.view.frame.origin.x = self.navController.view.frame.size.width - 100
                self.navController.navigationBar.becomeFirstResponder()
            } completion: { done in
                if done {
                    self.menuState = .opened
                    self.showShadowForCenterViewController(false)
                }
            }
        }
    }
}

extension ContainerViewController: UIGestureRecognizerDelegate {
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {

        case .began:
            showShadowForCenterViewController(true)

        case .changed:
            if let rview = recognizer.view {
                rview.center.x = rview.center.x + recognizer.translation(in: view).x
                recognizer.setTranslation(CGPoint.zero, in: view)
            }

        case .ended:
            didTapMenuButton()
            showShadowForCenterViewController(false)

        default:
            break
        }
        
    }
}
