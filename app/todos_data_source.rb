class TodosDataSource

  attr_writer :data

  def tableView(tableView, numberOfRowsInSection:section)
    @data.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault,
                                               reuseIdentifier:nil)
    cell.textLabel.text = @data[indexPath.row]
    cell
  end
end
