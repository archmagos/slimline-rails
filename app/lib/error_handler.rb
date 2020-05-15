# frozen_string_literal: true

module ErrorHandler
  def self.included(klass)
    klass.class_eval do
      rescue_from StandardError, NoMethodError do |error|
        basic_error_response(error)
      end
    end

    def route_not_found
      render json: { error: 'Route not found' }, status: :not_found
    end
  end

  private

  def respond(error, message, status)
    logger.error("Error: #{error.inspect}")
    render json: { error: message }, status: status
  end

  def basic_error_response(error)
    respond(error, 'Something went wrong', :internal_server_error)
  end
end
