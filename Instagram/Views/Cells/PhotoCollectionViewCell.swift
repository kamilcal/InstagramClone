//
//  PhotoCollectionViewCell.swift
//  Instagram
//
//  Created by kamilcal on 8.12.2022.
//

import UIKit
import SDWebImage


class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
    }
//    All UIView subclasses must implement init(coder:), but as you’re creating your UI in code you will also need to add init(frame:)

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: StorageManager.UserPost) {
        let url = model.thumbnailImage
        photoImageView.sd_setImage(with: url)
    }
    
    public func configure(debug  imageName: String) {
        photoImageView.image = UIImage(named: "test")
    }
}
