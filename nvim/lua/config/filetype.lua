vim.filetype.add({
    pattern = {
        [".*/tasks/.*.yaml"]        = "yaml.ansible",
        [".*/group_vars/.*.yaml"]   = "yaml.ansible",
        [".*/handlers/.*.yaml"]     = "yaml.ansible",
        [".*/ansible/.*.yaml"]      = "yaml.ansible",
        [".*.yaml.j2"]              = "yaml",
        [".*.trace.*"]              = "strace",
        [".*.trace"]                = "strace"
    }
})
