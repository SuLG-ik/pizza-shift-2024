//
//  PizzaTableViewCell.swift
//  pizza
//
//  Created by Володя on 06.07.2024.
//

import UIKit
import SnapKit

class PizzaTableViewCell: UITableViewCell {

    static let identifier = String(describing: PizzaTableViewCell.self)
    
    private lazy var leadingImageView =  {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    private lazy var titleLabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font.withSize(AppSizes.textTitleFontSize)
        view.textColor = AppColors.titleColor
        return view
    }()
    private lazy var descriptionLabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font.withSize(AppSizes.textSubtitleFontSize)
        view.textColor = AppColors.bodyPrimaryColor
        return view
    }()
    private lazy var priceLabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font.withSize(AppSizes.textTitleFontSize)
        view.textColor = AppColors.titleColor
        return view
    }()
    
    private lazy var titlesView: UIView = {
        let view = UIView()
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(8)
        }
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
        }
        return view
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        setupViews()
    }
    
    private func setupViews() {
        setupImage()
        setupTitles()
    }
    
    private func setupTitles() {
        self.contentView.addSubview(self.titlesView)
        self.titlesView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview()
            make.leading.equalTo(leadingImageView.snp.trailing)
        }
    }
    private func setupImage() {
        self.contentView.addSubview(self.leadingImageView)
        self.leadingImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
            make.size.equalTo(AppSizes.pizzaCellImageSize)
        }
    }
    
    
    func configure(_ data: PizzaViewModel) {
        self.titleLabel.text = data.name
        self.descriptionLabel.text = data.description
        self.leadingImageView.setImageURL(url: data.imageURL)
        self.priceLabel.text = "От \(data.minPrice) ₽"
    }
    
}
