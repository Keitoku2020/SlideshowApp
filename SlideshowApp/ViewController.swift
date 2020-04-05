import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Images: UIImageView!
    @IBOutlet weak var Forward: UIButton!
    @IBOutlet weak var Behind: UIButton!
    @IBOutlet weak var StartStop0: UIButton!

    var Change = 0
    
    var Switch = 0
    
    var timer: Timer!
    
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "Picture0")
        Images.image = image
    }
    
    @IBAction func Move(_ sender: Any) {
    }
    
    @IBAction func Return(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func Next(_ sender: Any) {
        
        if Change <= 1 {
            Change += 1
        } else {
            Change = 0
        }
        
        display()
    }
    
    @IBAction func Back(_ sender: Any) {

        if Change >= 1 {
            Change -= 1
        } else {
            Change = 2
        }
        
        display()
    }

    func display(){
        let Pictures = [
            "Picture0", "Picture1", "Picture2",
        ]
        
        let name = Pictures[Change]
        
        let image = UIImage(named: name)
        Images.image = image
    }
    
    @IBAction func StartStop(_ sender: Any) {
        
        if Switch == 0 {
            Switch += 1
        } else if Switch == 1 {
            Switch -= 1
        }
        
        if Switch == 1 {
            StartStop0.setTitle("停止", for: .normal)
            Forward.isEnabled = false
            Behind.isEnabled = false
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
        } else if Switch == 0 {
            StartStop0.setTitle("再生", for: .normal)
            Forward.isEnabled = true
            Behind.isEnabled = true
            self.timer.invalidate()
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        
        if Change <= 1 {
            Change += 1
        } else {
            Change = 0
        }
        
        display()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if Switch == 1 {
            StartStop0.setTitle("再生", for: .normal)
            Forward.isEnabled = true
            Behind.isEnabled = true
            self.timer.invalidate()
            Switch = 0
        }
        
        let resultViewController:ResultViewController = segue.destination as! ResultViewController

        resultViewController.Change2 = Change
    }
}
