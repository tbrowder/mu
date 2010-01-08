﻿/*
  Copyright (c) 2009, 2010 Matthew Wilson <diakopter@gmail.com>

  Permission is hereby granted, free of charge, to any person
  obtaining a copy of this software and associated documentation
  files (the "Software"), to deal in the Software without
  restriction, including without limitation the rights to use,
  copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the
  Software is furnished to do so, subject to the following
  conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  OTHER DEALINGS IN THE SOFTWARE.
*/

// Begin portions written by and copyright of Alessandro Warth in OMeta/JS
var escapeStringFor = {};
for (var c = 0; c < 256; c++)
  escapeStringFor[c] = String.fromCharCode(c);
escapeStringFor["\\".charCodeAt(0)] = "\\\\";
escapeStringFor["\"".charCodeAt(0)] = '\\"';
escapeStringFor['\''.charCodeAt(0)] = "\\'";
escapeStringFor["\r".charCodeAt(0)] = "\\r";
escapeStringFor["\n".charCodeAt(0)] = "\\n";
escapeStringFor["\t".charCodeAt(0)] = "\\t";
escapeStringFor["\f".charCodeAt(0)] = "\\f";
escapeChar = function(c) {
  return c > 255 ? String.fromCharCode(c) : escapeStringFor[c];
}

function unescapeString(s) {
  if (s[0] == '\\')
    switch (s[1]) {
      case '\\': return '\\';
      case 'r':  return '\r';
      case 'n':  return '\n';
      case 't':  return '\t';
      case 'f':  return '\f';
      case "'":  return '\'';
      case '"':  return '\"';
      default:   return s[1];
    }
  else
    return s;
}

String.prototype.toProgramString = function toProgramString() {
  var ws = [], c;
  for (var idx = 0, len = this.length; idx < len; ++idx)
    ws[idx] = ((c = this.charCodeAt(idx)) > 255 ? String.fromCharCode(c) : escapeStringFor[c]);
  return ws.join('');
}
// End portions written by and copyright of Alessandro Warth in OMeta/JS

String.prototype.toQuotedString = function toQuotedString() {
  return '"' + this.toProgramString() + '"';
}

var wasSurrogatePair = false;
// from https://developer.mozilla.org/En/Core_JavaScript_1.5_Reference/Global_Objects/String/CharCodeAt
String.prototype.codepoint = function codepoint(idx) {
  var code = this.charCodeAt(idx);
  if (0xD800 <= code && code <= 0xDBFF) {
    wasSurrogatePair = true;
    return ((code - 0xD800) * 0x400) + (this.charCodeAt(idx+1) - 0xDC00) + 0x10000;
  }
  wasSurrogatePair = false;
  return code;
}

Array.prototype.mapVals = function(fun) {
  var len = this.length >>> 0;
  var res = new Array(len);
  for (var i = 0; i < len; i++)
    res[i] = fun.call(this[i]);
  return res;
};


var derives = (function() {
  function F() {} // cause a constructor's prototype chain to inherit from another's
  return function(ctor, parent) {
    F.prototype = parent.prototype;
    ctor.prototype = new F();
  };
})();


var top = this;

function make_unit_ctor() { return function(){ } }
function make_unary_ctor() { return function(l){ this.l=l } }
function make_binary_ctor() { return function(l,r){ this.l=l;this.r=r } }
function make_trinary_ctor() { return function(l,m,r){ this.l=l;this.m=m;this.r=r } }
function make_quarnary_ctor() { return function(l,m,n,r){ this.l=l;this.m=m;this.n=n;this.r=r } }

function Expr_val(v) { this.v = v }
Expr_val.prototype.emit = function() { return this.v };
function val(v) { return new Expr_val(v) }
function dval(v) { return new Expr_val(dbg ? v : '') }

var Expr_func = make_binary_ctor();
Expr_func.prototype.emit = function() {
  var code = 'new Function('+(
    this.l.length > 0
      ? this.l.mapVals(String.prototype.toQuotedString, this.l).join(',') + ','
      : ''
  )+'"';
  for(var i=0,l=this.r.length;i<l-1;++i)
    code += this.r[i].emit().toProgramString() + ';';
  if (l > 0) {
    var last = this.r[l-1].emit();
    code += (/^(?:return|if|while|var|break|continue|default:|case)\s/.test(last) ? '' : 'return ') + last;
  }
  return code + '")';
};
function func(args,stmts) { return new Expr_func(args,stmts) }

