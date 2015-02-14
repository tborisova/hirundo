class RegistrationsController < Devise::RegistrationsController 
  layout :resolve_layout

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def resolve_layout
    case action_name
    when "new", "create"
      "application"
    else
      "timeline"
    end
  end
end