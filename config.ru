require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
#other controllers will go here too
run ApplicationController
use TipsController
use DestinationsController
use UsersController
