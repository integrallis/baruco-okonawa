class TodosController < UIViewController
  attr_writer :data

  def viewDidLoad
    super
    self.title = 'Okonawa'
    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.dataSource = self
    self.view.addSubview(@table)

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
end
