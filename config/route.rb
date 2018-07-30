module Config
  ROUTES = {
    'login'      => 'Authentication#login',
    'logout'     => 'Session#logout',
    'home'       => 'Home#menu',

    'flag'       => 'Flag#submit',
    'scoreboard' => 'Scoreboard#show',
    'challenge'  => 'Challenge#show',

    'team'       => 'Team#index',
    'register'   => 'Team#create',
    'profile'    => 'Team#edit',
    'delete'     => "Team#delete"
  }
end
