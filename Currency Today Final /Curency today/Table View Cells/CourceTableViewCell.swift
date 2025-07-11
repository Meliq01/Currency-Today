//
//  CourceTableViewCell.swift
//  Curency today
//
//  Created by Student on 03.07.25.
//

import UIKit

class CourceTableViewCell: UITableViewCell {
    
    static let identifier = "CourceTableViewCell"
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()

    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let courseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .right
        label.textColor = .label
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.separator
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImage)
        contentView.addSubview(countryLabel)
        contentView.addSubview(currencyLabel)
        contentView.addSubview(courseLabel)
        contentView.addSubview(separator)
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding: CGFloat = 12
        let imageSize: CGFloat = contentView.frame.height - padding * 2
        
        iconImage.frame = CGRect(
            x: padding,
            y: padding,
            width: imageSize,
            height: imageSize
        )
        
        let labelStartX = iconImage.frame.maxX + 12
        let labelWidth = contentView.frame.width - labelStartX - 80
        
        countryLabel.frame = CGRect(
            x: labelStartX,
            y: padding,
            width: labelWidth,
            height: 20
        )
        
        currencyLabel.frame = CGRect(
            x: labelStartX,
            y: countryLabel.frame.maxY + 2,
            width: labelWidth,
            height: 18
        )
        
        courseLabel.frame = CGRect(
            x: contentView.frame.width - padding - 60,
            y: (contentView.frame.height - 22)/2,
            width: 60,
            height: 22
        )
        
        separator.frame = CGRect(
            x: labelStartX,
            y: contentView.frame.height - 1,
            width: contentView.frame.width - labelStartX - padding,
            height: 1
        )
    }
    
    public func configure(with model: CourceOption) {
        iconImage.image = model.backgroundImage
        countryLabel.text = model.name
        currencyLabel.text = model.currency
        courseLabel.text = model.course
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
