
import UIKit

class ConvertTableViewCell: UITableViewCell {
    
    static let identifier = "ConvertTableViewCell"

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
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.separator
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImage)
        contentView.addSubview(countryLabel)
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
            y: 28,
            width: labelWidth,
            height: 20
        )
    
        separator.frame = CGRect(
            x: labelStartX,
            y: contentView.frame.height - 1,
            width: contentView.frame.width - labelStartX - padding,
            height: 1
        )
    }
    
    public func configure(with model: ConvertOption) {
        iconImage.image = model.bgimg
        countryLabel.text = model.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