var Expr_cond = make_binary_ctor();
Expr_cond.prototype.emit = function() {
  var code = 'if'+this.l.emit()+'{', l=this.r.length;
  for(var i=0,l2=this.r[0].length;i<l2;++i)
    code += this.r[0][i].emit() + ';';
  code += '}';
  for(var i=1;i<l-1;i+=2) {
    code += 'else if'+this.r[i].emit()+'{';
    for(var j=0,l2=this.r[i+1].length;j<l2;++j)
      code += this.r[i+1][j].emit() + ';';
    code += '}';
  }
  if (l % 2 == 0) {
    code += 'else{';
    for(var i=0,l2=this.r[l-1].length;i<l2;++i)
      code += this.r[l-1][i].emit() + ';';
    code += '}';
  }
  return code;
};
function cond(condition,clauses) { return new Expr_cond(condition,clauses) }

function infix(space, name, sym) {
  space[name] = new Function("l","r","return new Expr_"+name+"(l,r)");
  var f = space['Expr_'+name] = make_binary_ctor();
  f.prototype.emit =
    new Function('return"("+this.l.emit()+"'+sym+'"+this.r.emit()+")"');
}

function prefix(space, name, sym, noparens) {
  space[name] = new Function("l","return new Expr_"+name+"(l)");
  var f = space['Expr_'+name] = make_unary_ctor();
  f.prototype.emit = noparens
    ? new Function('return"("+this.l.emit()+"'+sym+')"')
    : new Function('return"('+sym+'("+this.l.emit()+"))"');
}

function postfix(space, name, sym, noparens) {
  space[name] = new Function("l","return new Expr_"+name+"(l)");
  var f = space['Expr_'+name] = make_unary_ctor();
  f.prototype.emit = noparens
    ? new Function('return"'+sym+'("+this.l.emit()+")"')
    : new Function('return"('+sym+'("+this.l.emit()+"))"');
}

function ternary(space, name, lsym, rsym) {
  space[name] = new Function("l","m","r","return new Expr_"+name+"(l,m,r)");
  var f = space['Expr_'+name] = make_trinary_ctor();
  f.prototype.emit =
    new Function('return"("+this.l.emit()+"'+lsym+'"+this.m.emit()+"'+rsym+'"+this.r.emit()+")"');
}

// merely some codegen deferred macro-builders.  Eventually each of the emitter
// methods will accept an object representing the current routine as the first
// parameter.

infix(top, "add", "+");
infix(top, "sub", "-");
infix(top, "mul", "*");
infix(top, "div", "/");
infix(top, "mod", "%");
infix(top, "lt", "<");
infix(top, "le", "<=");
infix(top, "gt", ">");
infix(top, "ge", ">=");
infix(top, "eq", "==");
infix(top, "ne", "!=");
infix(top, "bor", "|");
infix(top, "bxor", "^");
infix(top, "band", "&");
infix(top, "bsl", "<<");
infix(top, "bsr", ">>");
infix(top, "lor", "||");
infix(top, "land", "&&");
infix(top, "same", "===");
infix(top, "assign", "=");
infix(top, "add_assign", "+=");
infix(top, "sub_assign", "-=");
infix(top, "mul_assign", "*=");
infix(top, "div_assign", "/=");
infix(top, "mod_assign", "%=");
infix(top, "label", ": ", true);

prefix(top, "num", "+");
prefix(top, "preinc", "++", true);
prefix(top, "ret", "return ", true);
prefix(top, "loc", "var ", true);
prefix(top, "predec", "--", true);

postfix(top, "postinc", "++", true);
postfix(top, "postdec", "--", true);

ternary(top, "tern", "?", ":");


//var f = eval(func(["zz","yy"],[assign(val("yy"),add(sub(val("zz"),val(2)),val(8))),val("yy"),cond(lt(val(62),val("yy")),[[val("66")],[val("999")]]),val("99")]).emit());
//print(f);
//print(f(58,44));


var gtr = (function() {
  var count = 2;
  return function() { // grammar transition record constructor.
    this.id = ++count;
    return this;
  };
})();

function gts() { // base grammar transition set
  this.fail = new gtr(); // each transition set has a fail label destination
}

