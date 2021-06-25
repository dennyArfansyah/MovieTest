//
//  ReviewView.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import UIKit

extension ReviewController {
    
    func setupLayout() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UITableView()
        tableView.tableHeaderView = UITableView()
        
        view.addSubview(noReviewFoundLabel)
        noReviewFoundLabel.numberOfLines = 0
        noReviewFoundLabel.font = UIFont.boldSystemFont(ofSize: 15)
        noReviewFoundLabel.text = Constants.noReviewFound
        noReviewFoundLabel.textAlignment = .center
        noReviewFoundLabel.anchorCenterXToSuperview()
        noReviewFoundLabel.anchor(view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noReviewFoundLabel.isHidden = reviewViewModel.reviews?.count ?? 0 > 0 ? true : false
        return reviewViewModel.reviews?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let genre = reviewViewModel.reviews?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = genre?.author
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == reviewViewModel.reviews?.count ?? 0 - 1 {
            perform(#selector(loadMore))
        }
    }
    
    @objc func loadMore() {
        reviewViewModel.page += 1
        reviewViewModel.getRequest()
    }
    
}
