#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <smop/base.h>
#include <smop/capture.h>
#include <smop/nagc.h>
#include <smop/s0native.h>

static SMOP__Object* SMOP__ID__new;
static SMOP__Object* SMOP__ID__goto;
static SMOP__Object* SMOP__ID__setr;
static SMOP__Object* SMOP__ID__continuation;
static SMOP__Object* SMOP__ID__eval;
static SMOP__Object* SMOP__ID__loop;

static SMOP__NAGC__ResponderInterface* RI;

typedef struct interpreter_struct {
  SMOP__NAGC__Object__BASE
  SMOP__Object* continuation;
} interpreter_struct;


/*
 * This is the deault interpreter instance. It's important to realise
 * that this is pluggable, but there's no much thing to be different
 * right here. As this object is already delegates much of its
 * features to the "current continuation" object.
 */



static void DESTROYALL(SMOP__Object* interpreter,
                              SMOP__Object* value) {
    smop_nagc_wrlock((SMOP__NAGC__Object*)value);
    SMOP__Object* cont = ((interpreter_struct*)value)->continuation;
    smop_nagc_unlock((SMOP__NAGC__Object*)value);
    if (cont) SMOP_RELEASE(interpreter,cont);
}

static SMOP__Object* interpreter_message(SMOP__Object* interpreter,
                                     SMOP__ResponderInterface* self,
                                     SMOP__Object* identifier,
                                     SMOP__Object* capture) {

  printf("at interpreter message\n");
  SMOP__Object* ret = SMOP__NATIVE__bool_false;
  SMOP__Object* invocant = SMOP__NATIVE__capture_positional(interpreter,capture,0);
  printf("invocant = %s\n",invocant->RI->id);

  if (identifier == SMOP__ID__new) {
    abort();
  } else if (identifier == SMOP__ID__goto) {
    /* goto $interpreter: $target;
     * 
     * This set the continuation of the invocant interpreter to the
     * given target. If there is a current target, it will be
     * released.
     */
    SMOP__Object* continuation = SMOP__NATIVE__capture_positional(interpreter,capture,1);
    printf("cont = %s\n",continuation->RI->id);
    if (continuation == SMOP__NATIVE__bool_false) {
      continuation = NULL;
    }

    smop_nagc_wrlock((SMOP__NAGC__Object*)invocant);
    SMOP__Object* cont = ((interpreter_struct*)invocant)->continuation;
    ((interpreter_struct*)invocant)->continuation = continuation;
    smop_nagc_unlock((SMOP__NAGC__Object*)invocant);
    
    if (cont) SMOP_RELEASE(interpreter,cont);

    printf("after goto\n");

  } else if (identifier == SMOP__ID__continuation) {
    /* continuation $interpreter: ;
     *
     * returns the current continuation (if there is one).
     */
    smop_nagc_rdlock((SMOP__NAGC__Object*)invocant);
    SMOP__Object* cont = ((interpreter_struct*)invocant)->continuation;
    smop_nagc_unlock((SMOP__NAGC__Object*)invocant);

    if (cont)
      ret = SMOP_REFERENCE(interpreter,cont);


  } else if (identifier == SMOP__ID__loop) {
    /* loop $interpreter: ;
     *
     * Goes through the continuation while has_next.
     */

    smop_nagc_rdlock((SMOP__NAGC__Object*)invocant);
    SMOP__Object* cont = ((interpreter_struct*)invocant)->continuation;
    smop_nagc_unlock((SMOP__NAGC__Object*)invocant);

    while (cont && SMOP_DISPATCH(invocant, SMOP_RI(cont), SMOP__ID__eval,SMOP__NATIVE__capture_create(invocant,(SMOP__Object*[]) {invocant, SMOP_REFERENCE(invocant,cont), NULL}, (SMOP__Object*[]) {NULL})) == SMOP__NATIVE__bool_true) {
      smop_nagc_rdlock((SMOP__NAGC__Object*)invocant);
      SMOP__Object* cont = ((interpreter_struct*)invocant)->continuation;
      smop_nagc_unlock((SMOP__NAGC__Object*)invocant);
    }
  } else {
    printf("unknown method identifier\n");
  }
  printf("relesasing capture\n");
  SMOP_RELEASE(interpreter, capture);
  printf("after message\n");
}


SMOP__Object* SMOP_interpreter_create(SMOP__Object* interpreter) {
  interpreter_struct* ret = (interpreter_struct*) smop_nagc_alloc(sizeof(interpreter_struct));
  ret->continuation = NULL;
  ret->RI = RI;
  return (SMOP__Object*) ret;
}

void smop_interpreter_init() {
  printf("interpreter init\n");

  RI = malloc(sizeof(SMOP__NAGC__ResponderInterface));
  RI->MESSAGE = interpreter_message;
  RI->REFERENCE = smop_nagc_reference;
  RI->RELEASE = smop_nagc_release;
  RI->WEAKREF = smop_nagc_weakref;
  RI->id = "Interpreter";
  RI->DESTROYALL = DESTROYALL;

  SMOP__ID__new = SMOP__NATIVE__idconst_createn("new",3);
  SMOP__ID__goto = SMOP__NATIVE__idconst_createn("goto",4);
  SMOP__ID__setr = SMOP__NATIVE__idconst_createn("setr",4);
  SMOP__ID__continuation = SMOP__NATIVE__idconst_createn("continuation",12);
  SMOP__ID__eval = SMOP__NATIVE__idconst_createn("eval",4);
  SMOP__ID__loop = SMOP__NATIVE__idconst_createn("loop",4);

}

void smop_interpreter_destr() {
  free(RI);
}
