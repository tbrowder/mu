package main;

use lib 'inc/v6-MiniPerl6-lib5';
use strict;
use Getopt::Long;

=head1 NAME

mp6 - MiniPerl6 compiler, produces perl5 code.

=head1 SYNOPSIS

mp6.pl --noperltidy   < perl6-code.pl  > perl5-code.pl

or

mp6.pl --noperltidy perl6-code.pl > perl5-code.pl

=head1 OPTIONS

=over

=item --noperltidy

Do not try to emit pretty code.

=item --perltidyrc=[file]

use [file] for the perltidyrc file.  NOTE: this code will default to
$ENV{ PERLTIDY } if available, and if not, it will default then to
util/perltidyrc.

=item -o or --output=[file]

use [file] to write to the output.  If the file exists, it will be overwritten

=back

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

=cut

#
# Get command line options
#

my %opt = ( perltidy => 1, perltidyrc => '', output => '' );

Getopt::Long::Parser->new( config => [qw( bundling no_ignore_case pass_through require_order)], )->getoptions(
    # Prettify the code
    'perltidy!' => \$opt{perltidy},

    # use which file?
    'perltidyrc=s' => \$opt{perltidyrc},

    # output
    'o|output=s' => \$opt{output},
);

# Perl::Tidy's documentation is being updated to note that it has a ENV option
if ( $opt{ perltidy} && ! $opt{perltidyrc} ) {
    if ( $ENV{ PERLTIDY } ) { # I recommend you use YOUR full path
        $opt{perltidyrc} = $ENV{ PERLTIDY };
    } else {
        $opt{perltidyrc} = 'util/perltidyrc';
    }
    die "No perltidyrc file is available for use" unless -e $opt{perltidyrc};
}

# We're done getting our parameters

BEGIN {
    $::_V6_COMPILER_NAME    = 'MiniPerl6';
    $::_V6_COMPILER_VERSION = '0.003';
}

use MiniPerl6::Perl5::Runtime;
use MiniPerl6::Perl5::Match;

package Main; # <= Note that the package namespace has changed

use MiniPerl6::Grammar;
use MiniPerl6::Perl5::Emitter;
use MiniPerl6::Grammar::Regex;
use MiniPerl6::Emitter::Token;

my $source = load_source();
my $pos = 0;

my $code = ' ' x (10 * 1024); $code =''; # pre-expand $code buffer space;

# start $code off with a header file

$code = <<EOT;
# Do not edit this file - Generated by MiniPerl6
use v5;
use strict;
use MiniPerl6::Perl5::Runtime;
use MiniPerl6::Perl5::Match;
EOT

# use MiniPerl6;:Grammar->comp_unit($source, $pos) to parse and insert code
# into $code.

while ( $pos < length( $source ) ) {
    #say( "Source code:", $source );
    my $p = MiniPerl6::Grammar->comp_unit($source, $pos);
    #say( Main::perl( $$p ) );
    $code .= join( ";\n", (map { $_->emit() } ($$p) )) . "\n";
    #say( $p->to, " -- ", length($source) );
    $code .= ";\n";
    $pos = $p->to;
}

# finish $code off with a 1; true value.

$code .= "1;\n";

# perltidy option is set.

# WARNING - WARNING - WARNING - WARNING - WARNING - WARNING - WARNING
# Requiring Perl::Tidy before MiniPerl6::Grammar is run, produces this error
# kitty:~/perl6> /usr/bin/perl script/mp6.pl-daniel < src/KindaPerl6/Ast.pm > daniel.pl
# Deep recursion on subroutine "MiniPerl6::Grammar::pod_begin" at inc/v6-MiniPerl6-lib5/MiniPerl6/Grammar.pm line 17, <> line 1
# 276.
# WARNING - WARNING - WARNING - WARNING - WARNING - WARNING - WARNING

eval { require Perl::Tidy };
if ( $@ ) {
    $opt{perltidy} = 0;
} else {
    $^W = 0; # perltidy globally turns on warnings, do NOT turn this on
             # unless you want to see a lot of complaints.
}

{
    my $output;
    if ( $opt{ output } ) {
    	$output = IO::File->new( $opt{ output }, 'w');
    } else {
     	$output = IO::Handle->new();
        $output->fdopen(fileno(STDOUT),'w');
    }

    if ( $opt{perltidy} ) {
        Perl::Tidy::perltidy(
            source => \$code,
            destination => $output,
            perltidyrc => $opt{perltidyrc},
            argv => '',
         );
    } else {
    	$output->print( $code );
    	$output->close();
    }
}

#
# End of main program
#

exit(0);

#
# Utility functions
#

# Eat that File::Slurp!
sub slurp {
    do {
        local ( @ARGV, $/ ) = $_[0];
        scalar <>;
    };
}

# similar to the code in kp6, however we do not support "-e"
sub load_source {
    my $source;

    if ( -t STDIN ) {

        # STDIN is open to a terminal, i.e. we're being run as `kp6 file.p6'.
        # slurp the file
        my ( $file, @args ) = @ARGV;

        if ( $file ) {
            $source = slurp($file);
        }
        else {
            $source = '';
        }
    }
    else {

        # Called as `kp6 < file.p6', get source code from STDIN
        local $/;
        $source = <>;
    }

    return $source;
}
