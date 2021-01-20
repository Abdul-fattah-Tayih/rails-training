class ProfessionalData < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :employee
  store_accessor :title, :ar, :en, prefix: true
  validates_presence_of :title_ar, :title_en, :started_at, :ended_at, :employee_id
  validates_with DateIntersectionsValidator
  delegate :professional_data, to: :employee, prefix: true, allow_nil: true

  def localized_title
    title[I18n.locale.to_s]
  end
end
