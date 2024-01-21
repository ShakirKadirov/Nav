//
//  ViewController.swift
//  Nav
//
//  Created by Shakir Kadirov on 20.01.2024.
//

import UIKit

protocol ViewControllerDelegate{
    func setName(nameLbl: String, surNameLbl: String)
    
}

class MainViewController: UIViewController, ViewControllerDelegate {
    
    func setName(nameLbl: String, surNameLbl: String) {
        self.nameLbl.text = nameLbl
        self.surNameLbl.text = surNameLbl
    }
    
    
    lazy var profileImg: UIImageView = {
        $0.image = UIImage(named: "mountainImage.jpg")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = $0.frame.height / 2
        return $0
    }(UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
    
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
    
    lazy var middleStack: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.backgroundColor = .systemBlue
        $0.spacing = 20
        return $0
    }(UIStackView(frame: CGRect(x: 31, y: topStack.frame.height + 160 , width: view.frame.width - 62 , height: 80)))
    
    lazy var contantImageView: UIImageView = {
        $0.image = UIImage(named: "mountainImage.jpg")
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 31, y: view.center.y - 10, width: view.frame.width - 62, height: view.frame.height - view.center.y - 62)))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(topStack)
        view.addSubview(middleStack)
        view.addSubview(contantImageView)
    }
    
    lazy var openSettings = UIAction{_ in
        let  navigatioVC = SettingsViewController()
        self.navigationController?.pushViewController(navigatioVC, animated: true)
    }
}

