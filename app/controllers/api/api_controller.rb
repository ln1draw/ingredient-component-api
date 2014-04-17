class Api::ApiController < ApplicationController
  before_action :authenticate_admin!, only: []

  # skipping in API controller because theoretically authentication is never cached
  # and therefore CSRF is not a problem
  skip_before_filter :verify_authenticity_token
end