{

    package Match;

    # Do not edit this file - Perl 5 generated by HASH(0x231c300)
    # AUTHORS, COPYRIGHT: Please look at the source file.
    use v5;
    use strict;
    no strict "vars";
    use constant KP6_DISABLE_INSECURE_CODE => 0;
    use KindaPerl6::Runtime::Perl5::Runtime;
    my $_MODIFIED;
    INIT { $_MODIFIED = {} }
    INIT { $_ = ::DISPATCH( $::Scalar, "new", { modified => $_MODIFIED, name => "$_" } ); }
    do {
        do {
            if ( ::DISPATCH( ::DISPATCH( ::DISPATCH( ( $GLOBAL::Code_VAR_defined = $GLOBAL::Code_VAR_defined || ::DISPATCH( $::Routine, "new", ) ), 'APPLY', $::Match ), "true" ), "p5landish" ) ) {
                do { }
            }
            else {
                do {
                    do {
                        ::MODIFIED($::Match);
                        $::Match = ::DISPATCH( ::DISPATCH( $::Class, 'new', ::DISPATCH( $::Str, 'new', 'Match' ) ), 'PROTOTYPE', );
                        }
                    }
            }
        };
        ::DISPATCH( ::DISPATCH( $::Match, 'HOW', ), 'add_parent',    ::DISPATCH( $::Capture, 'HOW', ) );
        ::DISPATCH( ::DISPATCH( $::Match, 'HOW', ), 'add_attribute', ::DISPATCH( $::Str,     'new', 'from' ) );
        ::DISPATCH( ::DISPATCH( $::Match, 'HOW', ), 'add_attribute', ::DISPATCH( $::Str,     'new', 'to' ) );
        ::DISPATCH( ::DISPATCH( $::Match, 'HOW', ), 'add_attribute', ::DISPATCH( $::Str,     'new', 'result' ) );
        ::DISPATCH( ::DISPATCH( $::Match, 'HOW', ), 'add_attribute', ::DISPATCH( $::Str,     'new', 'bool' ) );
        ::DISPATCH( ::DISPATCH( $::Match, 'HOW', ), 'add_attribute', ::DISPATCH( $::Str,     'new', 'match_str' ) );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'perl' ),
            ::DISPATCH(
                $::Code, 'new',
                {   code => sub {

                        # emit_declarations
                        my $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$self' } ) unless defined $self;
                        INIT { $self = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$self' } ) }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) unless defined $CAPTURE;
                        INIT { $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) }
                        my $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } );
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        ::DISPATCH_VAR( $List__, 'STORE', ::DISPATCH( $CAPTURE, 'array', ) );
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        ::DISPATCH( $::Str, 'new', 'Match.new( ... )' );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {   invocant => bless(
                                {   'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array  => ::DISPATCH( $::List, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'Str' ),
            ::DISPATCH(
                $::Code, 'new',
                {   code => sub {

                        # emit_declarations
                        my $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$self' } ) unless defined $self;
                        INIT { $self = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$self' } ) }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) unless defined $CAPTURE;
                        INIT { $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) }
                        my $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } );
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        ::DISPATCH_VAR( $List__, 'STORE', ::DISPATCH( $CAPTURE, 'array', ) );
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        do {
                            if ( ::DISPATCH( ::DISPATCH( ::DISPATCH( $self, "result" ), "true" ), "p5landish" ) ) {
                                do {
                                    return ( ::DISPATCH( ::DISPATCH( $self, "result" ), 'Str', ) );
                                    }
                            }
                            else { ::DISPATCH( $::Bit, "new", 0 ) }
                        };
                        ::DISPATCH(
                            ( $GLOBAL::Code_ternary_58__60__63__63__32__33__33__62_ = $GLOBAL::Code_ternary_58__60__63__63__32__33__33__62_ || ::DISPATCH( $::Routine, "new", ) ),
                            'APPLY',
                            ::DISPATCH( $self, "bool" ),
                            ::DISPATCH(
                                ( $GLOBAL::Code_substr = $GLOBAL::Code_substr || ::DISPATCH( $::Routine, "new", ) ),
                                'APPLY',
                                ::DISPATCH( $self, "match_str" ),
                                ::DISPATCH( $self, "from" ),
                                ::DISPATCH( ( $GLOBAL::Code_infix_58__60__45__62_ = $GLOBAL::Code_infix_58__60__45__62_ || ::DISPATCH( $::Routine, "new", ) ), 'APPLY', ::DISPATCH( $self, "to" ), ::DISPATCH( $self, "from" ) )
                            ),
                            $::Undef
                        );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {   invocant => bless(
                                {   'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array  => ::DISPATCH( $::List, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'scalar' ),
            ::DISPATCH(
                $::Code, 'new',
                {   code => sub {

                        # emit_declarations
                        my $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$self' } ) unless defined $self;
                        INIT { $self = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$self' } ) }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) unless defined $CAPTURE;
                        INIT { $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) }
                        my $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } );
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        ::DISPATCH_VAR( $List__, 'STORE', ::DISPATCH( $CAPTURE, 'array', ) );
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        do {
                            if ( ::DISPATCH( ::DISPATCH( ::DISPATCH( $self, "result" ), "true" ), "p5landish" ) ) {
                                do {
                                    return ( ::DISPATCH( $self, "result" ) );
                                    }
                            }
                            else {
                                do {
                                    return ( ::DISPATCH( $self, 'Str', ) );
                                    }
                            }
                            }
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {   invocant => bless(
                                {   'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array  => ::DISPATCH( $::List, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'true' ),
            ::DISPATCH(
                $::Code, 'new',
                {   code => sub {

                        # emit_declarations
                        my $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$self' } ) unless defined $self;
                        INIT { $self = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$self' } ) }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) unless defined $CAPTURE;
                        INIT { $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) }
                        my $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } );
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        ::DISPATCH_VAR( $List__, 'STORE', ::DISPATCH( $CAPTURE, 'array', ) );
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        return ( ::DISPATCH( ::DISPATCH( $self, "bool" ), 'true', ) );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {   invocant => bless(
                                {   'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array  => ::DISPATCH( $::List, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
    };
    1
}
