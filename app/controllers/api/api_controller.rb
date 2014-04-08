class Api::ApiController < ApplicationController
  before_action :authenticate_admin!, only: []
end