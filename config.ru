require './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end
use OutfitsController
use UsersController
run ApplicationController
