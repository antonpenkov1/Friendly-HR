//
//  PositionDetailsViewController.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import UIKit

protocol PositionDetailsDisplayLogic: AnyObject {
    func displayPositionDetails(viewModel: PositionDetailsViewModel)
}

class PositionDetailsViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var positionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    private lazy var positionNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var payRateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var technologyStackLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var positionDescriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var companyDescriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var interactor: PositionDetailsBusinessLogic?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        PositionDetailsConfigurator.shared.configure(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        PositionDetailsConfigurator.shared.configure(with: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passRequest()
        setupSubviews(
            positionImageView,
            positionNameLabel,
            payRateLabel,
            technologyStackLabel,
            positionDescriptionLabel,
            companyDescriptionLabel
        )
    }
    
    private func passRequest() {
        interactor?.providePositionDetails()
    }
}

// MARK: - PositionDetailsDisplayLogic
extension PositionDetailsViewController: PositionDetailsDisplayLogic {
    func displayPositionDetails(viewModel: PositionDetailsViewModel) {
        positionImageView.image = UIImage(data: viewModel.imageData)
        positionNameLabel.text = viewModel.positionName
        payRateLabel.text = viewModel.payRate
        technologyStackLabel.text = viewModel.technologyStack
        positionDescriptionLabel.text = viewModel.positionDescription
        companyDescriptionLabel.text = viewModel.companyDescription
    }
}

// MARK: - Setup UI
private extension PositionDetailsViewController {
    func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            positionImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            positionImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            positionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            positionImageView.heightAnchor.constraint(equalToConstant: 60),
            positionImageView.widthAnchor.constraint(equalToConstant: 60)
            ])
        
        NSLayoutConstraint.activate([
            positionNameLabel.topAnchor.constraint(equalTo: positionImageView.topAnchor, constant: 40),
            positionNameLabel.leadingAnchor.constraint(equalTo: positionImageView.leadingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            payRateLabel.topAnchor.constraint(equalTo: positionNameLabel.topAnchor, constant: 20),
            payRateLabel.leadingAnchor.constraint(equalTo: positionImageView.leadingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            technologyStackLabel.topAnchor.constraint(equalTo: payRateLabel.topAnchor, constant: 20),
            technologyStackLabel.leadingAnchor.constraint(equalTo: positionImageView.leadingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            positionDescriptionLabel.topAnchor.constraint(equalTo: technologyStackLabel.topAnchor, constant: 20),
            positionDescriptionLabel.leadingAnchor.constraint(equalTo: positionImageView.leadingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            companyDescriptionLabel.topAnchor.constraint(equalTo: positionDescriptionLabel.topAnchor, constant: 20),
            companyDescriptionLabel.leadingAnchor.constraint(equalTo: positionImageView.leadingAnchor),
            ])
    }
}

//#Preview {
//    PositionDetailsViewController()
//}
