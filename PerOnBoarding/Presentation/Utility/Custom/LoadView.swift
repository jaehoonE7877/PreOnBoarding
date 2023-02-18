//
//  LoadView.swift
//  PerOnBoarding
//
//  Created by Seo Jae Hoon on 2023/02/18.
//

import UIKit

import SnapKit
import Then

final class LoadView: UIView {
    //Property Imageview, ProgressView, Button
    let mainImageView = UIImageView().then {
        $0.tintColor = .systemBlue
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(systemName: "photo")
    }
    
    let progressBar = UIProgressView().then {
        $0.progress = 0.5
        $0.progressTintColor = .systemBlue
        $0.trackTintColor = .lightGray
    }
    
    let loadButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("Load", for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [mainImageView, progressBar, loadButton].forEach { self.addSubview($0) }
    }
    
    private func setConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.35)
        }
        
        progressBar.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(mainImageView.snp.trailing)
            make.width.equalTo(mainImageView.snp.width)
        }
        
        loadButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(progressBar.snp.trailing)
            make.trailing.equalToSuperview()
        }
    }
}
