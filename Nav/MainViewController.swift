//
//  ViewController.swift
//  Nav
//
//  Created by Shakir Kadirov on 20.01.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var profileImg: UIImageView = {
        $0.image = UIImage(named: "mountainImage.jpg")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = $0.frame.height / 2
        return $0
    }(UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100)))
    
    lazy var labelStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 20
        $0.alignment = .center
        $0.addArrangedSubview(nameLbl)
        $0.addArrangedSubview(surNameLbl)
        return $0
    }(UIStackView(frame: CGRect(x: 100, y: profileImg.bounds.height + 120, width: profileImg.frame.width + 100, height: 20)))

    lazy var nameLbl: UILabel = {
        $0.text = "Имя"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        return $0
    }(UILabel())
    
    lazy var surNameLbl: UILabel = {
        $0.text = "Фамилия"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        return $0
    }(UILabel())
    
    lazy var settingsButton: UIButton = {
        $0.setTitle("Настройки", for:.normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.layer.cornerRadius = 25
        return $0
    }(UIButton(frame: CGRect(x: 0 , y: 0, width: 100, height: 25),primaryAction: openSettings))
    
    lazy var topStack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 20
        $0.addArrangedSubview(profileImg)
        $0.addArrangedSubview(labelStack)
        $0.addArrangedSubview(settingsButton)
        return $0
    }(UIStackView(frame: CGRect(x: view.center.x - 100, y: 150 , width: 200, height: 200)))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true

//        view.addSubview(profileImg)
//        view.addSubview(labelStack)
//        view.addSubview(settingsButton)
        view.addSubview(topStack)
    }
    
    lazy var openSettings = UIAction{_ in
        let  navigatioVC = SettingsViewController()
        self.navigationController?.pushViewController(navigatioVC, animated: true)
    }
}

