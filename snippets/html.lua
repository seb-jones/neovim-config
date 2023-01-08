doubleTagMultiLine = {
    "address",
    "article",
    "aside",
    "blockquote",
    "body",
    "canvas",
    "dd",
    "div",
    "dl",
    "dt",
    "fieldset",
    "figcaption",
    "figure",
    "footer",
    "form",
    "h1",
    "h2",
    "h3",
    "h4",
    "h5",
    "h6",
    "head",
    "header",
    "li",
    "main",
    "nav",
    "noscript",
    "ol",
    "p",
    "pre",
    "script",
    "section",
    "style",
    "table",
    "tbody",
    "tfoot",
    "thead",
    "tr",
    "ul",
    "video",
}

doubleTagInline = {
    "a",
    "abbr",
    "b",
    "bdo",
    "button",
    "cite",
    "code",
    "dfn",
    "em",
    "i",
    "kbd",
    "label",
    "map",
    "object",
    "output",
    "q",
    "samp",
    "script",
    "select",
    "small",
    "span",
    "strong",
    "sub",
    "sup",
    "textarea",
    "td",
    "th",
    "time",
    "var",
}

singleTag = {
    "area",
    "base",
    "br",
    "col",
    "embed",
    "hr",
    "img",
    "input",
    "link",
    "meta",
    "source",
    "track",
    "wbr",
}

snippets = {}

for _, tag in ipairs(doubleTagMultiLine) do
    snippets[#snippets + 1] = s(tag, fmt([[
        <]] .. tag .. [[>
            {}
        </]] .. tag .. [[>
    ]], { i(1) }))
end

for _, tag in ipairs(doubleTagInline) do
    snippets[#snippets + 1] = s(
        tag,
        fmt("<" .. tag .. ">{}</" .. tag .. ">", { i(1) })
    )
end

for _, tag in ipairs(singleTag) do
    snippets[#snippets + 1] = s(tag, fmt("<" .. tag .. " {}>", { i(1) }))
end

return snippets
