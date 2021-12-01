json.extract! track, :id, :img_url, :release_date, :bpm, :created_at, :updated_at
json.url track_url(track, format: :json)
