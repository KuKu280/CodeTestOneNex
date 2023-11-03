//
//  AnnouncementView.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import UIKit

class AnnouncementView: NibBasedView {
    
    @IBOutlet private(set) var tableView: UITableView!
    
    var annoncements = [String]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(
            AnnouncementItemCell.self,
            forCellReuseIdentifier: "itemcell"
        )
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension AnnouncementView: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return tableView.estimatedRowHeight
    }
}

extension AnnouncementView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(2,annoncements.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "itemcell",
            for: indexPath
        ) as! AnnouncementItemCell
        cell.selectionStyle = .none
        cell.render(title: annoncements[indexPath.row])
        return cell
    }
}
