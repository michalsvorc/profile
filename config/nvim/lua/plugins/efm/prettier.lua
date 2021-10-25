-- https://github.com/prettier/prettier

return {
  formatCommand = "yarn prettier --stdin-filepath ${INPUT}",
  formatStdin = true
}
