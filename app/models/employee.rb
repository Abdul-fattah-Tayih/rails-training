class Employee < ApplicationRecord
  # use a module instead of defining store_accessor individually
  # include StoreAccessor
  belongs_to :user
  has_many :professional_data, 'class_name': 'ProfessionalData'
  store_accessor :title, :ar, :en, prefix: true
  store_accessor :name, :ar, :en, prefix: true
  validates_presence_of :title_ar, :title_en, :name_ar, :name_en
  validates :user_id, uniqueness: true, presence: true

  def localized_name
    name[I18n.locale.to_s]
  end

  def localized_title
    title[I18n.locale.to_s]
  end
end
