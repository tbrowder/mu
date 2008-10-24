#include <stdlib.h>
#include <stdio.h>
#include <smop.h>
#include <string.h>
#include <smop_lowlevel.h>
#include <smop_s1p.h>

SMOP__Object* SMOP__S1P__Hash;

typedef struct hash_bucket {
    struct hash_bucket* next;
    SMOP__Object* key;
    SMOP__Object* cell;
} hash_bucket;
typedef struct smop_s1p_hash_struct {
  SMOP__Object__BASE
  int size;
  hash_bucket** buckets;
} smop_s1p_hash_struct;

SMOP__Object* SMOP__S1P__Hash_create(void) {
    smop_s1p_hash_struct* ret = (smop_s1p_hash_struct*) smop_lowlevel_alloc(sizeof(smop_s1p_hash_struct));
    ret->RI = (SMOP__ResponderInterface*)SMOP__S1P__Hash;
    ret->buckets = (hash_bucket**) calloc(1,sizeof(hash_bucket*));
    ret->size = 1;
    return (SMOP__Object*) ret;
}
static SMOP__Object* smop_s1p_hash_message(SMOP__Object* interpreter,
                                     SMOP__ResponderInterface* self,
                                     SMOP__Object* identifier,
                                     SMOP__Object* capture) {
  ___NATIVE_CAPTURE_ONLY___;
  ___CONST_IDENTIFIER_ONLY___;

  smop_s1p_hash_struct* invocant = (smop_s1p_hash_struct*)(SMOP__NATIVE__capture_invocant(interpreter, capture));
  SMOP__Object* ret = SMOP__NATIVE__bool_false;

  if (identifier == SMOP__ID__postcircumfix_curly) {
    if (SMOP__NATIVE__capture_positional_count(interpreter,capture) == 1) {
      SMOP__Object* key = SMOP__NATIVE__capture_positional(interpreter,capture,0);
      ret = SMOP__S1P__Hash_BValue_create(interpreter,SMOP_REFERENCE(interpreter,(SMOP__Object*)invocant),SMOP_REFERENCE(interpreter,key));
    } else {
      fprintf(stderr,"wrong number of arguments to postcircumfix:<{ }>\n");
    }

  } else if (identifier == SMOP__ID__bind_key) {
    if (SMOP__NATIVE__capture_positional_count(interpreter,capture) == 2) {
      SMOP__Object* key = SMOP__NATIVE__capture_positional(interpreter,capture,0);
      SMOP__Object* val = SMOP__NATIVE__capture_positional(interpreter,capture,1);

      int hashing_result = 0;
      if (SMOP_RI(key) == (SMOP__ResponderInterface*)SMOP__S1P__Str) {
        SMOP__Object* dest = key;
        key = SMOP__NATIVE__idconst_create(SMOP__S1P__Str_c_str(key));
        SMOP_RELEASE(interpreter,dest);
      }
      hash_bucket* bucket = invocant->buckets[hashing_result];
      //fprintf(stderr,"bucket %p\n",bucket);
      if (bucket) while (1) {
        if (bucket->key == key) {
          //fprintf(stderr,"found new cell\n");
          SMOP_RELEASE(interpreter,invocant);
          SMOP_RELEASE(interpreter,capture);
          SMOP_RELEASE(interpreter,bucket->cell);
          bucket->cell = val;
          return SMOP__NATIVE__bool_true;
        } else if (bucket->next) {
          bucket = bucket->next;
        } else {
          break;
        }
      }

      //fprintf(stderr,"creating new cell\n");
      hash_bucket* new_bucket = (hash_bucket*) calloc(1,sizeof(hash_bucket));
      new_bucket->key  = key;
      new_bucket->cell = val;
      new_bucket->next = NULL;
      if (bucket) bucket->next = new_bucket;
      else invocant->buckets[hashing_result] = new_bucket;
      ret = SMOP__NATIVE__bool_true;

    } else {
      fprintf(stderr,"wrong number of arguments to bind_key\n");
    }

  } else if (identifier == SMOP__ID__lookup_key) {
    if (SMOP__NATIVE__capture_positional_count(interpreter,capture) == 1) {
      SMOP__Object* key = SMOP__NATIVE__capture_positional(interpreter,capture,0);
      int hashing_result = 0;
      if (SMOP_RI(key) == (SMOP__ResponderInterface*)SMOP__S1P__Str) {
        SMOP__Object* dest = key;
        key = SMOP__NATIVE__idconst_create(SMOP__S1P__Str_c_str(key));
        SMOP_RELEASE(interpreter,dest);
      }
      hash_bucket* bucket = invocant->buckets[hashing_result];
      //fprintf(stderr,"bucket %p\n",bucket);
      if (bucket) while (1) {
        if (bucket->key == key) {
          //fprintf(stderr,"found new cell\n");
          SMOP_RELEASE(interpreter,invocant);
          SMOP_RELEASE(interpreter,capture);
          return SMOP_REFERENCE(interpreter,bucket->cell);
        } else if (bucket->next) {
          bucket = bucket->next;
        } else {
          break;
        }
      }

      //fprintf(stderr,"creating new cell\n");
      SMOP__Object* cell = SMOP__S1P__Scalar_create(SMOP__NATIVE__bool_false);
      hash_bucket* new_bucket = (hash_bucket*) calloc(1,sizeof(hash_bucket));
      new_bucket->key  = key;
      new_bucket->cell = cell;
      new_bucket->next = NULL;
      ret = SMOP_REFERENCE(interpreter,new_bucket->cell);
      if (bucket) bucket->next = new_bucket;
      else invocant->buckets[hashing_result] = new_bucket;
    } else {
      fprintf(stderr,"wrong number of arguments to lookup_key\n");
    }

  } else if (identifier == SMOP__ID__exists) {
    if (SMOP__NATIVE__capture_positional_count(interpreter,capture) == 1) {
      SMOP__Object* key = SMOP__NATIVE__capture_positional(interpreter,capture,0);
      int hashing_result = 0;
      if (SMOP_RI(key) == (SMOP__ResponderInterface*)SMOP__S1P__Str) {
        SMOP__Object* dest = key;
        key = SMOP__NATIVE__idconst_create(SMOP__S1P__Str_c_str(key));
        SMOP_RELEASE(interpreter,dest);
      }
      hash_bucket* bucket = invocant->buckets[hashing_result];
      //fprintf(stderr,"bucket %p\n",bucket);
      if (bucket) while (1) {
        if (bucket->key == key) {
          //fprintf(stderr,"found new cell\n");
          SMOP_RELEASE(interpreter,invocant);
          SMOP_RELEASE(interpreter,capture);
          return SMOP__NATIVE__bool_true;
        } else if (bucket->next) {
          bucket = bucket->next;
        } else {
          break;
        }
      }

      ret = SMOP__NATIVE__bool_false;
    } else {
      fprintf(stderr,"wrong number of arguments to exists\n");
    }

  } else if (identifier == SMOP__ID__new) {
    ret = SMOP__S1P__Hash_create();
  } else if (identifier == SMOP__ID__DESTROYALL) {
      int i;
      for (i=0;i<invocant->size;i++) {
          hash_bucket* current = invocant->buckets[i];
          while (current) {
              SMOP_RELEASE(interpreter,current->key);
              SMOP_RELEASE(interpreter,current->cell);
              hash_bucket* prev = current;
              current = current->next;
              free(prev);
          }
      }
      free(invocant->buckets);
  } else if (identifier == SMOP__ID__FETCH) {
    ___VALUE_FETCH___;
  } else if (identifier == SMOP__ID__STORE) {
    ___VALUE_STORE___;
  } else {
      ___UNKNOWN_METHOD___
  }

  if (invocant) SMOP_RELEASE(interpreter,invocant);
  SMOP_RELEASE(interpreter,capture);
  return ret;
}


void smop_s1p_hash_init() {
  SMOP__S1P__Hash = calloc(1,sizeof(SMOP__ResponderInterface));
  ((SMOP__ResponderInterface*)SMOP__S1P__Hash)->MESSAGE = smop_s1p_hash_message;
  ((SMOP__ResponderInterface*)SMOP__S1P__Hash)->REFERENCE = smop_lowlevel_generic_reference;
  ((SMOP__ResponderInterface*)SMOP__S1P__Hash)->RELEASE = smop_lowlevel_generic_release;
  ((SMOP__ResponderInterface*)SMOP__S1P__Hash)->id = "s1p Hash";
}

void smop_s1p_hash_destr() {
  free(SMOP__S1P__Hash);
}


