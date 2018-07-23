class CreateJoinTablePlanBenefit < ActiveRecord::Migration[5.2]
  def change
    create_join_table :plans, :benefits do |t|
      t.index [:plan_id, :benefit_id], unique: true
      t.index [:benefit_id, :plan_id]
    end
  end
end
