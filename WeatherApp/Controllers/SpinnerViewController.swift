//
//  SpinnerViewController.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 15.06.2022.
//

import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func activateFor(parent: UIViewController) {
        parent.addChild(self)
        
        view.frame = parent.view.frame
        parent.view.addSubview(view)
        didMove(toParent: parent)
    }
    
    func deactivate() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
