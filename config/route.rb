module Config
  ROUTES = {
    'login'           => 'Authentication#login',
    'logout'          => 'Session#logout',
    'home'            => 'Home#menu',

    'flag/all'        => 'Flag#submit',
    'scoreboard/all'  => 'Scoreboard#show',
    'challenge/all'   => 'Challenge#show',

    'team/all'        => 'Team#index',
    'team/register'   => 'Team#create',
    'team/update'     => 'Team#update',
    'team/delete'     => "Team#delete"
  }
end
