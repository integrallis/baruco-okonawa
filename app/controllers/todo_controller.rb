class TodoController < Formotion::FormController
  attr_accessor :todo
  attr_accessor :form

  def initialize(todo)
    self.form = Formotion::Form.new(todo.to_formotion('Edit your ToDo'))
    self.initWithForm(self.form)
    self.todo = todo
  end

  def viewDidLoad
    super
    saveButton = UIBarButtonItem.alloc.initWithTitle("Save",
                   style: UIBarButtonItemStyleBordered,
                   target: self, action: 'save')
    self.navigationItem.rightBarButtonItem = saveButton
  end

  def save
    data = @form.render
    @todo.from_formotion!(data)
    @todo.save
    unless RUBYMOTION_ENV == 'test'
      self.navigationController.popToRootViewControllerAnimated(true)
    end
  end
end
