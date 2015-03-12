User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all

u1 = User.create!(email: 'a@a.a', password_digest: '123456')

b1 = Band.create!(name: 'Dr. Schlomo')

a1 = Album.create!(title: 'GI Clinic', band_id: b1.id, recording: 'Live')

Track.create!(title: 'Track 1', album_id: a1.id, track_type: 'Regular')
Track.create!(title: 'Happy', album_id: a1.id, track_type: 'Regular')
Track.create!(title: 'The End', album_id: a1.id, track_type: 'Bonus')
