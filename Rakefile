desc "Deploy the site."
task :deploy, :environment do |t, args|
  puts `rsync -av --delete --exclude '.DS_Store' * whatwouldmylesdo.com:/var/www/whatwouldmylesdo.com/app`
end
