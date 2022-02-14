//
//  TableViewController.swift
//  NewsApp
//
//  Created by Alexander on 09.02.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {
    // MARK: - Public Properties
    var period = 1

    // MARK: - Private Properties
    private var newsData: NewsData!
    private var link: String {
        "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(period).json?api-key=qDyV9W9s9JO8ALEHjJqOBGPCKwEDdcql"
    }

    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.fetchData(from: link) { result in
            switch result {
            case let .success(newsData):
                self.newsData = newsData
                self.tableView.reloadData()
            case let .failure(error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        newsData?.articlesData?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        var content = cell.defaultContentConfiguration()

        content.text = newsData?.articlesData?[indexPath.row].title ?? "No title"

        let author = newsData?.articlesData?[indexPath.row].byline ?? "No author"
        let date = newsData?.articlesData?[indexPath.row].date ?? "No date"
        content.secondaryText = "\(author)\n\(date)"

        let subsection = Subsection(rawValue: newsData?.articlesData?[indexPath.row].subsection ?? "")
        content.image = UIImage(systemName: subsection?.image ?? "newspaper")

        cell.contentConfiguration = content
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        guard let detailedNewsVC = segue.destination as? DetailedNewsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }

        detailedNewsVC.result = newsData?.articlesData?[indexPath.row]
    }
}
