-- 折叠双引号：class="xxxxxxxxx",-->class="..."
return {
    'razak17/tailwind-fold.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = {
        'html',
        'svelte',
        'astro',
        'vue',
        'typescriptreact',
        'php',
        'blade',
    },
}
