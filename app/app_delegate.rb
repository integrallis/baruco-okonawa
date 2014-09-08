class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    @table = UITableView.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    todos = %w(Milk Orange\ Juice Apples Bananas Broccoli Carrots Beef
               Chicken Enchiladas Hot\ Dogs Butter Bread Pasta Rice)

    todos.map! { |thing| "Buy #{thing}"}

    @data_source = TodosDataSource.new

    @data_source.data = todos

    @table.dataSource = @data_source

    @window.addSubview(@table)
  end
end
