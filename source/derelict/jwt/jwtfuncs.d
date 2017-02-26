module derelict.jwt.jwtfuncs;

import core.stdc.stdio;

import derelict.jwt.jwttypes;
import derelict.util.system;

extern(C) @nogc nothrow {
    alias da_jwt_new             = int function(jwt_t **jwt);
    alias da_jwt_decode          = int function(jwt_t **jwt, const(char) *token, const(char) *key, int key_len);
    alias da_jwt_free            = void function(jwt_t *jwt);
    alias da_jwt_dup             = jwt_t* function(jwt_t *jwt);
    alias da_jwt_get_grant       = const(char)* function(jwt_t *jwt, const(char) *grant);
    alias da_jwt_get_grant_int   = long function(jwt_t *jwt, const(char) *grant);
    alias da_jwt_get_grants_json = char* function(jwt_t *jwt, const(char) *grant);
    alias da_jwt_add_grant       = int function(jwt_t *jwt, const(char) *grant, const(char) *val);
    alias da_jwt_add_grant_int   = int function(jwt_t *jwt, const(char) *grant, long val);
    alias da_jwt_add_grants_json = int function(jwt_t *jwt, const(char) *json);
    alias da_jwt_del_grants      = int function(jwt_t *jwt, const(char) *grant);
    alias da_jwt_del_grant       = int function(jwt_t *jwt, const(char) *grant);
    alias da_jwt_dump_fp         = int function(jwt_t *jwt, FILE *fp, int pretty);
    alias da_jwt_dump_str        = char* function(jwt_t *jwt, FILE *fp);
    alias da_jwt_encode_fp       = char* function(jwt_t *jwt, FILE *fp);
    alias da_jwt_enocde_str      = char* function(jwt_t *jwt);
    alias da_jwt_set_alg         = int function(jwt_t *jwt, jwt_alg_t alg, const(char) *key, int len);
    alias da_jwt_get_alg         = jwt_alg_t function(jwt_t *jwt);
}

__gshared {
    da_jwt_new jwt_new;
    da_jwt_decode jwt_decode;
    da_jwt_free jwt_free;
    da_jwt_dup jwt_dup;
    da_jwt_get_grant jwt_get_grant;
    da_jwt_get_grant_int jwt_get_grant_int;
    da_jwt_get_grants_json jwt_get_grants_json;
    da_jwt_add_grant jwt_add_grant;
    da_jwt_add_grants_json jwt_add_grants_json;
    da_jwt_del_grants jwt_del_grants;
    deprecated("jwt_del_grant is deprecated in libjwt.") {
        da_jwt_del_grant jwt_del_grant;
    }
    da_jwt_dump_fp jwt_dump_fp;
    da_jwt_dump_str jwt_dump_str;
    da_jwt_encode_fp jwt_encode_fp;
    da_jwt_enocde_str jwt_encode_str;
    da_jwt_set_alg jwt_set_alg;
    da_jwt_get_alg jwt_get_alg;
}