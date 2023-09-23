local status_ok, flit = pcall(require, "flit")
if not status_ok then
	return
end

flit.setup({
	keys = { f = "f", F = "F", t = "t", T = "T" },
	labeled_modes = "nvo", -- A string like "nv", "nvo", "o", etc.
	multiline = false,
	-- Like `leap`s similar argument (call-specific overrides).
	-- E.g.: opts = { equivalence_classes = {} }
	opts = {},
})
