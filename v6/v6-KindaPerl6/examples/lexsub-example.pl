class X {
    my  $a;
        sub xxx { 123 };  # our
    our sub xxx { 123 };
    my  sub xxx { 123 };
    my $a := sub { 123 };

    do {
        my  $a;
            sub xxx { 123 };
        our sub xxx { 123 };
        my  sub xxx { 123 };
        my $a := sub { 123 };
    }

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
