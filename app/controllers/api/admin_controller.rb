class Api::AdminController < Api::BaseController
  before_filter :authorize_admin
end
