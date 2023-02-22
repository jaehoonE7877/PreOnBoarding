//
//  LoadView.swift
//  PerOnBoarding
//
//  Created by Seo Jae Hoon on 2023/02/18.
//

import UIKit

import SnapKit
import Then

final class LoadTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "LoadTableViewCell"
    
    let mainImageView = UIImageView().then {
        $0.tintColor = .systemBlue
        $0.contentMode = .scaleToFill
    }
    
    let progressBar = UIProgressView().then {
        $0.progress = 0.5
        $0.progressTintColor = .systemBlue
        $0.trackTintColor = .lightGray
    }
    
    let loadButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .systemBlue
        $0.setTitle("Load", for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [mainImageView, progressBar, loadButton].forEach { contentView.addSubview($0) }
    }
    
    private func setConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        loadButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(84)
        }
        
        progressBar.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(mainImageView.snp.trailing)
            make.trailing.equalTo(loadButton.snp.leading)
        }
        
        
    }
    
}
