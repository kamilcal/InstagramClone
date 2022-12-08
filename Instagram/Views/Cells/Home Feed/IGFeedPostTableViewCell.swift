//
//  IGFeedPostTableViewCell.swift
//  Instagram
//
//  Created by kamilcal on 7.12.2022.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
//    fix sonucu:
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
