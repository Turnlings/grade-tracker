# frozen_string_literal: true

json.extract! semester, :id, :created_at, :updated_at
json.url semester_url(semester, format: :json)
