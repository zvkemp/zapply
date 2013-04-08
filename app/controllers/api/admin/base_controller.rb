class Api::Admin::BaseController < Api::BaseController
  before_filter :user_is_admin?
end