var gl = val("gl"); // the next target goto label variable expression
var i = val("i"); // the input variable expression
var o = val("o"); // the offset variable expression
var t = val("t"); // the State variable expression
var b = val("break"); // macro for "break" instruction
var d = val("t={i:t,s:o}"); // macro for "descend into new State object"
var a = val("t=t.i"); // macro for "ascend to parent State object"
var dls = val("t.i.l=t;t=t.i"); // macro for "store the last in my left"
var dl = val("t=t.l"); // macro for "descend into my left"
var drs = val("t.i.r=t");
var dr = val("t=t.r");
var ros = val("o=t.s"); // macro for "reset offset to my start"
var bbt = val("gl=t.n;t=t.t;break"); // macro for "goto the next computed goto" (see goton())

function gotol(lbl) { // macro for goto label with id of the transition object
  return val("gl="+lbl.id+";break");
}

function goton(lbl) { // goto next (set computed goto for next transition)
  return val("t.n="+lbl.id);
}

function casel(lbl) { // macro for MARK label with id of the transition object
  return val("case "+lbl.id+":");
}

function lit(literal) { return new glit(literal) }
function glit(literal) { // grammar literal parser builder
  gts.call(this); // call the parent constructor
  this.b = false;
  this.v = utf32str(literal);
}
derives(glit, gts);
glit.prototype.emit = function(c) {
  c.r.push(cond(ne(val("i.substr(o,"+this.v.l+")"),val(this.v.str.toQuotedString())),[[
    gotol(this.fail)
  ],[
    add_assign(o,val(this.v.l))
  ]]));
  // TODO: inline each char check instead of calling substr
/*  c.r.push(cond(ne(val(0),bxor(val("i[o]"),val(this.v[0]))),[[
    assign(gl,val(this.fail.id)),
    b
  ]]));
  for (var chars=this.v,k=1,l=chars.l;k<l;++k) {
    c.r.push(cond(ne(val(0),bxor(val("i[o+"+k+"]"),val(chars[k]))),[[
      assign(gl,val(this.fail.id)),
      b
    ]]));
  }*/
};

function gend() { // grammar "end anchor" parser builder
  gts.call(this); // call the parent constructor
  this.b = false;
}
derives(gend, gts);
gend.prototype.emit = function(c) {
  c.r.push(cond(ne(o,val("i.l")),[[
    gotol(this.fail)
  ]]));
};
var end = (function() {
  var ender = new gend();
  return function() {
    return ender;
  }
})();

function gbeg() { // grammar "beginning anchor" parser builder
  gts.call(this); // call the parent constructor
  this.b = false;
}
derives(gbeg, gts);
gbeg.prototype.emit = function(c) {
  c.r.push(val("o=0")); // just set current offset to 0. TODO: make parametric
  // on the match start, for when we don't start at offset 0.
};
var beg = (function() {
  var beger = new gbeg();
  return function() {
    return beger;
  }
})();

/* Code block generation conventions/rules:
 *  - both non-deterministic (possibly-backtracking) nodes and
      deterministic nodes "fall through" to the end of their code emission
      block upon "done" success.
    - non-deterministic nodes leave their State object ("t" in the generated code)
      on the "t" stack (the "t" local) when returning notdone or done, so that
      its invoker can stash a copy of it if necessary.  When failing, a nondeterministic
      node must pop itself from the t stack ("t=t.i") (where .i is short for
      .invoker) to allow for "fastfail" gotos.
    - the constructors for non-deterministic nodes (compile-time) create their own
      ".bt" (backtrack entry point) and ".init" (initial entry point) transition
      records, but each's parent will create their .notd (not done return path)
      and .done (done return path) transition records.
    - each nondeterministic node creates its own State object, and when backtracking,
      the parent of a nondeterministic node descends the binary tree into the proper
      path branch by setting "t=t.l" (or "t=t.r") as the case may be.
    - failing paths in nondeterministic nodes do not reset the offset (into the
      input) themselves, but rather let the backtracking nodes do it.
 */
  
function gboth(l, r) { // grammar "deterministic both" parser builder
  gts.call(this, this.l = l, this.r = r); // call the parent constructor
  this.b = false;
}
derives(gboth, gts);
gboth.prototype.emit = function(c) {
  this.l.fail = this.r.fail = this.fail; // short-circuit the children's fail goto
  this.l.emit(c);
  this.r.emit(c);
};

