class DateIntersectionsValidator < ActiveModel::Validator
  # only seperate the validator if it exceeds 15 lines, or if it is used in more than one place
  def validate(record)
    if record.ended_at < record.started_at
      record.errors.add(:ended_at, 'can\'t be less than the started at value')
    end

    # LOD: we should only use 1 dot in each statement (Rails delegation)
    last_professional_data = record.employee_professional_data.try(:last)

    unless last_professional_data.nil?
      if record.started_at < last_professional_data.ended_at
        record.errors.add(:started_at, "intersects with previous record, the start date should be greater than #{last_professional_data.ended_at}")
      end
    end
  end
end
