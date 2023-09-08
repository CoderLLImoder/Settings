//
//  DetailViewController.swift
//  HW13
//
//  Created by Илья Капёрский on 07.09.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    public var isOn = false
    
    private lazy var rect: UIView = {
        let rect = UIView()
        rect.layer.cornerRadius = 10
        rect.backgroundColor = .systemGray5
        rect.clipsToBounds = true
        rect.translatesAutoresizingMaskIntoConstraints = false
        return rect
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Bluetooth"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.setOn(isOn, animated: false)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Bluetooth"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(rect)
        view.addSubview(label)
        view.addSubview(switchButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            rect.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            rect.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            rect.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            rect.heightAnchor.constraint(equalToConstant: 40),
            
            label.leftAnchor.constraint(equalTo: rect.leftAnchor, constant: 40),
            label.centerYAnchor.constraint(equalTo: rect.centerYAnchor),
            
            switchButton.rightAnchor.constraint(equalTo: rect.rightAnchor, constant: -20),
            switchButton.centerYAnchor.constraint(equalTo: rect.centerYAnchor)
            ])
        
    }
}
