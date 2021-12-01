class AddReferencesToFollow < ActiveRecord::Migration[6.1]
  def change
    add_reference :follows, :follower, foreign_key: { to_table: :users }
    add_reference :follows, :followed, foreign_key: { to_table: :users }
  end
end