function gbothls(l, r) { // grammar "both left nondeterministic" parser builder
  gts.call(this, this.l = l, this.r = r); // call the parent constructor
  this.b = true;
  this.init = new gtr();
  this.bt = new gtr();
  l.notd = new gtr(); // give left a "not done" transition
  l.done = new gtr(); // give left a "done" transition
}
derives(gbothls, gts);
gbothls.prototype.emit = function(c) {
  c.r.push(
    casel(this.init),d // initial entry point
  );
  this.l.emit(c);
  var rightinit = new gtr(); // a label for initial right when backtracking
  c.r.push(
    casel(this.l.done), // left succeeded with finality
    a, // ascend; we don't need a reference to left; it's done
    val("t.ld=true"),
    
    casel(rightinit)
  );
  this.r.emit(c);
  c.r.push(
    // right succeeded; we're either done or not.
    val("gl=t.ld?"+this.done.id+":"+this.notd.id+";break"),

    casel(this.l.notd),
    val("t.i.l=t;t=t.i;t.ld=false"),
    gotol(rightinit),
    
    casel(this.r.fail),
    cond(val("(t.ld)"),[[
      a,
      gotol(this.fail)
    ]]),
    ros,
    
    casel(this.bt),
    val("t=t.l"),
    gotol(this.l.bt)
  );
};

function gbothrs(l, r) { // grammar "both right nondeterministic" parser builder
  gts.call(this, this.l = l, this.r = r); // call the parent constructor
  this.b = true;
  this.init = new gtr();
  this.bt = new gtr();
  r.notd = new gtr(); // give right a "not done" transition
  r.done = new gtr(); // give right a "done" transition
}
derives(gbothrs, gts);
gbothrs.prototype.emit = function(c) {
  c.r.push(
    casel(this.init),d // initial entry point
  );
  this.l.fail = this.r.fail;
  this.l.emit(c);
  c.r.push(
    val("t.la=o") // mark how far left advanced
  );
  this.r.emit(c);
  c.r.push(
    casel(this.r.done), // right succeeded with finality
    a, // ascend from right
    val("t.r=null"), // nullify the reference to help the GC
    gotol(this.done), // return "done"
    
    casel(this.r.notd), // right succeeded, but is not done.
    val("t.i.r=t;t=t.i"), // stash right in myself; ascend
    gotol(this.notd), // return "not done"
    
    casel(this.bt), // backtrack entry point
    val("o=t.la;t=t.r"),
    gotol(this.r.bt),
    
    casel(this.r.fail), // right failed
    a, // ascend
    gotol(this.fail) // goto our fail
  );
};

function gbothlrs(l, r) { // grammar "both left and right nondeterministic" parser builder
  gts.call(this, this.l = l, this.r = r); // call the parent constructor
  this.b = true;
  this.init = new gtr();
  this.bt = new gtr();
  l.notd = new gtr(); // give left a "not done" transition
  l.done = new gtr(); // give left a "done" transition
  r.notd = new gtr(); // give right a "not done" transition
  r.done = new gtr(); // give right a "done" transition
}
derives(gbothlrs, gts);
gbothlrs.prototype.emit = function(c) {
  c.r.push(
    casel(this.init),d // initial entry point
  );
  this.l.fail = this.r.fail;
  this.l.emit(c);
  var rightinit = new gtr(); // a label for initial right when backtracking
  c.r.push(
    casel(this.l.done), // left succeeded with finality
    a, // ascend; we don't need a reference to left; it's done
    val("t.ld=true;t.la=o"),
    gotol(rightinit),
    
    casel(this.l.notd),
    val("t.i.l=t;t=t.i;t.ld=false;t.la=o"),
    casel(rightinit)
  );
  this.r.emit(c);
  c.r.push(
    casel(this.r.done), // right succeeded with finality
    a, // ascend from right
    val("t.r=null"), // nullify the reference to help the GC
    cond(val("(t.ld)"),[[
      gotol(this.done) // return "done"
    ]],[[
      val("t.rd=true"), // mark right as done
      gotol(this.notd) // return "not done"
    ]]),
    
    casel(this.r.notd), // right succeeded, but is not done.
    val("t.i.r=t;t=t.i"), // stash right in myself; ascend
    val("t.rd=false"), // mark right as not done
    gotol(this.notd), // return "not done"
    
    casel(this.bt), // backtrack entry point
    cond(val("(t.rd)"),[[
      val("o=t.s;t=t.l"),
      gotol(this.l.bt)
    ]]),
    val("o=t.la;t=t.r"),
    gotol(this.r.bt),
    
    casel(this.r.fail), // right failed
    a, // ascend
    gotol(this.fail) // goto our fail
  );
};

