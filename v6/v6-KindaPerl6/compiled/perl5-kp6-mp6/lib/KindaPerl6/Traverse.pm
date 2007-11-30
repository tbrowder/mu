# Do not edit this file - Generated by MiniPerl6
use v5;
use strict;
use MiniPerl6::Perl5::Runtime;
use MiniPerl6::Perl5::Match;

package KindaPerl6::Traverse;
sub new { shift; bless {@_}, "KindaPerl6::Traverse" }

sub visit {
    my $List__ = \@_;
    my $visitor;
    my $node;
    my $node_name;
    my $path;
    do { $visitor = $List__->[0]; $node = $List__->[1]; $node_name = $List__->[2]; $path = $List__->[3]; [ $visitor, $node, $node_name, $path ] };
    do {
        if ( ( defined($path) ? 0 : 1 ) ) { $path = [] }
        else                              { }
    };
    do {
        if ( ( Main::isa( $node, 'Array' ) || Main::isa( $node, 'List' ) ) ) {
            my $result = [];
            my $subitem;
            do {
                for my $subitem ( @{$node} ) { push( @{$result}, visit_subnode( $visitor, $subitem, $path ) ) }
            };
            return ($result);
        }
        else { }
    };
    do {
        if ( Main::isa( $node, 'Hash' ) ) {
            my $result = {};
            my $subitem;
            do {
                for my $subitem ( keys( %{$node} ) ) { $result->{$subitem} = visit_subnode( $visitor, $node->{$subitem}, $path ) }
            };
            return ($result);
        }
        else { }
    };
    do {
        if   ( Main::isa( $node, 'Str' ) ) { return ($node) }
        else                               { }
    };
    do {
        if   ( Main::isa( $node, 'Pad' ) ) { return ($node) }
        else                               { }
    };
    $path = [ $node, @{$path} ];
    my $result = $visitor->visit( $node, $node_name, $path );
    do {
        if   ($result) { return ($result) }
        else           { }
    };
    my $result = {};
    my $data   = $node->attribs();
    my $item;
    do {
        for my $item ( keys( %{$data} ) ) { $result->{$item} = visit_subnode( $visitor, $data->{$item}, $path ) }
    };
    return ( $node->new( %{$result} ) );
}

sub visit_subnode {
    my $List__ = \@_;
    my $visitor;
    my $subnode;
    my $path;
    do { $visitor = $List__->[0]; $subnode = $List__->[1]; $path = $List__->[2]; [ $visitor, $subnode, $path ] };
    do {
        if ( ( defined($subnode) ? 0 : 1 ) ) { return ( (undef) ) }
        else                                 { }
    };
    do {
        if ( ( Main::isa( $subnode, 'Array' ) || ( Main::isa( $subnode, 'List' ) || ( Main::isa( $subnode, 'Hash' ) || ( Main::isa( $subnode, 'Str' ) || Main::isa( $subnode, 'Pad' ) ) ) ) ) ) { return ( visit( $visitor, $subnode, (undef), $path ) ) }
        else                                                                                                                                                                                    { return ( $subnode->emit( $visitor, $path ) ) }
        }
}

1;
