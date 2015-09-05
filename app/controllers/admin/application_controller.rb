class Admin::ApplicationController < ApplicationController
  http_basic_authenticate_with name: "bremobile", password: "toottoot"
end
