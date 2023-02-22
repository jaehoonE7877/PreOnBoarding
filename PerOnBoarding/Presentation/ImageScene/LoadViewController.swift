//
//  LoadViewController.swift
//  PerOnBoarding
//
//  Created by Seo Jae Hoon on 2023/02/18.
//

import UIKit

import Kingfisher

final class LoadViewController: UIViewController {
    
    var mainView = LoadView()
    
    private let apiService = APIService.shared
        
    var imageArray: [UIImage?] = Array(repeating: nil, count: 5) {
        didSet {
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        }
    }
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.backgroundColor = .systemBackground
        mainView.loadAllButton.addTarget(self, action: #selector(loadAllButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loadAllButtonTapped(){
        print("load All Button")
    }
}

extension LoadViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = mainView.tableView.dequeueReusableCell(withIdentifier: LoadTableViewCell.reuseIdentifier, for: indexPath) as? LoadTableViewCell else { return UITableViewCell()}
        
        cell.loadButton.tag = indexPath.row
        
        cell.loadButton.addTarget(self, action: #selector(loadButtonTapped(sender:)), for: .touchUpInside)
        
        cell.mainImageView.image = imageArray[indexPath.row]
        
        return cell
    }
    
    @objc private func loadButtonTapped(sender: UIButton) {
        
        apiService.request { result in
            switch result {
            case .success(let result):
                guard let url = URL(string: result?.urls.thumb ?? "") else { return }
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imageArray[sender.tag] = UIImage(data: data!) ?? UIImage(systemName: "photo")
                }
                
            case .failure(let error):
                print(error.errorDescription ?? "에러입니다.")
            }
        }
    }
    
}
