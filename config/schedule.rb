every '45 02,14 * * 1-7' do
  command 'cd /media/disco_b/public_html/neumaticos/current && bundle exec rake RAILS_ENV=production products:to_rodaben_gane'
end
every '15 04,14 * * 1-7' do
  command 'cd /media/disco_b/public_html/neumaticos/current && bundle exec rake RAILS_ENV=production products:to_rodaben_eurotyre'
end
every :day, :at => '5:00am' do
  command 'cd /media/disco_b/public_html/neumaticos/current && bundle exec rake RAILS_ENV=production products:clean_rodaben'
end
every :day, :at => '2:00pm' do
  command 'backup perform --trigger rodaben_backup'
end
every :day, :at => '0:30am' do
  command 'backup perform --trigger rodaben_backup'
end
