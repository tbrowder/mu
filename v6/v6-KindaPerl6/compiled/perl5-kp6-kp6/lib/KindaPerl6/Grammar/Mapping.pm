{ package KindaPerl6::Grammar; 
# Do not edit this file - Perl 5 generated by KindaPerl6
# AUTHORS, COPYRIGHT: Please look at the source file.
use v5;
use strict;
no strict "vars";
use constant KP6_DISABLE_INSECURE_CODE => 0;
use KindaPerl6::Runtime::Perl5::Runtime;
my $_MODIFIED; INIT { $_MODIFIED = {} }
INIT { $_ = ::DISPATCH($::Scalar, "new", { modified => $_MODIFIED, name => "$_" } ); }
do {do { if (::DISPATCH(::DISPATCH(::DISPATCH(  ( $GLOBAL::Code_VAR_defined = $GLOBAL::Code_VAR_defined || ::DISPATCH( $::Routine, "new", )  ) 
, 'APPLY', $::KindaPerl6::Grammar )
,"true"),"p5landish") ) { }  else { do {do {::MODIFIED($::KindaPerl6::Grammar);
$::KindaPerl6::Grammar = ::DISPATCH( ::DISPATCH( $::Class, 'new', ::DISPATCH( $::Str, 'new', 'KindaPerl6::Grammar' )
 )
, 'PROTOTYPE',  )
}} } }
;     sub _rule_pair {
    local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; 
    $GLOBAL::_M2 = $GLOBAL::_M; do{ my $_pos = pos(); ( ( ( _rule_ident() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "ident" ] ))  && do { local $GLOBAL::_M; _rule_opt_ws() } && /\G\=\>/g && do { local $GLOBAL::_M; _rule_opt_ws() } && ( _rule_exp() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "exp" ] ))  && do { {local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
    Match::from_global_data( $GLOBAL::_M ); 
    $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
    @Match::Matches = (); 
    do {::DISPATCH_VAR( $GLOBAL::_REGEX_RETURN_, "STORE", ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
    , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
     )
     )
    ,  } ),  )
    , ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp' )
     )
     )
    ] }
     )
     )
    };} if ( ::DISPATCH( $GLOBAL::Code_defined, "APPLY", $GLOBAL::_REGEX_RETURN_ )->{_value} ) { $GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", ::DISPATCH( $GLOBAL::_REGEX_RETURN_, "FETCH" ) ]; } 1 } ) ) || ( ( ( pos() = $_pos ) || 1 ) && ( ( _rule_exp2() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "exp2" ] ))  && do { local $GLOBAL::_M; _rule_opt_ws() } && /\G\=\>/g && do { local $GLOBAL::_M; _rule_opt_ws() } && ( _rule_exp() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "exp" ] ))  && do { {local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
    Match::from_global_data( $GLOBAL::_M ); 
    $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
    @Match::Matches = (); 
    do {::DISPATCH_VAR( $GLOBAL::_REGEX_RETURN_, "STORE", ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp2' )
     )
     )
    , ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp' )
     )
     )
    ] }
     )
     )
    };} if ( ::DISPATCH( $GLOBAL::Code_defined, "APPLY", $GLOBAL::_REGEX_RETURN_ )->{_value} ) { $GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", ::DISPATCH( $GLOBAL::_REGEX_RETURN_, "FETCH" ) ]; } 1 } ) ) || ( ( ( pos() = $_pos ) || 1 ) && ( /\G\:/g && ( _rule_ident() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "ident" ] ))  && /\G\</g && ( _rule_angle_quoted() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "angle_quoted" ] ))  && /\G\>/g && do { {local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
    Match::from_global_data( $GLOBAL::_M ); 
    $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
    @Match::Matches = (); 
    do {::DISPATCH_VAR( $GLOBAL::_REGEX_RETURN_, "STORE", ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
    , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
     )
     )
    ,  } ),  )
    , ::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
    , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'angle_quoted' )
     )
     )
    ,  } ),  )
    ] }
     )
     )
    };} if ( ::DISPATCH( $GLOBAL::Code_defined, "APPLY", $GLOBAL::_REGEX_RETURN_ )->{_value} ) { $GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", ::DISPATCH( $GLOBAL::_REGEX_RETURN_, "FETCH" ) ]; } 1 } ) ) || ( ( ( pos() = $_pos ) || 1 ) && ( /\G\:/g && ( _rule_ident() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "ident" ] ))  && /\G\(/g && do { local $GLOBAL::_M; _rule_opt_ws() } && ( _rule_exp() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "exp" ] ))  && do { local $GLOBAL::_M; _rule_opt_ws() } && /\G\)/g && do { {local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
    Match::from_global_data( $GLOBAL::_M ); 
    $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
    @Match::Matches = (); 
    do {::DISPATCH_VAR( $GLOBAL::_REGEX_RETURN_, "STORE", ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
    , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
     )
     )
    ,  } ),  )
    , ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp' )
     )
     )
    ] }
     )
     )
    };} if ( ::DISPATCH( $GLOBAL::Code_defined, "APPLY", $GLOBAL::_REGEX_RETURN_ )->{_value} ) { $GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", ::DISPATCH( $GLOBAL::_REGEX_RETURN_, "FETCH" ) ]; } 1 } ) ) || ( ( ( pos() = $_pos ) || 1 ) && ( /\G\:/g && ( _rule_ident() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "ident" ] ))  && do { {local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
    Match::from_global_data( $GLOBAL::_M ); 
    $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
    @Match::Matches = (); 
    do {::DISPATCH_VAR( $GLOBAL::_REGEX_RETURN_, "STORE", ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
    , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
     )
     )
    ,  } ),  )
    , ::DISPATCH( $::Val::Bit, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'bit' )
    , value           => ::DISPATCH( $::Int, 'new', 1 )
    ,  } ),  )
    ] }
     )
     )
    };} if ( ::DISPATCH( $GLOBAL::Code_defined, "APPLY", $GLOBAL::_REGEX_RETURN_ )->{_value} ) { $GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", ::DISPATCH( $GLOBAL::_REGEX_RETURN_, "FETCH" ) ]; } 1 } ) ) || ( ( ( pos() = $_pos ) || 1 ) && ( /\G\:/g && ( _rule_sigil() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "sigil" ] ))  && ( _rule_ident() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "ident" ] ))  && do { {local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
    Match::from_global_data( $GLOBAL::_M ); 
    $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
    @Match::Matches = (); 
    do {::DISPATCH_VAR( $GLOBAL::_REGEX_RETURN_, "STORE", ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
    , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
     )
     )
    ,  } ),  )
    , ::DISPATCH( $::Var, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'sigil' )
    , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'sigil' )
     )
     )
     )
    ,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'twigil' )
    , value           => ::DISPATCH( $::Str, 'new', '' )
    ,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'name' )
    , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
     )
     )
    ,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'namespace' )
    , value           => ::DISPATCH( $::Array, 'new', { _array => [] }
     )
    ,  } ),  )
    ] }
     )
     )
    };} if ( ::DISPATCH( $GLOBAL::Code_defined, "APPLY", $GLOBAL::_REGEX_RETURN_ )->{_value} ) { $GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", ::DISPATCH( $GLOBAL::_REGEX_RETURN_, "FETCH" ) ]; } 1 } ) ) } && do { $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; 
    $GLOBAL::_M2 = $GLOBAL::_M }; } 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "pair" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; my ($str,$pos) = @_;$str = defined($str) ? $str : $_;local $_ = ( ref($str) ? ::DISPATCH( $str, "Str" )->{_value} : $str ); pos($_) = $pos->{_value} if ref $pos;if ( _rule_pair() ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), );     sub _rule_exp_mapping {
    local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; 
    $GLOBAL::_M2 = $GLOBAL::_M; do{ my $_pos = pos(); ( ( ( _rule_pair() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "pair" ] ))  && do{ my $_pos = pos(); ( ( do { local $GLOBAL::_M; _rule_opt_ws() } && /\G\,/g && do { local $GLOBAL::_M; _rule_opt_ws() } && ( _rule_exp_mapping() && ( $GLOBAL::_M = [ $GLOBAL::_M2, "named_capture", "exp_mapping" ] ))  && do { {local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
    Match::from_global_data( $GLOBAL::_M ); 
    $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
    @Match::Matches = (); 
    do {::DISPATCH_VAR( $GLOBAL::_REGEX_RETURN_, "STORE", ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'pair' )
     )
     )
    , ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__64__62_ = $GLOBAL::Code_prefix_58__60__64__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp_mapping' )
     )
     )
     )
    ] }
     )
     )
    };} if ( ::DISPATCH( $GLOBAL::Code_defined, "APPLY", $GLOBAL::_REGEX_RETURN_ )->{_value} ) { $GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", ::DISPATCH( $GLOBAL::_REGEX_RETURN_, "FETCH" ) ]; } 1 } ) ) || ( ( ( pos() = $_pos ) || 1 ) && ( do { local $GLOBAL::_M; _rule_opt_ws() } && do{ my $_pos = pos(); ( ( /\G\,/g && do { local $GLOBAL::_M; _rule_opt_ws() } ) ) || ( ( ( pos() = $_pos ) || 1 ) && ( /\G/g ) ) } && do { {local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
    Match::from_global_data( $GLOBAL::_M ); 
    $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
    @Match::Matches = (); 
    do {::DISPATCH_VAR( $GLOBAL::_REGEX_RETURN_, "STORE", ::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
    , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'pair' )
     )
     )
    ] }
     )
     )
    };} if ( ::DISPATCH( $GLOBAL::Code_defined, "APPLY", $GLOBAL::_REGEX_RETURN_ )->{_value} ) { $GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", ::DISPATCH( $GLOBAL::_REGEX_RETURN_, "FETCH" ) ]; } 1 } ) ) } ) ) || ( ( ( pos() = $_pos ) || 1 ) && ( do { {local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
    Match::from_global_data( $GLOBAL::_M ); 
    $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
    @Match::Matches = (); 
    do {::DISPATCH_VAR( $GLOBAL::_REGEX_RETURN_, "STORE", ::DISPATCH( $::Array, 'new', { _array => [] }
     )
     )
    };} if ( ::DISPATCH( $GLOBAL::Code_defined, "APPLY", $GLOBAL::_REGEX_RETURN_ )->{_value} ) { $GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", ::DISPATCH( $GLOBAL::_REGEX_RETURN_, "FETCH" ) ]; } 1 } ) ) } && do { $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; 
    $GLOBAL::_M2 = $GLOBAL::_M }; } 
::DISPATCH(::DISPATCH($::KindaPerl6::Grammar,"HOW"),"add_method", ::DISPATCH( $::Str, "new", "exp_mapping" ), ::DISPATCH( $::Method, "new", { code => sub { local $GLOBAL::_Class = shift; undef $GLOBAL::_M2; my ($str,$pos) = @_;$str = defined($str) ? $str : $_;local $_ = ( ref($str) ? ::DISPATCH( $str, "Str" )->{_value} : $str ); pos($_) = $pos->{_value} if ref $pos;if ( _rule_exp_mapping() ) { Match::from_global_data( $GLOBAL::_M2 ); $MATCH = $GLOBAL::MATCH = pop @Match::Matches; } else { $MATCH = $GLOBAL::MATCH = Match->new(); } @Match::Matches = (); return $MATCH; } } ), )}
; 1 }
