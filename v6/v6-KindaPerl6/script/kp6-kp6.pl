{ package Main;
# Do not edit this file - Perl 5 generated by KindaPerl6
use v5;
use strict;
no strict "vars";
use constant KP6_DISABLE_INSECURE_CODE => 0;
use KindaPerl6::Runtime::Perl5::Runtime;
my $_MODIFIED; INIT { $_MODIFIED = {} }
INIT { $_ = ::DISPATCH($::Scalar, "new", { modified => $_MODIFIED, name => "$_" } ); }
do {my  $List_visitors = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List_visitors' } ) ;
;
my $emit_p5; $emit_p5 = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$emit_p5' } )  unless defined $emit_p5; INIT { $emit_p5 = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$emit_p5' } ) }
;
my $code; $code = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$code' } )  unless defined $code; INIT { $code = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$code' } ) }
;
my $pos; $pos = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$pos' } )  unless defined $pos; INIT { $pos = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$pos' } ) }
;
my $len; $len = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$len' } )  unless defined $len; INIT { $len = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$len' } ) }
;
do { if (::DISPATCH(::DISPATCH(::DISPATCH( $GLOBAL::Code_VAR_defined, 'APPLY', $::Main )
,"true"),"p5landish") ) { }  else { do {my  $List_visitors = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List_visitors' } ) ;
;
my $emit_p5; $emit_p5 = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$emit_p5' } )  unless defined $emit_p5; INIT { $emit_p5 = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$emit_p5' } ) }
;
my $code; $code = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$code' } )  unless defined $code; INIT { $code = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$code' } ) }
;
my $pos; $pos = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$pos' } )  unless defined $pos; INIT { $pos = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$pos' } ) }
;
my $len; $len = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$len' } )  unless defined $len; INIT { $len = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$len' } ) }
;
do {::MODIFIED($::Main);
$::Main = ::DISPATCH( ::DISPATCH( $::Class, 'new', ::DISPATCH( $::Str, 'new', 'Main' )
 )
, 'PROTOTYPE',  )
}} } }
; use KindaPerl6::Runtime::Perl5::KP6Runtime; use KindaPerl6::Grammar; use KindaPerl6::Traverse; use KindaPerl6::Ast; use KindaPerl6::Grammar::Regex; use KindaPerl6::Runtime::Perl6::Compiler; use KindaPerl6::Runtime::Perl6::Grammar; use KindaPerl6::Visitor::ExtractRuleBlock; use KindaPerl6::Visitor::Token; use KindaPerl6::Visitor::MetaClass; use KindaPerl6::Visitor::Global; use KindaPerl6::Visitor::Emit::Perl5; use KindaPerl6::Visitor::Emit::AstPerl; $List_visitors; ::DISPATCH( $List_visitors, 'push', ::DISPATCH( $::KindaPerl6::Visitor::ExtractRuleBlock, 'new',  )
 )
; ::DISPATCH( $List_visitors, 'push', ::DISPATCH( $::KindaPerl6::Visitor::Token, 'new',  )
 )
; ::DISPATCH( $List_visitors, 'push', ::DISPATCH( $::KindaPerl6::Visitor::MetaClass, 'new',  )
 )
; ::DISPATCH( $List_visitors, 'push', ::DISPATCH( $::KindaPerl6::Visitor::Global, 'new',  )
 )
; ::DISPATCH_VAR( $emit_p5, 'STORE', ::DISPATCH( $::KindaPerl6::Visitor::Emit::Perl5, 'new',  )
 )
; ::DISPATCH_VAR( ::DISPATCH( $emit_p5, 'visitor_args',  )
, 'STORE', do {my  $List_visitors = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List_visitors' } ) ;
;
my $emit_p5; $emit_p5 = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$emit_p5' } )  unless defined $emit_p5; INIT { $emit_p5 = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$emit_p5' } ) }
;
my $code; $code = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$code' } )  unless defined $code; INIT { $code = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$code' } ) }
;
my $pos; $pos = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$pos' } )  unless defined $pos; INIT { $pos = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$pos' } ) }
;
my $len; $len = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$len' } )  unless defined $len; INIT { $len = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$len' } ) }
;
::DISPATCH( $::Pair, 'new', { key => ::DISPATCH( $::Str, 'new', 'secure' )
, value => ::DISPATCH( $::Int, 'new', 1 )
 } )
} )
; ::DISPATCH( $List_visitors, 'push', $emit_p5 )
; ::DISPATCH_VAR( $code, 'STORE', ::DISPATCH( $GLOBAL::Code_slurp, 'APPLY',  )
 )
; ::DISPATCH( $COMPILER::Code_env_init, 'APPLY',  )
; ::DISPATCH_VAR( ::DISPATCH( $GLOBAL::Code_ternary_58__60__63__63__32__33__33__62_, 'APPLY', ::DISPATCH( $GLOBAL::Code_VAR_defined, 'APPLY', $COMPILER::source_md5 )
, $COMPILER::source_md5, do {::MODIFIED($COMPILER::source_md5);
$COMPILER::source_md5 = ::DISPATCH( $::Scalar, 'new',  )
} )
, 'STORE', ::DISPATCH( $::Str, 'new', 'temporary_value' )
 )
