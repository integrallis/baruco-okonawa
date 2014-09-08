class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    #@window = UIWindow.alloc.init
    #@window = UIWindow.new
    @window.makeKeyAndVisible
  end
end
