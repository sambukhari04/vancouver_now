json.events @events do |event|
  json.id event.id
  json.title event.title
  json.description event.description
  json.title event.title
  json.price event.price
  json.title event.title
  json.location event.location
  json.make_date event.make_date
  json.created_at event.created_at.strftime('%Y-%B-%d')

  json.user do
    json.first_name event.user.first_name
    json.last_name event.user.last_name
  end
