//
//  HomeController.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import UIKit

class HomeController: UIViewController, UISearchControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Properties
    
    var questionList = [QuestionModelData]()
    var categoryList = [CategoryData]()
    let bannerImageView = UIImageView()
    let searchBar = UISearchController(searchResultsController: nil)
    
    private let categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let questionCollectionView: UICollectionView = {
       
        let questionLayout = UICollectionViewFlowLayout()
        questionLayout.scrollDirection = .horizontal
        let questionCollection = UICollectionView(frame: .zero, collectionViewLayout: questionLayout)
        return questionCollection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeController()
        getQuestions()
        getCategories()
    }
    
    //MARK: - Get Questions From API
    func getQuestions() {
        
        guard let url = URL(string: "https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            let decoder = JSONDecoder()

            if let data = data {

                do {

                    let tasks = try decoder.decode([QuestionModelData].self, from: data)
                    self.questionList = tasks

                } catch {
                    print(error)
                }
            }

            DispatchQueue.main.async {
                self.questionCollectionView.reloadData()
            }
        }
        task.resume()
    }
    
    //MARK: - Get Categories From API
    
    func getCategories() {
   
        guard let url = URL(string: "https://dummy-api-jtg6bessta-ey.a.run.app/getCategories") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            let decoder = JSONDecoder()

            if let data = data {
                
                do {
                    
                    let tasks = try decoder.decode(CategoryModelData.self, from: data)
                    self.categoryList = tasks.data
                    
                } catch {
                    print(error)
                }
            }
            
            DispatchQueue.main.async {
                self.categoryCollectionView.reloadData()
            }
        }
        task.resume()
    }
    
    //MARK: - CollectionView Configuration
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == questionCollectionView {
            
            return questionList.count
            
        } else {
            
            return categoryList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == questionCollectionView {
            
            let questionCell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionCollectionCell.questionCellID, for: indexPath) as! QuestionCollectionCell
            let questionData = questionList[indexPath.row]
            questionCell.questionInfo = questionData
            return questionCell
            
        } else {
            
            let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.categoryCellID, for: indexPath) as! CategoryCollectionCell
            let categoryData = categoryList[indexPath.row]
            categoryCell.categoryInfo = categoryData
            return categoryCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == questionCollectionView {
            let height = collectionView.frame.height
            
            return CGSize(width: 222, height: height)
        } else {
            let width = (collectionView.frame.width / 2) - 2
            return CGSize(width: width, height: 154)
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    //MARK: - Configure Controller
    fileprivate func configureHomeController() {
        view.backgroundColor = .white
        navigationItem.title = "Good Afternoon! ⛅️"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        
        self.navigationItem.searchController = searchBar
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        searchBar.delegate = self
        
        view.addSubview(bannerImageView)
        bannerImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 54)
        bannerImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        bannerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        bannerImageView.backgroundColor = .black
        bannerImageView.layer.cornerRadius = 12.0
        
        view.addSubview(questionCollectionView)
        questionCollectionView.anchor(top: bannerImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 164)
        questionCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        questionCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        questionCollectionView.register(QuestionCollectionCell.self, forCellWithReuseIdentifier: QuestionCollectionCell.questionCellID)
        questionCollectionView.delegate = self
        questionCollectionView.dataSource = self
        questionCollectionView.backgroundColor = UIColor(displayP3Red: 248/255, green: 251/255, blue: 255/255, alpha: 1.0)
        
        view.addSubview(categoryCollectionView)
        categoryCollectionView.anchor(top: questionCollectionView.bottomAnchor, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        categoryCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        categoryCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        categoryCollectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.categoryCellID)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.backgroundColor = UIColor(displayP3Red: 248/255, green: 251/255, blue: 255/255, alpha: 1.0)
    }
}

