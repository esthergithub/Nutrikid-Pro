json.extract! patient, :id, :patient_name, :image, :description, :category_id, :user_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
