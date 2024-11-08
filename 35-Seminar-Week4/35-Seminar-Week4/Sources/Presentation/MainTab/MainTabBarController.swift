//
//  MainTabBarController.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/4/24.
//

import UIKit

import SnapKit
import Then

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTapBar()
    }
    
    private func setTapBar() {
        let myHobbyViewController = MyHobbyViewController().then {
            $0.tabBarItem.title = "내 취미"
            $0.tabBarItem.image = UIImage(systemName: "figure.run")
        }
        
        let otherHobbyViewController = OtherHobbyViewController().then {
            $0.tabBarItem.title = "친구 취미"
            $0.tabBarItem.image = UIImage(systemName: "person.icloud.fill")
        }
        
        let updateInfoViewController = UpdateInfoViewController().then {
            $0.tabBarItem.title = "정보 수정"
            $0.tabBarItem.image = UIImage(systemName: "pencil")
        }
        
        
        
        tabBar.unselectedItemTintColor = .systemGray3
        tabBar.tintColor = .systemBlue
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        viewControllers = [
            myHobbyViewController,
            otherHobbyViewController,
            updateInfoViewController
        ]
    }
}

#Preview {
    MainTabBarController()
}
