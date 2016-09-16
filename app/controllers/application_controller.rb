class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def policy(record, record_identifier = nil)
    identifier = record_identifier || record
    policies[identifier] ||= begin
                               policy = Pundit::PolicyFinder.new(identifier).policy!
                               policy.new(current_user, record)
                             end
  end

  def authorize(record, options = {})
    query = options.fetch :query, "#{params[:action]}?"
    record_idenfifier = options[:record_idenfifier]

    @_pundit_policy_authorized = true

    policy = policy(record, record_idenfifier)
    unless policy.public_send(query)
      raise NotAuthorizedError.new(query: query, record: record, policy: policy)
    end

    true
  end

  private

  def user_not_authorized
    flash[:notice] = "Access Denied! User not permitted"
    redirect_to(request.referrer || root_path)
  end
end
