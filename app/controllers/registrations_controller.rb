class RegistrationsController < Devise::RegistrationsController 
  layout "timeline"

  def edit
    super
  end
end