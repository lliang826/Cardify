//
//  TestViewController.swift
//  Cardify
//
//  Created by user218033 on 6/22/22.
//
// ScrollView and PageControl from https://www.youtube.com/watch?v=EKAVB_56RIU
// Flip animation from https://www.youtube.com/watch?v=4kSLbuB-MlU

import UIKit

class TestViewController: UIViewController {
    
    var studySet: StudySet?
    var scrollViewIndex = 0
    var isFacingFront = true
    var pages: [UIButton] = []
    
    private let scrollView = UIScrollView()
    
    private lazy var pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.numberOfPages = (self.studySet?.content.count)!
        pageControl.backgroundColor = .systemBlue
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        view.addSubview(pageControl)
        view.addSubview(scrollView)
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset((CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0)), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: view.frame.size.height-170, width: view.frame.size.width-20, height: 30)
        
        scrollView.frame = CGRect(x: 0, y: 110, width: view.frame.size.width, height: view.frame.size.height - 300)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width*CGFloat((studySet?.content.count)!), height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true

        let colors: [UIColor] = [
            .systemRed,
            .systemGray,
            .systemGreen,
            .systemOrange,
            .systemPurple
        ]

        for x in 0..<(studySet?.content.count)! {
            
            let content = studySet?.content[x]
            let contentArray = content?.components(separatedBy: "@")
            let question: String = contentArray![0]
            
            let page = UIButton(frame: CGRect(x: CGFloat(x) * view.frame.size.width + 20, y: 0, width: view.frame.size.width - 40, height: scrollView.frame.size.height))
            page.backgroundColor = colors[x % 5]
            page.addTarget(self, action: #selector(flipCard(sender:)), for: .touchUpInside)
            page.setTitle(question, for: .normal)
            page.titleLabel?.numberOfLines = 0
            page.titleLabel?.textAlignment = .center
            page.titleEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            
            scrollView.addSubview(page)
            
            pages.append(page)
        }
    }
    
    @objc func flipCard(sender: UIButton!) {
        
        let content = studySet?.content[scrollViewIndex]
        let contentArray = content?.components(separatedBy: "@")
        let question: String = contentArray![0]
        let answer: String = contentArray![1]
        
        if isFacingFront {
            isFacingFront = false
            pages[scrollViewIndex].setTitle(answer, for: .normal)
            UIView.transition(with: pages[scrollViewIndex], duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            isFacingFront = true
            pages[scrollViewIndex].setTitle(question, for: .normal)
            UIView.transition(with: pages[scrollViewIndex], duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }

    }
}

extension TestViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewIndex = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        pageControl.currentPage = scrollViewIndex
    }
}
