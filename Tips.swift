import UIKit

class Tips: UIViewController {
    
    var myControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        let coloredPensVC = coloredPensTip()
        myControllers.append(coloredPensVC)
        
        let constantPacingVC = constantPacingTip()
        myControllers.append(constantPacingVC)
        
        let musicVC = MusicTip()
        myControllers.append(musicVC)
        
        let notificationVC = noNearbyDeviceTip()
        myControllers.append(notificationVC)
        
        let breatheVC = breatheTip()
        myControllers.append(breatheVC)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.presentPageVC()
        })
    }
    
    func presentPageVC() {
        guard let first = myControllers.first else { return }
        let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        
        vc.delegate = self
        vc.dataSource = self
        
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        
        present(vc, animated: true)
    }
}

extension Tips: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = myControllers.firstIndex(of: viewController), index > 0 else { return nil }
        
        let before = index - 1
        
        return myControllers[before]
     }
     
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = myControllers.firstIndex(of: viewController), index < (myControllers.count - 1) else { return nil }
        
        let after = index + 1
        
        return myControllers[after]
     }
    
}
