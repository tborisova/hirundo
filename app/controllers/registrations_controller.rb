class RegistrationsController < Devise::RegistrationsController 
  layout "timeline"

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end