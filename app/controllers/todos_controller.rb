class TodosController < UITableViewController
  attr_writer :data

  def viewDidLoad
    super
    self.title = 'Okonawa'

    @data = Todo.all
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
end
