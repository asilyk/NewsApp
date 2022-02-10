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
    private var link: String{
        "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(period).json?api-key=qDyV9W9s9JO8ALEHjJqOBGPCKwEDdcql"
    }

    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.fetchData(from: link) { result in
            switch result {
            case .success(let newsData):
                DispatchQueue.main.async {
                    self.newsData = newsData
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsData?.results?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        var content = cell.defaultContentConfiguration()

        content.text = newsData?.results?[indexPath.row].title ?? "No title"
        
        let author = newsData?.results?[indexPath.row].byline ?? "No author"
        let date = newsData?.results?[indexPath.row].published_date ?? "No date"
        content.secondaryText = "\(author)\n\(date)"

        let subsection = newsData?.results?[indexPath.row].subsection ?? ""
        content.image = chooseImage(for: subsection)

        cell.contentConfiguration = content
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedNewsVC = segue.destination as? DetailedNewsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }

        detailedNewsVC.result = newsData?.results?[indexPath.row]
    }

    //MARK: - Private Methods
    private func chooseImage(for subsection: String) -> UIImage? {
        let subsection = Subsection(rawValue: subsection)
        let image: String
        switch subsection {
        case .politics: image = "person"
        case .olympics: image = "sportscourt"
        case .europe, .africa: image = "globe"
        case .media: image = "play"
        case .music: image = "music.note"
        case .television: image = "tv"
        default: image = "newspaper"
        }
        return UIImage(systemName: image)
    }
}
