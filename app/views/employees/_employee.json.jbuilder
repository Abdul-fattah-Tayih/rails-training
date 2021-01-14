json.extract! employee, :id, :title_en, :title_ar, :name_en, :name_ar, :belongs_to, :created_at, :updated_at
json.url employee_url(employee, format: :json)