function both(l,r) {
  return l.b || r.b
    ? !r.b
      ? new gbothls(l,r) // only left nondeterministic
      : !l.b
        ? new gbothrs(l,r) // only right nondeterministic
        : new gbothlrs(l,r) // both nondeterministic
    : new gboth(l,r); // fully deterministic; neither      (yay, fully inlined)
}

function geither(l,r) { // grammar "deterministic alternation" parser builder
  gts.call(this, this.l = l, this.r = r); // call the parent constructor
  this.b = true;
  this.init = new gtr(); // add a transition record for my initial entry point
  this.bt = new gtr(); // add a transition record for my backtrack entry point
}
derives(geither, gts);
geither.prototype.emit = function(c) {
  c.r.push(
    casel(this.init),d
  );
  this.l.emit(c);
  c.r.push( // left succeeded
    gotol(this.notd), // return "not done"
    
    casel(this.r.fail), // right failed
    a,
    gotol(this.fail), // goto our fail
    
    casel(this.l.fail),
    ros,
    casel(this.bt)
  );
  this.r.emit(c);
  //c.r.push(
  //  gotol(this.done)
  //);
};

function geitherls(l,r) { // grammar "left nondeterministic alternation" parser builder
  gts.call(this, this.l = l, this.r = r); // call the parent constructor
  this.b = true;
  l.notd = new gtr(); // give left a "not done" transition
  l.done = new gtr(); // give left a "done" transition
  this.init = new gtr(); // add a transition record for my initial entry point
  this.bt = new gtr(); // add a transition record for my backtrack entry point
  r.init = new gtr(); // add a transition record for right initial
}
derives(geitherls, gts);
geitherls.prototype.emit = function(c) {
  c.r.push(
    casel(this.init),d // initial entry point
  );
  this.l.emit(c);
  c.r.push(
    casel(this.l.done), // left succeeded with finality
    a, // ascend
    val("t.t=t"), // set myself as the next node to which to backtrack
    goton(this.r.init), // mark to return to the right backtrack point.
    gotol(this.notd), // return "not done"
    
    casel(this.l.notd), // left succeeded, but is not done.
    val("t.i.t=t;t=t.i"), // stash left in myself; ascend
    goton(this.l.bt), // mark to return to the left backtrack point.
    gotol(this.notd), // return "not done"
    
    casel(this.bt), // backtrack entry point
    ros, // reset to start (TODO: I suspect extraneous)
    bbt,
    
    casel(this.r.fail), // right failed
    a, // ascend
    gotol(this.fail), // goto our fail
    
    casel(this.l.fail), // left failed
    ros,
    casel(this.r.init) // right initial entry point
  );
  this.r.emit(c);
  c.r.push(a);
};

function geitherrs(l,r) { // grammar "right nondeterministic alternation" parser builder
  gts.call(this, this.l = l, this.r = r); // call the parent constructor
  this.b = true;
  r.notd = new gtr(); // give right a "not done" transition
  r.done = new gtr(); // give right a "done" transition
  this.init = new gtr(); // add a transition record for my initial entry point
  this.bt = new gtr(); // add a transition record for my backtrack entry point
}
derives(geitherrs, gts);
geitherrs.prototype.emit = function(c) {
  c.r.push(
    casel(this.init),d // initial entry point
  );
  this.l.emit(c);
  c.r.push(
    val("t.ri=false"), // mark that r has not been inited
    gotol(this.notd),
    
    casel(this.l.fail),
    val("t.ri=true"), // mark that r has been inited
    ros
  );
  this.r.emit(c);
  c.r.push(
    casel(this.r.done), // right succeeded with finality
    a, // ascend from right
    val("t.r=null"), // nullify the reference to help the GC
    gotol(this.done), // return "done"
    
    casel(this.r.notd), // right succeeded, but is not done.
    val("t.i.r=t;t=t.i"), // stash right in myself; ascend
    gotol(this.notd), // return "not done"
    
    casel(this.bt), // backtrack entry point
    cond(val("(t.ri)"),[[ // if right has been inited before
      val("t=t.r"),
      gotol(this.r.bt)
    ],[
      gotol(this.l.fail)
    ]]),
    
    casel(this.r.fail), // right failed
    a, // ascend
    gotol(this.fail) // goto our fail
  );
};

