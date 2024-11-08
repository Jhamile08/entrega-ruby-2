json.extract! event, :id, :eventName, :date, :descripcion, :exhibitor, :level, :created_at, :updated_at
json.url event_url(event, format: :json)
