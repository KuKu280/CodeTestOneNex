//
//  AnnouncementView.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import UIKit

class AnnouncementView: NibBasedView {
    
    @IBOutlet private(set) var tableView: UITableView!
    
    var annoncements = [Announcement]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    struct Announcement {
        let name: String
        let date: String
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
        cell.lineView.isHidden = indexPath.row == 1
        cell.selectionStyle = .none
        let announcement = annoncements[indexPath.row]
        cell.render(title: announcement.name)
        cell.render(date: announcement.date)
        return cell
    }
}
