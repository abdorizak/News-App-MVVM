//
//  NewsViewController.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/6/23.
//

import UIKit

class NewsViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.idetifier)
        return cv
    }()
    
    private var articleViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configVC()
    }
    
    private func configVC() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        navigationItem.title = "News"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.dataSource = self
        collectionView.delegate = self
        configCollectionView()
        newsData()
    }
    
    
    private func configCollectionView() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func newsData() {
        Showloading("Loading...")
        Task {
            do {
                let articles = try await NetworkManager.shared.getArticles()
                articleViewModel = ArticleListViewModel(article: articles)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.dismissLoading()
                }
            } catch {
                print(error.localizedDescription)
                dismissLoading()
            }
        }
    }
    
    
    
}


extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = self.articleViewModel.articleAtIndex(indexPath.item)
        UIApplication.shared.open(URL(string: article.url_content)!)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.articleViewModel == nil ? 0 : self.articleViewModel.numberofSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articleViewModel.numberOfRowsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.idetifier, for: indexPath) as! NewsCollectionViewCell
        let article = self.articleViewModel.articleAtIndex(indexPath.item)
        cell.display(article)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 16, height: 330)
    }
    
    //  If unspecified default value of 10 is used.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // Only top and bottom spaced if vertical scrolling (dependent on scroll direction)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: -10, bottom: 30, right: -10)
    }
    
}
