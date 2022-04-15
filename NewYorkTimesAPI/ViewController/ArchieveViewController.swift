//
//  ArchieveViewController.swift
//  NewYorkTimesAPI
//
//  Created by Mingyong Zhu on 4/13/22.
//

import Combine
import UIKit

class ArchieveViewController: UIViewController {
    private var viewModel = ViewModel()
    private var subscribers = Set<AnyCancellable>()
    private let cellID = "cellID"
     
    @IBOutlet weak var yearOfArticle: UITextField!
    @IBOutlet weak var monthOfArticle: UITextField!
    @IBOutlet weak var articleOviewTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Achieve Query"
        articleOviewTableview.delegate = self
        articleOviewTableview.dataSource = self
       // articleOviewTableview.register(ArticleOverviewTableViewCell.self, forCellReuseIdentifier: cellID)
        setupViewmodelDataBinding()
        yearOfArticle.text = "2021"
        monthOfArticle.text = "2"

        // Do any additional setup after loading the view.
    }
    
    func setupViewmodelDataBinding() {
        viewModel.$archievedDocument
            .receive(on: RunLoop.main)
            .sink { _ in
                self.articleOviewTableview.reloadData()
            }
            .store(in: &subscribers)
    }
    @IBAction func queryArticle(_ sender: UIButton) {
        guard let yearInput = yearOfArticle.text, let monthInput = monthOfArticle.text else {
            return
        }
        guard let year = Int(yearInput), let month = Int(monthInput) else {
            return
        }
        viewModel.getArchievedDocument(year: year, month: month)
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

extension ArchieveViewController: UITableViewDelegate {
    
}

extension ArchieveViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.archievedDocument.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ArticleOverviewTableViewCell
        
        cell.headline?.text = viewModel.archievedDocument[indexPath.row].headline.main
        cell.abstract?.text = "Abstract:  " + viewModel.archievedDocument[indexPath.row].abstract
        cell.webURL?.text = viewModel.archievedDocument[indexPath.row].webURL
        
        return cell
    }
}
