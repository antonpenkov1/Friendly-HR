//
//  ViewController.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import UIKit

protocol PositionListDisplayLogic: AnyObject {
    func displayPositions(viewModel: PositionList.ShowPositions.ViewModel)
}

class PositionListViewController: UITableViewController {
    
    var interactor: PositionListBusinessLogic?
    var router: (NSObjectProtocol & PositionListRoutingLogic & PositionListDataPassing)?
    
    private var activityIndicator: UIActivityIndicatorView?
    private var rows: [PositionCellViewModelProtocol] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PositionCell")
        PositionListConfigurator.shared.configure(with: self)
        activityIndicator = showActivityIndicator(in: view)
        setupNavigationBar()
        showPositions()
    }
    
    private func showPositions() {
        interactor?.fetchPositions()
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
}

// MARK: - UITableViewDataSource
extension PositionListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.identifier, for: indexPath)
        guard let cell = cell as? PositionCell else { return UITableViewCell() }
        cell.viewModel = cellViewModel
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PositionListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rows[indexPath.row].height
    }
}

// MARK: - CourseListDisplayLogic
extension PositionListViewController: PositionListDisplayLogic {
    func displayPositions(viewModel: PositionList.ShowPositions.ViewModel) {
        rows = viewModel.rows
        activityIndicator?.stopAnimating()
        tableView.reloadData()
    }
}
