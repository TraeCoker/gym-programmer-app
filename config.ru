require './config/environment'
enable :sessions 
#if ActiveRecord::Migrator.needs_migration?
 # raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use Rack::MethodOverride
use UserController
use ProgramController
run ApplicationController
