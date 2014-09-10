class TodosController < UITableViewController
  attr_writer :data

  def viewDidLoad
    super
    self.title = 'Okonawa'

    @data = Todo.all

    NSNotificationCenter.defaultCenter.addObserver(self, selector: 'todoChanged:',
                                                         name: 'MotionModelDataDidChangeNotification',
                                                         object: nil) unless RUBYMOTION_ENV == 'test'
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.size
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault,
                                                         reuseIdentifier:nil)
    cell.textLabel.text = @data[indexPath.row].name
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    todo = @data[indexPath.row]
    todo_controller = TodoController.new(todo)
    self.navigationController.pushViewController(todo_controller,
                                                 animated: true)
  end

  def todoChanged(notification)
    case notification.userInfo[:action]
      when 'add'
      when 'update'
        todo = notification.object
        row = todo.id - 1
        path = NSIndexPath.indexPathForRow(row, inSection:0)
        tableView.reloadRowsAtIndexPaths([path], withRowAnimation:UITableViewRowAnimationAutomatic)
      when 'delete'
    end
  end

end
