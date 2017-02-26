module derelict.jwt.jwttypes;

// JANSSON TYPES:

alias size_t json_type;

enum {
    JSON_OBJECT,
    JSON_ARRAY,
    JSON_STRING,
    JSON_INTEGER,
    JSON_REAL,
    JSON_TRUE,
    JSON_FALSE,
    JSON_NULL
}

struct json_t {
    json_type type;
    size_t refcount;
}

// LIBJWT TYPES:

alias size_t jwt_alg_t;

enum {
    JWT_ALG_NONE = 0,
    JWT_ALG_HS256,
	JWT_ALG_HS384,
	JWT_ALG_HS512,
	JWT_ALG_RS256,
	JWT_ALG_RS384,
	JWT_ALG_RS512,
	JWT_ALG_ES256,
	JWT_ALG_ES384,
	JWT_ALG_ES512,
    JWT_ALG_TERM
}

alias jwt jwt_t;

struct jwt {
    jwt_alg_t alg;
    char *key;
    int key_len;
    json_t *grants;
}