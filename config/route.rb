module Config
  ROUTES = {
    'login'           => 'AuthenticationController#login',
    'logout'          => 'SessionController#logout',
    'home'            => 'HomeController#menu',

    'flag'            => 'FlagController#submit',
    'scoreboard'      => 'ScoreboardController#show',
    'challenge'       => 'ChallengeController#show',

    'category'        => 'CategoryController#index',
    'category/new'    => 'CategoryController#create',
    'category/update' => 'CategoryController#update',
    'category/delete' => 'CategoryController#delete',

    'team'                => 'TeamController#index',
    'team/register'       => 'TeamController#create',
    'team/update'         => 'TeamController#update',
    'team/delete'         => 'TeamController#delete',
    'team/batch-register' => 'TeamController#batch_insert'
  }
end
