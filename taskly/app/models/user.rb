class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  def as_json(options={})
    super(only: [:id, :name, :email],
      methods: [:tasks_count],
      include: [tasks:  { only: [:id, :name, :due_date] }])
  end

  def tasks_count
    self.tasks.count
  end
end
