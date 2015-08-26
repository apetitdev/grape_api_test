class API < Grape::API
  prefix 'api'
  version 'v1', using: :path
  mount Schools::Data
  mount Majors::Data
end