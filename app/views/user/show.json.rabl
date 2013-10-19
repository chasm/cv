object @user

attributes :id, :name, :address, :email, :phone, :objective, :skills

child(:schools) do
  attributes :id, :name, :address, :started_on, :left_on, :highest_grade_completed, :graduated, :awards, :activities
end

child(:jobs) do
  attributes :id, :position, :company, :address, :website, :started_on, :left_on, :duties, :reason_for_leaving
  
  child(:supervisor) do
    attributes :id, :name, :email, :phone
  end
end

child(:awards) do
  attributes :id, :name, :awarded_on
end

child(:references) do
  attributes :id, :name, :email, :phone
end
