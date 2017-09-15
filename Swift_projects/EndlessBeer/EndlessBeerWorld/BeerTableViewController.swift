//
//  ViewController.swift
//  EndlessBeerWorld
//
//  Created by 박종찬 on 2017. 7. 18..
//  Copyright © 2017년 박종찬. All rights reserved.
//

import UIKit
import SDWebImage
import Hero

class BeerTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    private var isFreshLoading: Bool = true
    private var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isHeroEnabled = true
        self.navigationController?.heroNavigationAnimationType = .fade 
        
        //커스텀 셀 닙 파일 등록
        self.tableView.register(UINib.init(nibName: "BeerTableViewCell", bundle: Bundle.main),
                                forCellReuseIdentifier: BeerTableViewCell.reuseIdentifier)
        
        //맨 첫 페이지 로드를 위한 노티피케이션.
        observer = NotificationCenter.default.addObserver(forName: initialFetchNotificationName,
                                               object: nil,
                                               queue: OperationQueue.main) { [unowned self] _ in
            self.tableView.reloadData()
            self.animateTableViewFromBottom()
            self.isFreshLoading = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if self.isFreshLoading { //처음 진입할 때를 위한 애니메이션.
            self.tableView.reloadData()
            self.animateTableViewFromBottom()
        } else { //디테일뷰에 갔다가 돌아왔을 때를 위한 애니메이션.
//            self.animateTableViewFromLeft()
        }
    }

    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.shared.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? BeerTableViewCell else {
                                                        print("cell Dequeue에 문제 발생!")
                                                        return UITableViewCell()
        }
        let data = DataCenter.shared.dataArray[indexPath.row]
        cell.beerData = data
        cell.beerNameLabel.heroID = "beerNameLabel" + data.name
        cell.beerImageView.heroID = "beerImage" + data.name
        cell.bgView.heroID = "bg" + data.name
        cell.abvLabel.heroID = "abvLabel" + data.name
        cell.ibuLabel.heroID = "ibuLabel" + data.name
//        cell.tagLineLabel.heroID = "beerDesc" + data.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //자동으로 셀 높이 결정.
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //모든 데이터가 로컬에 들어와있지 않은 상태에서, 현재 로드된 마지막 맥주 데이터의 10개 전 셀이 그려지기 직전인
        //동시에 데이터센터가 리퀘스트를 수행중이 아니라면 서버에 새로운 데이터를 요청합니다.
        if DataCenter.shared.shouldRequestPageToServer &&
            indexPath.row > DataCenter.shared.dataArray.count - 10 &&
            !DataCenter.shared.isRequesting {
            
            DataCenter.shared.getNewPage { [unowned self] (success) in
                if success {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //cell을 sender로 segue 수행.
        self.performSegue(withIdentifier: "DetailSegue", sender: tableView.cellForRow(at: indexPath))
        self.isFreshLoading = false
    }
    
    // MARK: - IBAction
    
    @IBAction func refreshButtonTouched(_ sender: UIBarButtonItem) {
        
        DataCenter.shared.reloadDatas()
        self.tableView.reloadData()
        self.isFreshLoading = true
        
        DataCenter.shared.getNewPage { [unowned self] (success) in
            if success {
                self.tableView.reloadData()
                self.animateTableViewFromBottom()
                self.isFreshLoading = false
            }
        }
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            guard let detailViewController = segue.destination as? BeerDetailViewController else { return }
            guard let cell = sender as? BeerTableViewCell, let beerData = cell.beerData else { return }
//            detailViewController.beerImageView.heroID = cell.beerImageView.heroID
            detailViewController.beerData = beerData
        }
    }
    
    // MARK: - UIView Animation
    
    func animateTableViewFromBottom() {

        let visibleCellsArray: [UITableViewCell] = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for cell in visibleCellsArray {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0.0
        
        for cell in visibleCellsArray {
            UIView.animate(withDuration: 1.5, delay: 0.05 * index,
                           usingSpringWithDamping: 0.65,
                           initialSpringVelocity: 0,
                           options: UIViewAnimationOptions.curveEaseIn,
                           animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
            index += 1.0
        }
    }
    
    func animateTableViewFromLeft() {
        
        let translationX: CGFloat = self.view.frame.size.width
        
        var index: Double = 1.0
        
        let visibleCellsArray: [UITableViewCell] = tableView.visibleCells
        
        for cell in visibleCellsArray {
            cell.transform = CGAffineTransform(translationX: -translationX - CGFloat(10.0 * index), y: 0)
            index += 1.0
        }
        
        index = 1.0
        
        for cell in visibleCellsArray {
            UIView.animate(withDuration: 1.5,
                           delay: 0.05 * index,
                           usingSpringWithDamping: 0.55,
                           initialSpringVelocity: 0,
                           options: UIViewAnimationOptions.curveEaseIn,
                           animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
            index += 1.0
        }
    }
}
