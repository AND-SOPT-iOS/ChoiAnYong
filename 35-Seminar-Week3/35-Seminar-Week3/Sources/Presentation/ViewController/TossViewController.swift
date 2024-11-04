//
//  TossViewController.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import UIKit

class TossViewController: BaseViewController {
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeFlowLayout()
    )
    private let navigationTitleLabel = UILabel()
    private var dataSource: [TossPageSection] = [
        TossPageSection.appHeader,
        TossPageSection.appInfo,
        TossPageSection.appVersion,
        TossPageSection.preview(PreviewInfo.previewInfos),
        TossPageSection.deviceType,
        TossPageSection.appDescription,
        TossPageSection.review,
        TossPageSection.detailReview(ReviewInfo.reviews),
        TossPageSection.evaluation
    ]
    private var selectedHeaderType: TossHeaderType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setCollectionView()
    }
    
    override func setStyle() {
        collectionView.do {
            $0.register(
                AppDescriptionCell.self,
                forCellWithReuseIdentifier: AppDescriptionCell.identifier
            )
            
            $0.register(
                AppHeaderCell.self,
                forCellWithReuseIdentifier: AppHeaderCell.identifier
            )
            
            $0.register(
                AppInfoCell.self,
                forCellWithReuseIdentifier: AppInfoCell.identifier
            )
            
            $0.register(
                AppPreviewCell.self,
                forCellWithReuseIdentifier: AppPreviewCell.identifier
            )
            
            $0.register(
                AppVersionCell.self,
                forCellWithReuseIdentifier: AppVersionCell.identifier
            )
            
            $0.register(
                DetailReviewCell.self,
                forCellWithReuseIdentifier: DetailReviewCell.identifier
            )
            
            $0.register(
                DeviceTypeCell.self,
                forCellWithReuseIdentifier: DeviceTypeCell.identifier
            )
            
            $0.register(
                EvaluationCell.self,
                forCellWithReuseIdentifier: EvaluationCell.identifier
            )
            
            $0.register(
                ReviewCell.self,
                forCellWithReuseIdentifier: ReviewCell.identifier
            )
            
            $0.register(
                NonRakingReusableHeaderView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: NonRakingReusableHeaderView.identifier
            )
            
            $0.register(
                RankingReusableHeaderView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: RankingReusableHeaderView.identifier)
        }
        
        navigationTitleLabel.do {
            $0.text = "금융"
            $0.font = .systemFont(ofSize: 18, weight: .semibold)
        }
    }
    
    override func setUI() {
        view.addSubview(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setNavigationBar() {
        self.navigationItem.backButtonTitle = "뒤로"
    }
    
    private func setCollectionView() {
        collectionView.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension TossViewController: UICollectionViewDelegate {
    
}

extension TossViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .appHeader, .appInfo, .appVersion,.deviceType, .appDescription, .review, .evaluation:
            return 1
        case .preview(let data):
            return data.count
        case .detailReview(let data):
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch dataSource[indexPath.section] {
            
        case .appHeader:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppHeaderCell.identifier,
                for: indexPath
            ) as! AppHeaderCell
            return cell
        case .appInfo:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppInfoCell.identifier,
                for: indexPath
            ) as! AppInfoCell
            return cell
        case .appVersion:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppVersionCell.identifier,
                for: indexPath
            ) as! AppVersionCell
            return cell
        case .preview(let data):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppPreviewCell.identifier,
                for: indexPath
            ) as! AppPreviewCell
            cell.configure(previewImage: data[indexPath.row])
            return cell
        case .deviceType:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DeviceTypeCell.identifier,
                for: indexPath
            ) as! DeviceTypeCell
            return cell
        case .appDescription:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppDescriptionCell.identifier,
                for: indexPath
            ) as! AppDescriptionCell
            return cell
        case .review:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ReviewCell.identifier,
                for: indexPath
            ) as! ReviewCell
            return cell
        case .detailReview(let data):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DetailReviewCell.identifier,
                for: indexPath
            ) as! DetailReviewCell
            cell.configure(review: data[indexPath.row])
            return cell
        case .evaluation:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: EvaluationCell.identifier,
                for: indexPath
            ) as! EvaluationCell
            return cell
        }
    }
}

