class CreateSchoolMajorJoin < ActiveRecord::Migration
  def self.up
    create_table :majors_schools, :id => false do |t|
    	t.column :school_id, :integer
    	t.column :major_id, :integer
    end
  end

  def self.down
  	drop_table :school_major_joins
  end

end
