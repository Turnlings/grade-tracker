# frozen_string_literal: true

class Paper < Exam
  # Override for path helpers
  def self.model_name
    Exam.model_name
  end
end
