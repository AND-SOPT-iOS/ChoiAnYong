//
//  FinanceViewController.swift
//  Seminar-3
//
//  Created by 최안용 on 10/27/24.
//

import UIKit

class FinanceViewController: BaseViewController {
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeFlowLayout()
    )
    private let navigationTitleLabel = UILabel()
    private var dataSource: [FinancePageSection] = [
        FinancePageSection.banner(BannerInfo.sampleBanners),
        FinancePageSection.requiredApp(AppInfo.requiredApps),
        FinancePageSection.chargedRanking(AppInfo.chargedApps),
        FinancePageSection.freeRanking(AppInfo.freeApps)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setCollectionView()
    }
    
    override func setStyle() {
        collectionView.do {
            $0.register(
                BannerCell.self,
                forCellWithReuseIdentifier: BannerCell.identifier
            )
            
            $0.register(
                NonRankingCollectionViewCell.self,
                forCellWithReuseIdentifier: NonRankingCollectionViewCell.identifier
            )
            
            $0.register(
                RankingCollectionViewCell.self,
                forCellWithReuseIdentifier: RankingCollectionViewCell.identifier
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
        self.navigationItem.titleView = navigationTitleLabel
        self.navigationItem.backButtonTitle = "금융"
    }
    
    private func setCollectionView() {
        collectionView.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension FinanceViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSection = dataSource[indexPath.section]
        
        switch selectedSection {
            
        case .banner, .requiredApp, .chargedRanking:
            break
        case .freeRanking(let apps):
            let selectedApp = apps[indexPath.row]
            if selectedApp.title == "토스" {
                let vc = TossViewController()
                navigationController?.pushViewController(vc, animated: true)
            }            
        }
    }
}

extension FinanceViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .banner(let data):
            return data.count
        case .requiredApp(let data):
            return data.count
        case .chargedRanking(let data):
            return data.count
        case .freeRanking:
            return 9
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch dataSource[indexPath.section] {
        case .banner(let data):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCell.identifier,
                for: indexPath
            ) as! BannerCell
            cell.configure(banner: data[indexPath.row])
            return cell
            
        case .requiredApp(let data):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NonRankingCollectionViewCell.identifier,
                for: indexPath
            ) as! NonRankingCollectionViewCell
            cell.configure(app: data[indexPath.row])
            return cell
            
        case .chargedRanking(let data):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RankingCollectionViewCell.identifier,
                for: indexPath
            ) as! RankingCollectionViewCell
            cell.configure(app: data[indexPath.row])
            return cell
            
        case .freeRanking(let data):
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RankingCollectionViewCell.identifier,
                for: indexPath
            ) as! RankingCollectionViewCell
            cell.configure(app: data[indexPath.row])
            return cell
        }
    }
}

// MARK: - 섹션별 설정
extension FinanceViewController {
    private func makeFlowLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            switch self.dataSource[sectionIndex] {
            case .banner:
                return self.makeBannerSectionLayout()
            case .requiredApp,.chargedRanking, .freeRanking:
                return self.makeAppSectionLayout()
            }
        }
    }
    
    private func makeBannerSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 5,
            bottom: 0,
            trailing: 5
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .fractionalHeight(0.45)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = .init(top: 10,
                                      leading: 0,
                                      bottom: 5,
                                      trailing: 0)
        
        return section
    }
    
    private func makeAppSectionLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.33)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 5,
            bottom: 0,
            trailing: 5
        )
                
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .fractionalHeight(0.3)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item, item, item]
        )
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        section.contentInsets = .init(
            top: 10,
            leading: 0,
            bottom: 18,
            trailing: 0
        )
        section.boundarySupplementaryItems = [self.createSupplementaryHeaderItem()]
        
        return section
    }
}

// MARK: - 헤더 설정
extension FinanceViewController {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerType = setHeaderType(for: indexPath.section) else {
                return UICollectionReusableView()
            }
            switch headerType {
            case .required:
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: NonRakingReusableHeaderView.identifier,
                    for: indexPath
                ) as? NonRakingReusableHeaderView else {
                    return NonRakingReusableHeaderView()
                }
                header.configure(title: headerType.title,
                                 subTitle: "App Store 에디터가 직접 골랐습니다.")
                return header
            case .charged, .free:
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: RankingReusableHeaderView.identifier,
                    for: indexPath
                ) as? RankingReusableHeaderView else {
                    return RankingReusableHeaderView()
                }
                if case .free = headerType { header.delegate = self }
                header.configure(title: headerType.title, isArrowBtn: true)
                return header
            }
            
        default:
            return UICollectionReusableView()
        }
    }
    
    private func createSupplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension:  .fractionalWidth(0.9),
                heightDimension: .estimated(80)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
    
    private func setHeaderType(for section: Int) -> FinanceHeaderType? {
        switch dataSource[section] {
        case .banner: return nil
        case .requiredApp: return .required
        case .chargedRanking: return .charged
        case .freeRanking: return .free
        }
    }
}

extension FinanceViewController: RankingReusableHeaderViewDelegate {
    func didTapHeader() {        
        let vc = ChartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

#Preview {
    FinanceViewController()
}
