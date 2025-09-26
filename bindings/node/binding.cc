#include <napi.h>

typedef struct TSLanguage TSLanguage;

extern "C" TSLanguage *tree_sitter_bemcss();

// "tree-sitter", "language" hashed with BLAKE2
const napi_type_tag LANGUAGE_TYPE_TAG = {
  0x8AF2E5212AD58ABF, 0xD5006CAD83ABBA16
};

Napi::Object Init(Napi::Env env, Napi::Object exports) {
    auto bemcss = Napi::Object::New(env);
    bemcss["name"] = Napi::String::New(env, "bemcss");
    auto bemcss_language = Napi::External<TSLanguage>::New(env, tree_sitter_bemcss());
    bemcss_language.TypeTag(&LANGUAGE_TYPE_TAG);
    bemcss["language"] = bemcss_language;

    exports["bemcss"] = bemcss;
    return exports;
}

NODE_API_MODULE(tree_sitter_bemcss_binding, Init)
