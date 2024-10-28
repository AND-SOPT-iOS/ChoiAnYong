//
//  ViewController.swift
//  35-Seminar-Week2
//
//  Created by 최안용 on 10/16/24.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    private let tossIcon = UIImageView()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let appHearderView = AppHeaderView()
    private let appInfoView = AppInfoView()
    private let versionView = VersionView()
    private let appPreview = AppPreview()
    private let appDescriptionView = AppDescriptionView()
    private let reviewView = ReviewView()
    private let evaluationView = EvaluationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setAddTarget()
    }

    
    private func setStyle() {
        self.view.backgroundColor = .systemBackground
        
        tossIcon.do {
            $0.image = .tossIcon
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = .white
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 25
            $0.layer.borderWidth = 0.4
            $0.layer.borderColor = UIColor.systemGray2.cgColor
        }
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubViews(contentView)
        
        contentView.addSubViews(appHearderView,
                                appInfoView,
                                versionView,
                                appPreview,
                                appDescriptionView,
                                reviewView,
                                evaluationView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        appHearderView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        appInfoView.snp.makeConstraints {
            $0.top.equalTo(appHearderView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        versionView.snp.makeConstraints {
            $0.top.equalTo(appInfoView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        appPreview.snp.makeConstraints {
            $0.top.equalTo(versionView.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        appDescriptionView.snp.makeConstraints {
            $0.top.equalTo(appPreview.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
            
        }
        
        reviewView.snp.makeConstraints {
            $0.top.equalTo(appDescriptionView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        evaluationView.snp.makeConstraints {
            $0.top.equalTo(reviewView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(30)
        }
    }
    
    func setAddTarget() {
        versionView.versionHistoryButton.addTarget(self, action: #selector(versionHistoryButtonTapped), for: .touchUpInside)
        
        reviewView.seeAllReviewButton.addTarget(self, action: #selector(seeAllReviewButtonTapped), for: .touchUpInside)
    }
    
    @objc func versionHistoryButtonTapped() {
        let nextViewController = VersionHistoryViewController()
        self.navigationController?.pushViewController(nextViewController,
                                                      animated: true)
    }
    
    @objc func seeAllReviewButtonTapped() {
        let nexViewController = SeeAllReviewViewController()
        self.navigationController?.pushViewController(nexViewController, animated: true)
        
    }
    
}

#Preview {
    ViewController()
}
