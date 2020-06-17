module Config
  ROUTES = {
    'login'               => 'AuthenticationController#login',
    'logout'              => 'SessionController#logout',
    'home'                => 'HomeController#menu',
    'info'                => 'TeamController#info',
    'set-playtime'        => 'PlayController#set_play_time',
    'set-reduction'       => 'PlayController#set_reduction',
    'scoreboard'          => 'ScoreboardController#index',
    'passphrase'          => 'PassphraseController#index',
    'submit'              => 'SubmissionController#create',
    'submissions'         => 'SubmissionController#index',

    'score'               => 'ScoreboardController#index',
    'score/reeze'         => 'ScoreboardController#freeze',
    'score/unfreeze'      => 'ScoreboardController#unfreeze',
    'score/set-freeze'    => 'ScoreboardController#set_freeze',

    'flag'                => 'FlagController#index',
    'flag/new'            => 'FlagController#create',
    'flag/update'         => 'FlagController#update',
    'flag/delete'         => 'FlagController#delete',
    'flag/batch-flag'     => 'FlagController#batch_flag',
    'flag/auto-generate'  => 'FlagController#auto_generate',
    'flag/import'         => 'FlagController#import',

    'challenge'           => 'ChallengeController#index',
    'challenge/new'       => 'ChallengeController#create',
    'challenge/update'    => 'ChallengeController#update',
    'challenge/delete'    => 'ChallengeController#delete',

    'category'            => 'CategoryController#index',
    'category/new'        => 'CategoryController#create',
    'category/update'     => 'CategoryController#update',
    'category/delete'     => 'CategoryController#delete',

    'team'                => 'TeamController#index',
    'team/register'       => 'TeamController#create',
    'team/update'         => 'TeamController#update',
    'team/delete'         => 'TeamController#delete',
    'team/batch-register' => 'TeamController#batch_insert',
    'team/import'         => 'TeamController#import'
  }
end
