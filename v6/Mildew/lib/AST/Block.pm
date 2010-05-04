class AST::Block extends AST::Base {
    has 'stmts' => (is=>'ro');
    has 'regs' => (is=>'ro',default=>sub {[]});
    method m0ld($ret) {
        "my $ret = mold {\n"
            . join('',map {'my $'.$_.";\n"} @{$self->regs})
            . join("",map { $_->m0ld('$void') } @{$self->stmts})
        . "};\n";
    }
    method pretty {
        return 'mold {...}' if defined $Mildew::consise_pretty;
        "mold \{\n". AST::indent(
            join('',map {'my $'.$_.";\n"} @{$self->regs})
            . join("",map {AST::terminate_stmt  $_->pretty } @{$self->stmts})
        ) . "\}"
    }
    method simplified {
        my @stmts;
        my $value;
        for (@{$self->stmts}) {
            my @side_effects;
            ($value,@side_effects) = $_->simplified;
            push (@stmts,@side_effects);
        }
        AST::Block->new(regs=>$self->regs,stmts=>[@stmts,$value]);
    }
    method took {
        my $took = 0;
        for (@{$self->stmts}) {
            $took += $_->took;
        }
        $took;
    }
    method forest {
        local $Mildew::consise_pretty = 1;
        Forest::Tree->new(node=> 'mold {...}' . ($Mildew::took ? ' - ' . sprintf("%.4f",$self->took) : ''),children=>[map {$_->forest } @{$self->stmts}]);
    }
}