; ::DISPATCH_VAR( $pos, 'STORE', ::DISPATCH( $::Int, 'new', 0 )
 )
; ::DISPATCH_VAR( $len, 'STORE', ::DISPATCH( $GLOBAL::Code_length, 'APPLY', $code )
 )
; do { while (::DISPATCH(::DISPATCH(::DISPATCH( $GLOBAL::Code_infix_58__60__62__62_, 'APPLY', $len, $pos )
,"true"),"p5landish") )  { do {my $match; $match = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$match' } )  unless defined $match; INIT { $match = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$match' } ) }
;
my $ast; $ast = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$ast' } )  unless defined $ast; INIT { $ast = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$ast' } ) }
;
my $res; $res = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$res' } )  unless defined $res; INIT { $res = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$res' } ) }
;
::DISPATCH_VAR( $match, 'STORE', ::DISPATCH( $::KindaPerl6::Grammar, 'comp_unit', $code, $pos )
 )
; ::DISPATCH_VAR( $ast, 'STORE', ::DISPATCH( $match, 'result',  )
 )
; do { if (::DISPATCH(::DISPATCH(::DISPATCH( $GLOBAL::Code_prefix_58__60__33__62_, 'APPLY', ::DISPATCH( $ast, 'isa', ::DISPATCH( $::Str, 'new', 'CompUnit' )
 )
 )
,"true"),"p5landish") ) { do {::DISPATCH( $GLOBAL::Code_die, 'APPLY', ::DISPATCH( $GLOBAL::Code_infix_58__60__126__62_, 'APPLY', ::DISPATCH( $::Str, 'new', 'AST IS:(' )
, ::DISPATCH( $GLOBAL::Code_infix_58__60__126__62_, 'APPLY', ::DISPATCH( $ast, 'result',  )
, ::DISPATCH( $::Str, 'new', ')' )
 )
 )
 )
} }  else { ::DISPATCH($::Bit, "new", 0) } }
; ::DISPATCH( $GLOBAL::Code_say, 'APPLY', ::DISPATCH( $ast, 'emit', ::DISPATCH( $::KindaPerl6::Visitor::Emit::AstPerl, 'new',  )
 )
 )
; ::DISPATCH( $GLOBAL::Code_exit, 'APPLY',  )
; $res; ::DISPATCH( $List_visitors, 'map', ::DISPATCH( $::Code, 'new', { code => sub { my  $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } ) ;
;
my $visitor; $visitor = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$visitor' } )  unless defined $visitor; INIT { $visitor = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$visitor' } ) }
;
my $CAPTURE; $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } )  unless defined $CAPTURE; INIT { $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) }
::DISPATCH_VAR($CAPTURE,"STORE",::CAPTURIZE(\@_));do {::MODIFIED($List__);
$List__ = ::DISPATCH( $CAPTURE, 'array',  )
};do {::MODIFIED($Hash__);
$Hash__ = ::DISPATCH( $CAPTURE, 'hash',  )
};{ my $_param_index = 0;  if ( exists $Hash__->{_value}{_hash}{'visitor'} )  { do {::MODIFIED($visitor);
$visitor = ::DISPATCH( $Hash__, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'visitor' )
 )
} }  elsif ( exists $List__->{_value}{_array}[ $_param_index ] )  { $visitor = $List__->{_value}{_array}[ $_param_index++ ];  } } ::DISPATCH_VAR( $res, 'STORE', ::DISPATCH( $ast, 'emit', $visitor )
 )
 }, signature => ::DISPATCH( $::Signature, "new", { invocant => $::Undef, array    => ::DISPATCH( $::Array, "new", { _array => [ ::DISPATCH( $::Signature::Item, 'new', { sigil  => '$', twigil => '', name   => 'visitor', value  => $::Undef, has_default    => ::DISPATCH( $::Bit, 'new', 0 )
, is_named_only  => ::DISPATCH( $::Bit, 'new', 0 )
, is_optional    => ::DISPATCH( $::Bit, 'new', 0 )
, is_slurpy      => ::DISPATCH( $::Bit, 'new', 0 )
, is_multidimensional  => ::DISPATCH( $::Bit, 'new', 0 )
, is_rw          => ::DISPATCH( $::Bit, 'new', 0 )
, is_copy        => ::DISPATCH( $::Bit, 'new', 0 )
,  } )
,  ] } ), return   => $::Undef, } )
,  } )
 )
; ::DISPATCH( $GLOBAL::Code_print, 'APPLY', $res )
; ::DISPATCH_VAR( $pos, 'STORE', ::DISPATCH( $GLOBAL::Code_infix_58__60__43__62_, 'APPLY', $pos, ::DISPATCH( $match, 'to',  )
 )
 )
} } }
}
; 1 }


=begin

=head1 AUTHORS

The Pugs Team E<lt>perl6-compiler@perl.orgE<gt>.

=head1 SEE ALSO

The Perl 6 homepage at L<http://dev.perl.org/perl6>.

The Pugs homepage at L<http://pugscode.org/>.

=head1 COPYRIGHT

Copyright 2007 by Flavio Soibelmann Glock and others.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=end