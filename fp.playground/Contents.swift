//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

typealias Num = (Int?) -> Int?

func myadd(_ a: Int) -> Num {
    print("myadd")
    return { num in
        guard let value: Int = num else {
            return nil
        }
        return value + a
    }
}

func convert(_ str: String?) -> Int? {
    guard let string: String = str else {
        return nil
    }
    return Int(string)
}

func convert2(_ num: Int?) -> String? {
    guard let number: Int = num else {
        return nil
    }
    return String(number)
}

func f(_ a: Int) -> (String?) -> String? {
    print("f")
    let add = myadd(a)
    return { string in
        guard let str: String = string else {
            return nil
        }
        guard let num: Int = add(Int(str)) else {
            return nil
        }
        return String(num)
    }
}

func fizzBuzzMaker(_ a: Int) -> (_ str: String) -> (Int) -> String {
    return { str in { num in
        if num % a == 0 {
            return str
        } else {
            return ""
        }
    }}
}

let fizz: (Int) -> String = fizzBuzzMaker(3)("fizz")
let buzz: (Int) -> String = fizzBuzzMaker(5)("buzz")

func fizzBuzz(num: Int) -> String {
    let str: String = fizz(num) + buzz(num)
    if str == "" {
        return String(num)
    } else {
        return str
    }
}


struct Post {
    let id: Int
    let title: String
    let userId: Int
}

struct User {
    let id: Int
    let nick: String
}

var posts: [Post] = [
    Post(id: 1, title: "AA", userId: 1),
    Post(id: 2, title: "BB", userId: 2),
    Post(id: 3, title: "CC", userId: 1),
    Post(id: 4, title: "DD", userId: 3),
    Post(id: 5, title: "EE", userId: 2),
]

var users: [User] = [
    User(id: 1, nick: "A"),
    User(id: 2, nick: "B"),
    User(id: 3, nick: "C"),
    User(id: 4, nick: "D"),
]

func asyncTask(success: @escaping ([Post]) -> (), fail: @escaping (String) -> ()) {
    let ok: Bool = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        if ok {
            success(posts)
        } else {
            fail("connection error")
        }
    }
}

class MyTableViewCell: UITableViewCell {
    var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 10, y: 0, width: 100, height: 50)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 110, y: 0, width: 100, height: 50)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var userIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 210, y: 0, width: 100, height: 50)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.frame = CGRect(x: 0, y: 0, width: 300, height: 80)
        self.contentView.addSubview(self.idLabel)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.userIdLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("my tableview cell init error")
    }
}

class MyViewController : UIViewController {

    lazy var button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 50, width: 200, height: 50)
        button.backgroundColor = .darkGray
        button.setTitle("button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.frame = CGRect(x: 10, y: 150, width: 350, height: 700)
        tableView.backgroundColor = .blue
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        return tableView
    }()
    
    private var items: [Post]?

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(self.button)
        view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view = view
        
        
        button.addTarget(self, action: #selector(onTouchUp), for: .touchUpInside)
    }


    @objc
    func onTouchUp() {
        if items == nil {
            asyncTask(success: { posts in
                self.items = posts
                self.tableView.reloadData()
            }, fail: { errMsg in
                print(errMsg)
            })
        } else {
            items = nil
            self.tableView.reloadData()
        }
            
    }


}

extension MyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items?[indexPath.row] ?? "none")
    }
}

extension MyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell")! as! MyTableViewCell
        
        cell.backgroundColor = .init(white: 1, alpha: 0.7)
        cell.idLabel.text = "\(String(describing: items?[indexPath.row].id))"
        cell.titleLabel.text = items?[indexPath.row].title
        cell.userIdLabel.text = "\(String(describing: items?[indexPath.row].userId))"
        cell.backgroundColor = .green
        
        
        return cell
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
