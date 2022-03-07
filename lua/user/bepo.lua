local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- {W} -> [É]
-- On remappe W sur É :
keymap('', 'é', 'w', opts)
keymap('', 'É', 'W', opts)
-- Corollaire, pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
-- (attention, cela diminue la réactivité du {A}…)
keymap('', 'aé', 'aw', opts)
keymap('', 'aÉ', 'aW', opts)

-- [HJKL] -> {CTSR}
-- {cr} = « gauche / droite »
keymap('', 'c', 'h', opts)
keymap('', 'r', 'l', opts)
-- {ts} = « haut / bas »
keymap('', 't', 'j', opts)
keymap('', 's', 'k', opts)
-- {CR} = « haut / bas de l'écran »
keymap('', 'C', 'H', opts)
keymap('', 'R', 'L', opts)
-- {TS} = « joindre / aide »
keymap('', 'T', 'J', opts)
keymap('', 'S', 'K', opts)
-- Corollaire : repli suivant / précédent
-- keymap('', 'zs', 'zj', opts)
-- keymap('', 'zt', 'zk', opts)

-- {HJKL} <- [CTSR]
-- {J} = « Jusqu'à »            (j = suivant, J = précédant)
keymap('', 'j', 't', opts)
keymap('', 'J', 'T', opts)
-- {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
keymap('', 'l', 'c', opts)
keymap('', 'L', 'C', opts)
-- {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
keymap('', 'h', 'r', opts)
keymap('', 'H', 'R', opts)
-- {K} = « Substitue »          (k = caractère, K = ligne)
keymap('', 'k', 's', opts)
keymap('', 'K', 'S', opts)
-- Corollaire : correction orthographique
-- keymap('', ']k', ']s', opts)
-- keymap('', '[k', '[s', opts)

-- Désambiguation de {g}
-- ligne écran précédente / suivante (à l'intérieur d'une phrase)
keymap('n', 'gs', 'gk', opts)
keymap('n', 'gt', 'gj', opts)
-- onglet précédant / suivant
keymap('n', 'gb', 'gT', opts)
keymap('n', 'gé', 'gt', opts)
-- optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
-- keymap('n', 'gB', ':exe 'silent! tabfirst'<CR>', opts)
-- keymap('n', 'gÉ', ':exe 'silent! tablast'<CR>', opts)
-- optionnel : {g'} pour aller au début de la ligne écran
-- keymap('n', 'g"', 'g0', opts)

-- <> en direct
-- keymap('n', '«', '<', opts)
-- keymap('n', '»', '>', opts)

-- Remaper la gestion des fenêtres
-- keymap('n', 'et', '<C-w>j', opts)
-- keymap('n', 'es', '<C-w>k', opts)
-- keymap('n', 'ec', '<C-w>h', opts)
-- keymap('n', 'er', '<C-w>l', opts)
-- keymap('n', 'ed', '<C-w>c', opts)
-- keymap('n', 'eo', '<C-w>s', opts)
-- keymap('n', 'ep', '<C-w>o', opts)
-- keymap('n', 'e<SPACE>', ':split<CR>', opts)
-- keymap('n', 'e<CR>', ':vsplit<CR>', opts)

-- Chiffres en accès direct
-- ————————————————————————
-- keymap('n', '' 1', opts)
-- keymap('n', '1', ''', opts)
-- keymap('n', '«', '2', opts)
-- keymap('n', '2', '<', opts)
-- keymap('n', '»', '3', opts)
-- keymap('n', '3', '>', opts)
-- keymap('n', '(', '4', opts)
-- keymap('n', '4', '(', opts)
-- keymap('n', ')', '5', opts)
-- keymap('n', '5', ')', opts)
-- keymap('n', '@', '6', opts)
-- keymap('n', '6', '@', opts)
-- keymap('n', '+', '7', opts)
-- keymap('n', '7', '+', opts)
-- keymap('n', '-', '8', opts)
-- keymap('n', '8', '-', opts)
-- keymap('n', '/', '9', opts)
-- keymap('n', '9', '/', opts)
-- keymap('n', '*', '0', opts)
-- keymap('n', '0', '*', opts)
