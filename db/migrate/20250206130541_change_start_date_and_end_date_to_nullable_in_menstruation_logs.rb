class ChangeStartDateAndEndDateToNullableInMenstruationLogs < ActiveRecord::Migration[8.0]
  def change
    change_column_null :menstruation_logs, :start_date, true
    change_column_null :menstruation_logs, :end_date, true
  end
end
