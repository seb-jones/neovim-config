return {
	s("cl", fmt("console.log({})", { i(1) })),

	s("ce", fmt("console.error({})", { i(1) })),

    s("if", fmt([[
        if ({}) {{
            {}
        }}
    ]], { i(1), i(2) })),

    s("ife", fmt([[
        if ({}) {{
            {}
        }} else {{
            {}
        }}
    ]], { i(1), i(2), i(3) })),
}
