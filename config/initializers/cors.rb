Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
     origins 'http://0.0.0.0:5000'
     resource '*',
     headers: :any,
     methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
 end