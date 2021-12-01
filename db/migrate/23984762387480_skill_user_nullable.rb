class SkillUserNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :skills, :user_id, true
  end
end
