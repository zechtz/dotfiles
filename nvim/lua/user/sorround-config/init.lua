---------------------------------------------------------------"
-- Use v or # to get a variable interpolation (inside of a string)}
--  ysiw# Wrap the token under the cursor in #{} in Ruby
-- v...s# Wrap the selection in #{}
-----------------------------------------------------------------"
vim.g.surround_113 = "#{\r}"
vim.g.surround_35 = "#{\r}"

-----------------------------------------------------------------"
-- Select text in an ERb file with visual mode and then press s- or s=
-----------------------------------------------------------------"
-- Or yss- to do entire line.
vim.g.surround_45 = "<% \r %>"
vim.g.surround_61 = "<%= \r %>"