function geitherlrs(l,r) { // grammar "left and right nondeterministic alternation" parser builder
  gts.call(this, this.l = l, this.r = r); // call the parent constructor
  this.b = true;
  this.init = new gtr(); // add a transition record for my initial entry point
  this.bt = new gtr(); // add a transition record for my backtrack entry point
  l.notd = new gtr(); // give left a "not done" transition
  l.done = new gtr(); // give left a "done" transition
  r.notd = new gtr(); // give right a "not done" transition
  r.done = new gtr(); // give right a "done" transition
}
derives(geitherlrs, gts);
geitherlrs.prototype.emit = function(c) {
  c.r.push(
    casel(this.init),d // initial entry point
  );
  this.l.emit(c);
  c.r.push(
    casel(this.l.done), // left succeeded with finality
    a, // ascend
    val("t.ld=true;t.ri=false"), // mark that r has not been inited
    gotol(this.notd), // return "not done"
    
    casel(this.l.notd), // left succeeded, but is not done.
    val("t.i.l=t"),
    a, // ascend
    val("t.ld=false"), // mark that r has not been inited
    gotol(this.notd), // return "not done"
    
    casel(this.l.fail),
    val("t.ld=t.ri=true"), // mark that r has been inited
    ros
  );
  this.r.emit(c);
  c.r.push(
    casel(this.r.done), // right succeeded with finality
    a, // ascend from right
    val("t.r=null"), // nullify the reference to help the GC
    gotol(this.done), // return "done"
    
    casel(this.r.notd), // right succeeded, but is not done.
    val("t.i.r=t;t=t.i"), // stash right in myself; ascend
    gotol(this.notd), // return "not done"
    
    casel(this.bt), // backtrack entry point
    cond(
      val("(!t.ld)"),[[ // if left isn't done
        val("t=t.l"),
        gotol(this.l.bt)
      ], // else if
      val("(!t.ri)"),
      [
        gotol(this.l.fail)
      ],[ // else
        val("t=t.r"),
        gotol(this.r.bt)
      ]
    ]),
    
    casel(this.r.fail), // right failed
    a, // ascend
    gotol(this.fail) // goto our fail
  );
};

function either(l,r) {
  return l.b || r.b
    ? !r.b
      ? new geitherls(l,r) // only left nondeterministic
      : !l.b
        ? new geitherrs(l,r) // only right nondeterministic
        : new geitherlrs(l,r) // both nondeterministic
    : new geither(l,r); // neither nondeterministic
}

function gplus(l) { // grammar "deterministic" edition of plus
  gts.call(this, this.l = l); // call the parent constructor
  this.b = true;
  this.init = new gtr(); // add a transition record for my initial entry point
  this.bt = new gtr(); // add a transition record for my backtrack entry point
}
derives(gplus, gts);
gplus.prototype.emit = function(c) {
  var retry = new gtr(), check = new gtr(); // label for retry spot
  var lname = "l"+this.init.id;
  c.r.push(
    val("var "+lname),
    casel(this.init),
    cond(val("(("+lname+"||("+lname+"={}))[o])"),[[
      //dval("print('gplus already failed at '+o)"),
      gotol(this.fail)
    ]]),
    val(lname+"[o]=true"),
    d,
    //dval("print('gplus init '+o)"),
    val("t.z=[]"), // create a container for the match offsets
    casel(retry)
  );
  this.l.emit(c);
  c.r.push( // left succeeded
    cond(val("(t.s==o)"),[[ // child is a zero-length assertion
      //dval("print('gplus done '+o)"),
      //dval("print('marking gplus DONE at '+t.s)"),
      val(lname+"[o]=true"),
      gotol(this.done)
    ]]),
    val("t.z.push(o)"),
    //dval("print('gplus retry '+o)"),
    gotol(retry), // try another one
    
    casel(this.l.fail), // left hit its base case
    //dval("print('gplus l.fail '+o)"),
    cond(val("(t.z.length==0)"),[[
      val(lname+"[o]=true"),
      //dval("print('marking gplus failed at '+t.s)"),
      a,
      //dval("print('gplus fail '+o)"),
      gotol(this.fail)
    ]]),
    casel(check),
    cond(val("(t.z.length==1)"),[[
      val("o=t.z.pop()"),
      //dval("print('marking gplus DONE at '+t.s)"),
      val(lname+"[o]=true"),
      //dval("print('gplus done '+o)"),
      gotol(this.done)
    ]]),
    val(lname+"[o]=true"),
    //dval("print('marking gplus done at '+t.s)"),
    //dval("print('gplus notd '+o)"),
    gotol(this.notd),
    
    casel(this.bt),
    //dval("print('gplus bt '+o)"),
    val("o=t.z.pop()"),
    cond(val("(t.z.length>0)"),[[
      gotol(check)
    ]]),
    //dval("print('marking gplus failed at '+t.s)"),
    //val(lname+"[t.s]=true"),
    a,
    //dval("print('gplus fail '+o)"),
    gotol(this.fail)
  );
};

