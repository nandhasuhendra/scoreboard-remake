module Config
  ROUTES = {
    'login'           => 'AuthenticationController#login',
    'logout'          => 'SessionController#logout',
    'home'            => 'HomeController#menu',

    'flag'                => 'FlagController#index',
    'flag/new'            => 'FlagController#create',
    'flag/update'         => 'FlagController#update',
    'flag/delete'         => 'FlagController#delete',
    'flag/batch-flag'     => 'FlagController#batch_flag',
    'flag/auto-generate'  => 'FlagController#auto_generate',
    'flag/submit'         => 'FlagController#submit',

    'scoreboard'      => 'ScoreboardController#index',

    'challenge'        => 'ChallengeController#index',
    'challenge/new'    => 'ChallengeController#create',
    'challenge/update' => 'ChallengeController#update',
    'challenge/delete' => 'ChallengeController#delete',

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
