class ApplicationController < ActionController::Base
  def noop
    render plain: 'Hello, World!'
  end
end
