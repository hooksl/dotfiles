return {
	"mg979/vim-visual-multi",
	init = function()
		vim.g.VM_maps = {
			["Add Cursor Down"] = "<C-v>",
			["Add Cursor Up"] = "",
		}
	end,
}

-- Full mappings list
-- Mappings with \\ are meant prefixed by the VM_leader. These permanent mappings are enabled by default:
-- select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
-- create cursors vertically with Ctrl-Down/Ctrl-Up
-- select one character at a time with Shift-Arrows
-- press n/N to get next/previous occurrence
-- press [/] to select next/previous cursor
-- press q to skip current and get next occurrence
-- press Q to remove current cursor/selection
-- start insert mode with i,a,I,A

-- let g:VM_maps['Find Under']                  = '<C-n>'
-- let g:VM_maps['Find Subword Under']          = '<C-n>'
-- let g:VM_maps["Select All"]                  = '\\A'
-- let g:VM_maps["Start Regex Search"]          = '\\/'
-- let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
-- let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
-- let g:VM_maps["Add Cursor At Pos"]           = '\\\'
--
-- let g:VM_maps["Visual Regex"]                = '\\/'
-- let g:VM_maps["Visual All"]                  = '\\A'
-- let g:VM_maps["Visual Add"]                  = '\\a'
-- let g:VM_maps["Visual Find"]                 = '\\f'
-- let g:VM_maps["Visual Cursors"]              = '\\c'
