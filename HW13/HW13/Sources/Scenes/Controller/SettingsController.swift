//
//  ViewController.swift
//  HW13
//
//  Created by Илья Капёрский on 22.08.2023.
//

import UIKit

final class SettingsController: UIViewController {
    
    var settingView: SettingView? { guard isViewLoaded else { return nil }
        return view as? SettingView
    }
    
    func configureView() {
        settingView?.configureView(with: SettingsModel().createModel(), self)
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SettingView()
        configureView()
        setupViewSettings()
    }
    
    //MARK: - Setup
    
    private func setupViewSettings() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Настройки"
    }
    
    func changeViewController(_ nextVC: UIViewController) {
        navigationController?.pushViewController(nextVC, animated: true)
    }
}








