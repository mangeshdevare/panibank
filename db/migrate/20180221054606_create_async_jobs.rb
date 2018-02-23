class CreateAsyncJobs < ActiveRecord::Migration
  def change
    create_table :async_jobs do |t|
      t.string :job_owner
      t.text :csv_errors, :limit => 4294967295
      t.string :status

      t.timestamps
    end
    add_attachment :async_jobs, :csv
  end
end