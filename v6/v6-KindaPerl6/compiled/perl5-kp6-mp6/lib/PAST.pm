{

    package PCT::Node;

    # Do not edit this file - Perl 5 generated by HASH(0x2299ee0)
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
            if ( ::DISPATCH( ::DISPATCH( ::DISPATCH( ( $GLOBAL::Code_VAR_defined = $GLOBAL::Code_VAR_defined || ::DISPATCH( $::Routine, "new", ) ), 'APPLY', $::PCT::Node ), "true" ), "p5landish" ) ) {
                do { }
            }
            else {
                do {
                    do {
                        ::MODIFIED($::PCT::Node);
                        $::PCT::Node = ::DISPATCH( ::DISPATCH( $::Class, 'new', ::DISPATCH( $::Str, 'new', 'PCT::Node' ) ), 'PROTOTYPE', );
                        }
                    }
            }
        };
        ::DISPATCH( ::DISPATCH( $::PCT::Node, 'HOW', ), 'add_attribute', ::DISPATCH( $::Str, 'new', 'children' ) );
        ::DISPATCH(
            ::DISPATCH( $::PCT::Node, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'perl' ),
            ::DISPATCH(
                $::Code, 'new',
                {   code => sub {

                        # emit_declarations
                        my $attrs;
                        $attrs = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$attrs' } ) unless defined $attrs;
                        INIT { $attrs = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$attrs' } ) }
                        my $str;
                        $str = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$str' } ) unless defined $str;
                        INIT { $str = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$str' } ) }
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
                            if (::DISPATCH(
                                    ::DISPATCH( ::DISPATCH( ( $GLOBAL::Code_prefix_58__60__33__62_ = $GLOBAL::Code_prefix_58__60__33__62_ || ::DISPATCH( $::Routine, "new", ) ), 'APPLY', ::DISPATCH( $self, 'children', ) ), "true" ), "p5landish"
                                )
                                )
                            {
                                do {
                                    ::DISPATCH_VAR( ::DISPATCH( $self, 'children', ), 'STORE', ::DISPATCH( $::Array, 'new', { _array => [] } ) );
                                    }
                            }
                            else { ::DISPATCH( $::Bit, "new", 0 ) }
                        };
                        ::DISPATCH_VAR( $attrs, 'STORE', ::DISPATCH( $::Str, 'new', '' ) );
                        ::DISPATCH(
                            ::DISPATCH( ::DISPATCH( $self, 'HOW', ), 'attributes', ),
                            'map',
                            ::DISPATCH(
                                $::Code, 'new',
                                {   code => sub {
                                        my $List__ = ::DISPATCH( $::ArrayContainer, 'new', { modified => $_MODIFIED, name => '$List__' } );
                                        my $attr;
                                        $attr = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$attr' } ) unless defined $attr;
                                        INIT { $attr = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$attr' } ) }
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
                                        {
                                            my $_param_index = 0;
                                            if ( ::DISPATCH( $GLOBAL::Code_exists, 'APPLY', ::DISPATCH( $Hash__, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'attr' ) ) )->{_value} ) {
                                                do {
                                                    ::MODIFIED($attr);
                                                    $attr = ::DISPATCH( $Hash__, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'attr' ) );
                                                    }
                                            }
                                            elsif ( ::DISPATCH( $GLOBAL::Code_exists, 'APPLY', ::DISPATCH( $List__, 'INDEX', ::DISPATCH( $::Int, 'new', $_param_index ) ) )->{_value} ) {
                                                $attr = ::DISPATCH( $List__, 'INDEX', ::DISPATCH( $::Int, 'new', $_param_index++ ) );
                                            }
                                        }
                                        ::DISPATCH_VAR(
                                            $attrs, 'STORE',
                                            ::DISPATCH(
                                                ( $GLOBAL::Code_infix_58__60__126__62_ = $GLOBAL::Code_infix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", ) ),
                                                'APPLY', $attrs,
                                                ::DISPATCH(
                                                    ( $GLOBAL::Code_infix_58__60__126__62_ = $GLOBAL::Code_infix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", ) ),
                                                    'APPLY',
                                                    ::DISPATCH( $::Str, 'new', ',:' ),
                                                    ::DISPATCH(
                                                        ( $GLOBAL::Code_infix_58__60__126__62_ = $GLOBAL::Code_infix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", ) ),
                                                        'APPLY', $attr,
                                                        ::DISPATCH(
                                                            ( $GLOBAL::Code_infix_58__60__126__62_ = $GLOBAL::Code_infix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", ) ),
                                                            'APPLY',
                                                            ::DISPATCH( $::Str, 'new', '(' ),
                                                            ::DISPATCH(
                                                                ( $GLOBAL::Code_infix_58__60__126__62_ = $GLOBAL::Code_infix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", ) ),
                                                                'APPLY',
                                                                ::DISPATCH( ::DISPATCH( $self, 'DISPATCH', $attr ), 'perl', ),
                                                                ::DISPATCH( $::Str, 'new', ')' )
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                        );
                                    },
                                    signature => ::DISPATCH(
                                        $::Signature,
                                        "new",
                                        {   invocant => $::Undef,
                                            array    => ::DISPATCH(
                                                $::List, "new",
                                                {   _array => [
                                                        ::DISPATCH(
                                                            $::Signature::Item,
                                                            'new',
                                                            {   sigil               => '$',
                                                                twigil              => '',
                                                                name                => 'attr',
                                                                value               => $::Undef,
                                                                has_default         => ::DISPATCH( $::Bit, 'new', 0 ),
                                                                is_named_only       => ::DISPATCH( $::Bit, 'new', 0 ),
                                                                is_optional         => ::DISPATCH( $::Bit, 'new', 0 ),
                                                                is_slurpy           => ::DISPATCH( $::Bit, 'new', 0 ),
                                                                is_multidimensional => ::DISPATCH( $::Bit, 'new', 0 ),
                                                                is_rw               => ::DISPATCH( $::Bit, 'new', 0 ),
                                                                is_copy             => ::DISPATCH( $::Bit, 'new', 0 ),
                                                            }
                                                        ),
                                                    ]
                                                }
                                            ),
                                            return => $::Undef,
                                        }
                                    ),
                                }
                            )
                        );
                        ::DISPATCH_VAR(
                            $str, 'STORE',
                            ::DISPATCH(
                                ( $GLOBAL::Code_infix_58__60__126__62_ = $GLOBAL::Code_infix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", ) ),
                                'APPLY',
                                ::DISPATCH( $self, 'WHAT', ),
                                ::DISPATCH(
                                    ( $GLOBAL::Code_infix_58__60__126__62_ = $GLOBAL::Code_infix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", ) ),
                                    'APPLY',
                                    ::DISPATCH( $::Str, 'new', '.new(' ),
                                    ::DISPATCH(
                                        ( $GLOBAL::Code_infix_58__60__126__62_ = $GLOBAL::Code_infix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", ) ),
                                        'APPLY',
                                        ::DISPATCH(
                                            ::DISPATCH( $::List,        "new", { _array => [ map { ::DISPATCH( $_, "perl", ) } @{ ::DISPATCH( ::DISPATCH( $self, 'children', ), "array" )->{_value}{_array} } ] } ),
                                            'join', ::DISPATCH( $::Str, 'new', ',' )
                                        ),
                                        ::DISPATCH( ( $GLOBAL::Code_infix_58__60__126__62_ = $GLOBAL::Code_infix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", ) ), 'APPLY', $attrs, ::DISPATCH( $::Str, 'new', ')' ) )
                                    )
                                )
                            )
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
    };
    1
}
{

    package PAST::Node;

    # Do not edit this file - Perl 5 generated by HASH(0x2299ee0)
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
            if ( ::DISPATCH( ::DISPATCH( ::DISPATCH( ( $GLOBAL::Code_VAR_defined = $GLOBAL::Code_VAR_defined || ::DISPATCH( $::Routine, "new", ) ), 'APPLY', $::PAST::Node ), "true" ), "p5landish" ) ) {
                do { }
            }
            else {
                do {
                    do {
                        ::MODIFIED($::PAST::Node);
                        $::PAST::Node = ::DISPATCH( ::DISPATCH( $::Class, 'new', ::DISPATCH( $::Str, 'new', 'PAST::Node' ) ), 'PROTOTYPE', );
                        }
                    }
            }
        };
        ::DISPATCH( ::DISPATCH( $::PAST::Node, 'HOW', ), 'add_parent', ::DISPATCH( $::PCT::Node, 'HOW', ) );
    };
    1
}
{

    package PAST::Var;

    # Do not edit this file - Perl 5 generated by HASH(0x2299ee0)
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
            if ( ::DISPATCH( ::DISPATCH( ::DISPATCH( ( $GLOBAL::Code_VAR_defined = $GLOBAL::Code_VAR_defined || ::DISPATCH( $::Routine, "new", ) ), 'APPLY', $::PAST::Var ), "true" ), "p5landish" ) ) {
                do { }
            }
            else {
                do {
                    do {
                        ::MODIFIED($::PAST::Var);
                        $::PAST::Var = ::DISPATCH( ::DISPATCH( $::Class, 'new', ::DISPATCH( $::Str, 'new', 'PAST::Var' ) ), 'PROTOTYPE', );
                        }
                    }
            }
        };
        ::DISPATCH( ::DISPATCH( $::PAST::Var, 'HOW', ), 'add_parent',    ::DISPATCH( $::PAST::Node, 'HOW', ) );
        ::DISPATCH( ::DISPATCH( $::PAST::Var, 'HOW', ), 'add_attribute', ::DISPATCH( $::Str,        'new', 'name' ) );
        ::DISPATCH( ::DISPATCH( $::PAST::Var, 'HOW', ), 'add_attribute', ::DISPATCH( $::Str,        'new', 'scope' ) );
        ::DISPATCH( ::DISPATCH( $::PAST::Var, 'HOW', ), 'add_attribute', ::DISPATCH( $::Str,        'new', 'lvalue' ) );
    };
    1
}
{

    package Main;

    # Do not edit this file - Perl 5 generated by HASH(0x2299ee0)
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
        my $past;
        $past = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$past' } ) unless defined $past;
        INIT { $past = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$past' } ) }
        ::DISPATCH_VAR(
            $past, 'STORE',
            ::DISPATCH(
                $::PAST::Var,
                'new',
                ::DISPATCH(
                    $::NamedArgument,
                    'new',
                    {   _argument_name_ => ::DISPATCH( $::Str, 'new', 'children' ),
                        value => ::DISPATCH( $::Array, 'new', { _array => [ ::DISPATCH( $::Int, 'new', 1 ), ::DISPATCH( $::Int, 'new', 2 ), ::DISPATCH( $::Int, 'new', 3 ) ] } )
                    }
                ),
                ::DISPATCH(
                    $::NamedArgument,
                    'new',
                    {   _argument_name_ => ::DISPATCH( $::Str, 'new', 'lvalue' ),
                        value           => ::DISPATCH( $::Int, 'new', 1 )
                    }
                ),
                ::DISPATCH(
                    $::NamedArgument,
                    'new',
                    {   _argument_name_ => ::DISPATCH( $::Str, 'new', 'name' ),
                        value           => ::DISPATCH( $::Str, 'new', 'last' )
                    }
                ),
                ::DISPATCH(
                    $::NamedArgument,
                    'new',
                    {   _argument_name_ => ::DISPATCH( $::Str, 'new', 'scope' ),
                        value           => ::DISPATCH( $::Str, 'new', 'package' )
                    }
                )
            )
        );
        ::DISPATCH( ( $GLOBAL::Code_say = $GLOBAL::Code_say || ::DISPATCH( $::Routine, "new", ) ), 'APPLY', ::DISPATCH( $past, 'perl', ) );
    };
    1
}
