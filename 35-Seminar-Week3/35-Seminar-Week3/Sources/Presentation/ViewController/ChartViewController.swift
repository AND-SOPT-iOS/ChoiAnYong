//
//  ChartViewController.swift
//  Seminar-3
//
//  Created by 최안용 on 10/26/24.
//

import UIKit

class ChartViewController: BaseViewController {
    private let navigationTitleLabel = UILabel()
    private let tableView = UITableView()
    private let appList = AppInfo.freeApps
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
    }
    
    override func setStyle() {
        view.addSubview(tableView)
    }
    
    override func setUI() {
        navigationTitleLabel.do {
            $0.text = "인기 차트"
            $0.font = .systemFont(ofSize: 17, weight: .semibold)
        }
        
        tableView.do {
            $0.register(PopularChartCell.self, forCellReuseIdentifier: PopularChartCell.identifier)
            $0.rowHeight = 80
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
        }
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.horizontalEdges.verticalEdges.equalToSuperview()
        }
    }
    
    private func setNavigationBar() {
        self.navigationItem.titleView = navigationTitleLabel
        self.navigationItem.backButtonTitle = "인기 차트"
    }
}

extension ChartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedApp = appList[indexPath.row]
        if selectedApp.title == "토스" {
            let vc = TossViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PopularChartCell.identifier,
            for: indexPath
        ) as? PopularChartCell else { return UITableViewCell() }
        cell.configure(app: appList[indexPath.row])
        return cell
    }
}

#Preview {
    ChartViewController()
}
