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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(profileImg)
    }


}

