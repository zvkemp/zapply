class Api::AdminController < Api::BaseController
  before_filter :user_is_admin?
end