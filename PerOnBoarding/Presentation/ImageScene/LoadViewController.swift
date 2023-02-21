//
//  LoadViewController.swift
//  PerOnBoarding
//
//  Created by Seo Jae Hoon on 2023/02/18.
//

import UIKit

final class LoadViewController: UIViewController {
    
    var mainView = LoadView()
    
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
    }
    
}

extension LoadViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = mainView.tableView.dequeueReusableCell(withIdentifier: LoadTableViewCell.reuseIdentifier, for: indexPath) as? LoadTableViewCell else { return UITableViewCell()}
        
        
        
        return cell
    }
    
    
    
    
}