function gplusb(l) { // grammar "deterministic" edition of plus
  gts.call(this, this.l = l); // call the parent constructor
  this.b = true;
  this.init = new gtr(); // add a transition record for my initial entry point
  this.bt = new gtr(); // add a transition record for my backtrack entry point
  l.init = new gtr(); // give left an "init" transition
  l.notd = new gtr(); // give left a "not done" transition
  l.done = new gtr(); // give left a "done" transition
}
derives(gplusb, gts);
gplusb.prototype.emit = function(c) {
  var retry = new gtr(); // label for retry spot
  c.r.push(
    casel(this.init),d,
    val("t.z8=[];t.ret={}"), // create containers for the child objects
    casel(retry)//,
    //dval("print('gplusb retry '+o)")
  );
  this.l.emit(c);
  c.r.push(
    casel(this.l.done), // left succeeded
    //dval("print('gplusb l.done '+o)"),
    val("t.i.z8.push(t);t.nd=false"),
    //cond(val("(t.s==o)"),[[ // child is a zero-length assertion
    //  gotol(this.done)
    //]]),
    cond(val("(t.i.ret[o])"),[[
      //dval("print('gplusb 4already tried '+o)"),
      a,
      gotol(this.bt)
    ]]),
    a,
    gotol(retry), // try another one
    
    casel(this.l.notd), // left succeeded
    //dval("print('gplusb l.notd '+o)"),
    val("t.i.z8.push(t);t.nd=true"),
    cond(val("(t.i.ret[o])"),[[
      dval("print('gplusb already tried '+o)"),
      a,
      gotol(this.bt)
    ]]),
    a,
    gotol(retry), // try another one
    
    casel(this.l.fail), // left hit its base case
    //dval("print('gplusb l.fail '+o)"),
    cond(val("(t.z8.length==0)"),[[
      a,
      gotol(this.fail)
    ]]),
    
    cond(val("(t.z8.length==1&&t.z8[0].nd==false)"),[[
      //dval("print('gplusb done '+o)"),
      gotol(this.done)
    ]]),
    //cond(val("(t.ret[o])"),[[
    //  dval("print('2already tried '+o)"),
    //  gotol(this.bt)
    //]]),
    val("t.ret[o]=true"),
    //dval("print('gplusb notd '+o)"),
    gotol(this.notd),
    
    casel(this.bt),
    //dval("print('gplusb bt '+o)"),
    val("u=t.z8.pop()"),
    //val("print('popped: '+(typeof u))"),
    cond(val("(u.nd)"),[[
      val("o=u.s"),
      cond(val("(t.ret[o])"),[[
        //dval("print('gplusb 3already tried '+o)"),
        gotol(this.bt)
      ]]),
      val("t=u"),
      //dval("print('gplusb l.bt '+o)"),
      gotol(this.l.bt)
    ]]),
    cond(val("(t.z8.length==0)"),[[
      a,
      gotol(this.fail)
    ]]),
    val("o=u.s"),
    cond(val("(t.z8.length==1&&t.z8[0].nd==false)"),[[
      //dval("print('gplusb done '+o)"),
      gotol(this.done)
    ]]),
    cond(val("(t.ret[o])"),[[
      //dval("print('gplusb 3already tried '+o)"),
      //val("t.z8.push(u)"),
      gotol(this.bt)
    ]]),
    val("t.ret[o]=true"),
    //dval("print('gplusb notd '+o)"),
    gotol(this.notd)
  );
};

