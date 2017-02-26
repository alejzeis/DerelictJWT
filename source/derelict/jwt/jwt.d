module derelict.jwt.jwt;

public {
    import derelict.jwt.jwttypes;
    import derelict.jwt.jwtfuncs;
}

private {
    import derelict.util.loader;
    import derelict.util.system;

    static if(Derelict_OS_Windows)
        enum libNames = "libjwt.dll";
    else static if(Derelict_OS_Linux)
        enum libNames = "libjwt.so";
    else static if(Derelict_OS_Mac)
        enum libNames = "libjwt.dylib";
    else
        static assert(0, "Need to implement libjwt libNames for this operating system.");
}

class DerelictJWTLoader : SharedLibLoader {
    public this() {
        super(libNames);
    }

    protected {
        override void loadSymbols() {
            bindFunc(cast(void**)&jwt_new, "jwt_new");
            bindFunc(cast(void**)&jwt_decode, "jwt_decode");
            bindFunc(cast(void**) &jwt_free, "jwt_free");
            bindFunc(cast(void**) &jwt_dup, "jwt_dup");
            bindFunc(cast(void**) &jwt_get_grant, "jwt_get_grant");
            bindFunc(cast(void**) &jwt_get_grant_int, "jwt_get_grant_int");
            bindFunc(cast(void**) &jwt_get_grants_json, "jwt_get_grants_json");
            bindFunc(cast(void**) &jwt_add_grant, "jwt_add_grant");
            bindFunc(cast(void**) &jwt_add_grants_json, "jwt_add_grants_json");
            bindFunc(cast(void**) &jwt_del_grants, "jwt_del_grants");
            version(DerelictJWT_Load_Deprecated) {
                bindFunc(cast(void**) &jwt_del_grant, "jwt_del_grant");
            }
            bindFunc(cast(void**) &jwt_dump_fp, "jwt_dump_fp");
            bindFunc(cast(void**) &jwt_dump_str, "jwt_dump_str");
            bindFunc(cast(void**) &jwt_encode_fp, "jwt_encode_fp");
            bindFunc(cast(void**) &jwt_encode_str, "jwt_encode_str");
            bindFunc(cast(void**) &jwt_set_alg, "jwt_set_alg");
            bindFunc(cast(void**) &jwt_get_alg, "jwt_get_alg");
        }
    }
}

__gshared DerelictJWTLoader DerelictJWT;

shared static this() {
    DerelictJWT = new DerelictJWTLoader();
}