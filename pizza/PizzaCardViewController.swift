//
//  PizzaCardViewController.swift
//  pizza
//
//  Created by Володя on 07.07.2024.
//

import UIKit

class PizzaCardViewController: UIViewController {

    var dataSource: [PizzaViewModel] = []
    
    var selectedIndex = 0
    
    private let content = {
        let view = UIStackView()
        view.spacing = AppSizes.stackViewSpacing
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    private let titleLabel = {
        let view = UILabel()
        view.font.withSize(AppSizes.textTitleLargeFontSize)
        view.textColor = AppColors.titleColor
        return view
    }()
    
    private let subtitleLabel = {
        let view = UILabel()
        view.font.withSize(AppSizes.textSubtitleFontSize)
        view.textColor = AppColors.bodyPrimaryColor
        return view
    }()
    
    private let descriptionLabel = {
        let view = UILabel()
        view.font.withSize(AppSizes.textDescriptionFontSize)
        view.textColor = AppColors.bodyPrimaryColor
        return view
    }()
    
    private lazy var infoContent = {
        let view = UIStackView()
        view.spacing = AppSizes.titlesSpacing
        view.axis = .vertical
        view.addArrangedSubview(titleLabel)
        view.addArrangedSubview(subtitleLabel)
        view.addArrangedSubview(descriptionLabel)
        return view
    }()
    
    private let mainImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Пицца"
    }
    
    private func configure(with data: PizzaViewModel) {
        self.mainImageView.setImageURL(url: data.imageURL)
        self.titleLabel.text = data.name
    }
    
    private func setupViews() {
        setupContent()
        setupMainImage()
        setupInfoBlock()
    }
    
    private func setupContent() {
        self.view.addSubview(content)
        self.content.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupMainImage() {
        self.content.addArrangedSubview(mainImageView)
    }
    
    private func setupInfoBlock() {
        self.content.addArrangedSubview(infoContent)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
