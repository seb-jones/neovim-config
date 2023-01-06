return {
	s("cl", { t("console.log("), i(1), t(")") }),

	s("ce", { t("console.error("), i(1), t(")") }),

    s("if", {
        t("if ("), i(1), t(") {"),
        t({ "", "    " }), i(2),
        t({ "", "}" }),
    }),
}
