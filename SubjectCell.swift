
import UIKit

class SubjectCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var label: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "SubjectCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.layer.cornerRadius = 7.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
