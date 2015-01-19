json.array!(@executors) do |executor|
  json.extract! executor, :id, :name
  json.url executor_url(executor, format: :json)
end