// MARK: - 섹션별 설정
extension TossViewController {
    private func makeFlowLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            switch self.dataSource[sectionIndex] {
            case .appHeader:
                return self.makeHeaderSectionLayout()
            case .appInfo:
                return self.makeAppInfoSectionLayout()
            case .appVersion:
                return self.makeAppVersionSectionLayout()
            case .deviceType:
                return self.makeDeviceTypeSectionLayout()
            case .appDescription:
                return self.makeAppDescriptionSectionLayout()
            case .review:
                return self.makeReviewSectionLayout()
            case .evaluation:
                return self.makeEvaluationSectionLayout()
            case .preview:
                return self.makePreviewSectionLayout()
            case .detailReview:
                return self.makeDetailReviewSectionLayout()
            }
        }
    }
    
    private func makeHeaderSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(118)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 0,
            leading: 20,
            bottom: 0,
            trailing: 20
        )
        
        return section
    }
    
    private func makeAppInfoSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(85)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 20,
            leading: 20,
            bottom: 10,
            trailing: 20
        )
        
        return section
    }
    
    private func makeAppVersionSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 10,
            leading: 20,
            bottom: 40,
            trailing: 20
        )
        
        section.boundarySupplementaryItems = [self.createSupplementaryHeaderItem()]
        
        return section
    }
    
    private func makeDeviceTypeSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 20,
            leading: 20,
            bottom: 0,
            trailing: 20
        )
        
        return section
    }
    
    private func makeAppDescriptionSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(130)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 20,
            leading: 20,
            bottom: 40,
            trailing: 20
        )
        
        return section
    }
    
    private func makePreviewSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 10
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.62),
            heightDimension: .fractionalHeight(0.67)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = .init(
            top: 20,
            leading: 20,
            bottom: 0,
            trailing: 10
        )
        
        section.boundarySupplementaryItems = [self.createSupplementaryHeaderItem()]
        
        return section
    }
    
    private func makeReviewSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(90)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 20,
            leading: 20,
            bottom: 0,
            trailing: 20
        )
        
        section.boundarySupplementaryItems = [self.createSupplementaryHeaderItem()]
        
        return section
    }
    
    private func makeDetailReviewSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 10
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .fractionalHeight(0.25)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = .init(
            top: 20,
            leading: 20,
            bottom: 0,
            trailing: 10
        )
        return section
    }
    
    private func makeEvaluationSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(120)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 20,
            leading: 20,
            bottom: 0,
            trailing: 20
        )
        
        return section
    }
}

// MARK: - 헤더 설정
extension TossViewController {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerType = setHeaderType(for: indexPath.section) else {
                return UICollectionReusableView()
            }
            
            switch headerType {
            default:
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: RankingReusableHeaderView.identifier,
                    for: indexPath
                ) as? RankingReusableHeaderView else {
                    return RankingReusableHeaderView()
                }
                
                if headerType != .preview {
                    selectedHeaderType = headerType
                    header.configure(title: headerType.title, isArrowBtn: true)
                    header.delegate = self
                } else {
                    header.configure(title: headerType.title, isArrowBtn:  false)
                    header.delegate = nil
                }
                
                return header
            }
        default:
            return UICollectionReusableView()
        }
    }
    
    private func createSupplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension:  .fractionalWidth(1),
                heightDimension: .estimated(80)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
    
    private func setHeaderType(for section: Int) -> TossHeaderType? {
        switch dataSource[section] {
        case .appHeader,.appInfo, .deviceType, .appDescription, .detailReview, .evaluation:
            return nil
        case .appVersion:
            return .newNews
        case .preview:
            return .preview
        case .review:
            return .review
        }
    }
}

extension TossViewController: RankingReusableHeaderViewDelegate {
    func didTapHeader() {
        guard let headerType = selectedHeaderType else { return }

        let vc: UIViewController
        switch headerType {
        case .newNews:
            vc = VersionHistoryViewController()
        case .review:
            vc = SeeAllReviewViewController()
        default:
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

#Preview {
    TossViewController()
}
