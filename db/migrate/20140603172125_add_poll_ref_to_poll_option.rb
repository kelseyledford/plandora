class AddPollRefToPollOption < ActiveRecord::Migration
  def change
    add_reference :poll_options, :poll, index: true
  end
end
