class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    @table = UITableView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.addSubview(@table)
  end
end
