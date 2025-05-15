//
//  OnBoardingViewController.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 14/5/25.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    
    @IBOutlet weak var onBoardingPageControl: UIPageControl!
    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    @IBOutlet weak var nextOnBoardingPageBtn: UIButton!
    
    
    var slides:[OnBoardingSlide] = []
    static let identifier:String = "OnBoardingCollectionViewCell"
    var currentPage = 0 {
        didSet{
            onBoardingPageControl.currentPage = currentPage	
            if currentPage == slides.count-1 {
                nextOnBoardingPageBtn.setTitle("Get Started", for: .normal)
            }else{
                nextOnBoardingPageBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnBoardingSlide(title: "First Page", description: "First Page Desc", image: UIImage(named: "on_boarding_1")!),
            OnBoardingSlide(title: "Second Page", description: "Second Page Desc", image: UIImage(named: "on_boarding_2")!),
            OnBoardingSlide(title: "Third Page", description: "Third Page Desc", image: UIImage(named: "on_boarding_3")!)
        ]

    }
    
    override func viewDidAppear(_ animated: Bool) {
   
    }
    @IBAction func nextOnBoardingPageClicked(_ sender: Any) {
        
        if currentPage == slides.count-1 {
            return
        }else{
            
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onBoardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
       
    }
    
}


extension OnBoardingViewController: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onBoardingCollectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingViewController.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:onBoardingCollectionView.frame.width, height: onBoardingCollectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        onBoardingPageControl.currentPage = currentPage
    }
        
}
