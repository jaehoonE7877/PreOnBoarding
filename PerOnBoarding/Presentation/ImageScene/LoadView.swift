//
//  LoadView.swift
//  PerOnBoarding
//
//  Created by Seo Jae Hoon on 2023/02/21.
//

import UIKit

import SnapKit
import Then

final class LoadView: UIView {
    
    lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.isUserInteractionEnabled = true
        $0.rowHeight = 100
        $0.allowsSelection = false
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
        $0.register(LoadTableViewCell.self, forCellReuseIdentifier: LoadTableViewCell.reuseIdentifier)
        $0.isScrollEnabled = false
        $0.separatorStyle = .none
    }
    
    let loadAllButton = UIButton().then {
        $0.setTitle("Load All Images", for: .normal)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .systemBlue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        [tableView, loadAllButton].forEach { self.addSubview($0) }
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(500)
        }
        
        loadAllButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(tableView.snp.horizontalEdges)
            make.height.equalTo(44)
        }
    }
}