function plus(l) {
  return l.b
    ? new gplusb(l) // nondeterministic version of plus
    : new gplus(l); // deterministic version of plus
}


function utf32str_charAt(offset) {
  return String.fromCharCode(this[offset]);
}

function utf32str_substr(offset, length) {
  if (dbg)
    print('checking offset at '+offset);
  return offset <= 0
    ? offset + length >= this.l
      ? this.str.substring(0)
      : this.str.substring(0, this.breaks[offset + length - 1] + 1)
    : offset + length >= this.l
      ? this.str.substring(this.breaks[offset - 1] + 1)
      : this.str.substring(this.breaks[offset - 1] + 1, this.breaks[offset + length - 1] + 1);
}

function utf32str(str) {
  var arr = [], i = 0, breaks = [];
  for(var j=0,l=str.length; j<l; ++j) {
    arr[i] = str.codepoint(j);
    breaks[i++] = wasSurrogatePair ? ++j : j;
  }
  arr.l = i; // stash length statically since .length is usually an accessor
  arr.str = str; // original string (encoded in UTF-16, of course)
  arr.strl = l; // length of original UTF-16 string
  arr.breaks = breaks; // offsets of the final position of the char at each offset
  arr.hasSurrogatePair = l > i; // whether 
  arr.constructor = utf32str; // fake having called "new utf32str()"
  arr.charAt = utf32str_charAt;
  arr.substr = utf32str_substr;
  return arr; // array of ints representing the string's unicode codepoints
}

var dbg = 0;
 
var iter = 400;
var routine = dbg
  ? func(["i"],[val("var gl=0,o=0,t={},c;last:for(;;){print('op: '+gl);next:switch(gl){case 0:")])
  : func(["i"],[val("var gl=0,o=0,t={},c;last:for(;;){next:switch(gl){case 0:")]); // empty parser routine

var grammar;// = both(lit("hi"),end()); // a grammar expression definition
//grammar = either(either(either(lit("hi"),lit("ha")),lit("hi")),lit("ho"));
//grammar = both(either(lit("h"),lit("ha")),end());
//grammar = either(lit("hi"),lit("ho"));
//grammar = both(both(lit("h"),either(lit("a"),lit("aa"))),lit("r"));
//grammar = both(either(lit("h"),either(lit("a"),lit("aa"))),either(lit("f"),lit("aar")));
//grammar = either(either(lit("a"),either(lit("b"),lit("c"))),either(lit("f"),lit("haar")));
//grammar = plus(lit("a"));
//grammar = both(plus(lit("a")),lit("aa"));
//grammar = both(both(plus(either(lit("aa"),lit("a"))),lit('aaa')),end());
//grammar = both(both(plus(either(lit("aa"),lit("a"))),lit(Array(iter).join('a'))),end());
grammar = both(plus(either(plus(lit("a")),plus(lit("a")))),lit(Array(iter).join('a')));
//grammar = both(both(plus(plus(plus(plus(lit("a"))))),lit(Array(iter).join('a'))),end());

grammar.fail = {id:1};
grammar.done = grammar.notd = {id:-1};

grammar.emit(routine); // have the grammar emit its specialize parser code to this routine

routine.r.push(val("case -1:/*print('parse succeeded');*/break last;case 1:default:print('parse failed');break last}}")); // finalize the routine
/*
var input = utf32str("\uD80C\uDF14z\uD80C\uDF16");
print(input.str);
print(input.substr(0,1));
print(input.substr(1,1));
print(input.substr(2,1));
print("\uD80C\uDF14z\uD80C\uDF16");
print("\uD80C\uDF14");
print("z");
print("\uD80C\uDF16");
*/

var parserf = routine.emit();

if (dbg)
  print(parserf);

var parser = eval(parserf); // compile the javascript function to machine code

if (dbg)
  print('compiled');

var input = utf32str(Array(iter+1).join('a'));
//var input = utf32str('aaaa');

parser(input);

//for(var ee=100000;--ee>0;parser(input));



















