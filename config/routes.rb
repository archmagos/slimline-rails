# frozen_string_literal: true

Rails.application.routes.draw do
  match '*undefined', to: 'application#route_not_found', via: :all
end
