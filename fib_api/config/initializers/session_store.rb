if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_fib_app", domain: "https://fib-client.surge.sh"
else
  Rails.application.config.session_store :cookie_store, key: "_fib_app"
end
