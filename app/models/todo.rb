class Todo
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable
  include MotionModel::Formotion

  columns :name        => {:type => :string, :formotion => {:key => :name}},
          :details     => {:type => :string,  :formotion => {:key => :details}},
          :due_date    => {:type => :date,
                           :formotion => {:picker_type => :date_time, :key => :due_date}},
          :done        => {:type => :boolean, :default => false,
                           :formotion => {:type => :switch, :key => :done}}

  validates :name, :presence => true

  def overdue?
    NSDate.new > self.due_date && !done
  end
end
