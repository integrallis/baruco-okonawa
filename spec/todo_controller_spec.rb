describe "Todo Controller" do
  tests TodoController

  before do
    @now = NSDate.new
    @todo = Todo.create :name => "Buy Milk",
                        :details => "We need some Milk",
                        :due_date => @now
    @controller = TodoController.new(@todo)

    @form = @controller.form
    @name_row = @form.row(:name)
    @details_row = @form.row(:details)
    @due_date_row = @form.row(:due_date)
    @done_row = @form.row(:done)
  end

  def controller
    @controller
  end

  it 'exists' do
    Object.const_defined?('TodoController').should.be.true
  end

  it 'displays a Todo\'s details' do
    @name_row.value.should.equal 'Buy Milk'
    @details_row.value.should.equal 'We need some Milk'
    @due_date_row.object.date_value.hour.should.equal @now.hour
    @due_date_row.object.date_value.min.should.equal @now.min
    @done_row.value.should.equal false
  end

  it 'saves changes made to a Todo' do
    @name_row.value = 'Buy 1% Milk'
    controller.save

    saved_todo = Todo.find(@todo.id)

    saved_todo.name.should.equal 'Buy 1% Milk'
  end
end
