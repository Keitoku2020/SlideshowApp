import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var Images2: UIImageView!
    
    var Change2 = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        display2()
    }
    func display2(){
        
        let Pictures = [
            "Picture0", "Picture1", "Picture2",
        ]
        
        let name2 = Pictures[Change2]
        
        let image2 = UIImage(named: name2)
        Images2.image = image2
    }
}
