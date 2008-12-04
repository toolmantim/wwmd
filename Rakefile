desc "Deploy the site."
task :deploy do
  puts `rsync -av --delete --exclude '.DS_Store' * whatwouldmylesdo.com:/var/www/whatwouldmylesdo.com/app`
end
