local toggleterm = pcall(require, 'toggleterm')


print("Toggle term test")
toggleterm.setup({
	size = 40,
	open_mapping = [[<C-j]],
	persist_size = true,
	inster_mappings = true,
	direction = "float"
})
