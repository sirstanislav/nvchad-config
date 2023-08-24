local cmp_conf = require "plugins.configs.cmp"
table.insert(cmp_conf.sources, {
  name = "html-css",
  option = {
    max_count = {},
    enable_on = {
      "html",
      "javascript.jsx",
      "typescript.tsx",
    },
    file_extensions = { "css", "sass", "less" },
    style_sheets = {
      "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
      "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
    },
  },
})

return cmp_conf
