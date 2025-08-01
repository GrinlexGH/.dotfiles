# Safely add to PATH
add_to_path() {
    local new
    for new in "$@"; do
        if [[ -d $new ]]; then
            if (( ${+path[(r)$new]} == 0 )); then
                path=($new $path)
            fi
        fi
    done
}

# Set PATH so it includes user's private bin if it exists
add_to_path "$HOME/bin" "$HOME/.local/bin"

# Local env
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# Rust cargo
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Spicetify
if [[ -d "$HOME/.spicetify" ]]; then
    export SPICETIFY_INSTALL="$HOME/.spicetify"
    add_to_path "$SPICETIFY_INSTALL"
fi

# Java LSP
if [[ -x "$HOME/.jdtls/bin/jdtls" ]]; then
    export JDTLS="$HOME/.jdtls"
    add_to_path "$JDTLS/bin"
fi

# Kotlin LSP
if [[ -x "$HOME/.kotlin-lsp/kotlin-lsp.sh" ]]; then
    export KOTLIN_LSP_DIR="$HOME/.kotlin-lsp"
    [[ ! -L "$KOTLIN_LSP_DIR/kotlin-lsp" ]] && ln -s "$KOTLIN_LSP_DIR/kotlin-lsp.sh" "$HOME/.local/bin/kotlin-lsp"
fi

# Android SDK
if [[ -d "$HOME/Android/Sdk" ]]; then
    export ANDROID_HOME="$HOME/Android/Sdk"
    add_to_path \
        "$ANDROID_HOME/platform-tools" \
        "$ANDROID_HOME/cmdline-tools/latest"\
        "$ANDROID_HOME/cmdline-tools/latest/bin"
fi

# Vulkan SDK
if [[ -z $VULKAN_SDK && -d $HOME/VulkanSDK ]]; then
    setopt localoptions NULL_GLOB

    # Chooses latest SDK
    local -a _sdks
    _sdks=($HOME/VulkanSDK/<->.<->.<->.<->(N/))

    if (( ${#_sdks} > 0 )); then
        _sdks=(${(on)_sdks})
        export VULKAN_SDK=${_sdks[-1]}
        [[ -f $VULKAN_SDK/setup-env.sh ]] && source $VULKAN_SDK/setup-env.sh
    fi

    unsetopt localoptions NULL_GLOB
fi

