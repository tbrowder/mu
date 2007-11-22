
use v6-alpha;

class KindaPerl6::Visitor::ExtractRuleBlock {

    my $count;
    method visit ( $node, $node_name, $path ) {

        #say "Global ",$node_name;

        if    ( $node_name eq 'Rule::Block' )
        {
            use Data::Dumper;
            my $comp_unit := $path[0-1];
            $count := $count + 1;
            my $name := '__rule_block' ~ $count ~ '_' ~ $COMPILER::source_md5;
            push @(($comp_unit.body).body), ::Method(block=> ::Lit::Code(
                    body => ($node.closure).body,
                    sig => ::Sig(
                        invocant   => '',
                        positional => [
                            ::Lit::SigArgument(
                                key           => ::Var(
                                    namespace   => [],
                                    name        => 'MATCH',
                                    twigil      => '',
                                    sigil       => '$',
                                ),
                                value         => undef,
                                type          => '',
                                is_multidimensional => ::Val::Bit( bit => '0', ),
                                is_slurpy     => ::Val::Bit( bit => '0', ),
                                is_optional   => ::Val::Bit( bit => '0', ),
                                is_named_only => ::Val::Bit( bit => '0', ),
                                is_copy       => ::Val::Bit( bit => '0', ),
                                is_rw         => ::Val::Bit( bit => '0', ),
                                has_default   => ::Val::Bit( bit => '0', ),
                            ),
                        ],
                    ),
                    pad => ::Pad(
                        lexicals => [
                            ::Decl(
                                decl => 'my',
                                var  => ::Var(
                                    namespace => [],
                                    name      => '_',
                                    twigil    => '',
                                    sigil     => '@',
                                ),
                                type => '',
                            ),
                            ::Decl(
                                decl => 'my',
                                var  => ::Var(
                                    namespace => [],
                                    name      => 'MATCH',
                                    twigil    => '',
                                    sigil     => '$',
                                ),
                                type => '',
                            )
                        ],
                    ),
                    state => {},
                  ), name=>$name);
            push @(($node.closure).body), ::Return(result=>::Val::Buf(buf=>'sTrNgE V4l'));
            $node.closure($name);
            return $node;
        };
        0;
    };

}

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
