" Telescope ----------------------------------------

"" DUNNO
" :lua require('telescope').load_extension('fzf')

lua << EOF
require('telescope').setup({
  defaults = {
    layout_config = {
      width = 0.85,
      height = 0.90,
      preview_cutoff = 0.5,
      vertical = {
        preview_height = 0.60,
        prompt_position = "bottom",
      },
      horizontal = {
        preview_width = 0.5,
        prompt_position = "bottom",
      }
    },
  }
})
EOF


"" REMAPS
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

