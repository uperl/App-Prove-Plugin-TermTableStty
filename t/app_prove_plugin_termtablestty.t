use Test2::V0 -no_srand => 1;
use App::Prove::Plugin::TermTableStty;

subtest 'already set' => sub {

  local $ENV{TABLE_TERM_SIZE} = 9999;
  App::Prove::Plugin::TermTableStty->load;
  is $ENV{TABLE_TERM_SIZE}, 9999;

};

subtest 'not already set' => sub {

  local $ENV{TERM_TABLE_SIZE};
  delete $ENV{TERM_TABLE_SIZE};
  
  App::Prove::Plugin::TermTableStty->load;
  is $ENV{TERM_TABLE_SIZE}, match qr/^[0-9]+$/;
  
  note "TERM_TABLE_SIZE=$ENV{TERM_TABLE_SIZE}";

};

done_testing
