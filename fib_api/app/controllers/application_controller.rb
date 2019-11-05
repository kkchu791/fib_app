class ApplicationController < ActionController::API

  def load_test
    render plain: "loaderio-ffcb8beb4c4a06aabd3297688b477fea"
  end
end
