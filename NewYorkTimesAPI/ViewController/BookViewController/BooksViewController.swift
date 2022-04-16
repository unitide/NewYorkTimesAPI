//
//  BooksViewController.swift
//  NewYorkTimesAPI
//
//  Created by Mingyong Zhu on 4/16/22.
//

import UIKit

class BooksViewController: UIViewController {
    let cellID = "cellID"
    let viewmodel = BookQueryViewModel()
    
    private lazy var  bookQueryOptionsTableview: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "Books Bestseller"
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        bookQueryOptionsTableview.dataSource = self
        bookQueryOptionsTableview.delegate = self
        bookQueryOptionsTableview.reloadData()
        
        bookQueryOptionsTableview.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        bookQueryOptionsTableview.frame = self.view.bounds
        bookQueryOptionsTableview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bookQueryOptionsTableview)
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

extension BooksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let viewController = GetBestSellersListViewController()
            addViewContronllerToNavigation(viewController: viewController)
            
        case 1:
            let viewController = GetBestSellersListByDateViewController()
            addViewContronllerToNavigation(viewController: viewController)
            
        case 2:
            let viewController = GetBestSellersListHistoryViewController()
            addViewContronllerToNavigation(viewController: viewController)
        case 3:
            let viewController = GetAllBestSellersListForSpecifiedDateViewController()
            addViewContronllerToNavigation(viewController: viewController)
        case 4:
            let viewController = GetBestSellersListNamesViewController()
            addViewContronllerToNavigation(viewController: viewController)
        case 5:
            let viewController = GetTopFiveBestSellersListViewController()
            addViewContronllerToNavigation(viewController: viewController)
        case 6:
            let viewController = GetTopBookViewsViewController()
            addViewContronllerToNavigation(viewController: viewController)
            
        default:
            return
        }
    }
    private func addViewContronllerToNavigation(viewController: UIViewController) {
        if let navi = self.navigationController {
            navi.pushViewController(viewController, animated: true)
        }
    }
}
extension BooksViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.bookQueryOptions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = viewmodel.bookQueryOptions[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        cell.textLabel?.textColor = .red
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
}
