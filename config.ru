require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use TipsController
use DestinationsController
use UsersController
#other controllers will go here too
run ApplicationController

