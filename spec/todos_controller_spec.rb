describe "Todos Controller" do
  tests TodosController

  before do
    Todo.delete_all
    @now = NSDate.new
    @todo = Todo.create(:name => 'Buy Milk',
                        :description => 'Get some 1% to rid yourself of the muffin top',
                        :due_date => @now)
    @table = controller.instance_variable_get("@table")
  end

  it 'should exist' do
    @table.should.not == nil
  end

  it 'displays the given ToDos' do
    @table.visibleCells.should.not.be.empty
  end

  it 'displays the correct label for a given ToDo' do
    first_cell = @table.visibleCells.first
    first_cell.textLabel.text.should == 'Buy Milk'
  end
end
