local ls = require("luasnip")
local s = ls.snippet
local c = ls.choice_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local Convert = require("rohan.util.convert_case")

local template_component = fmta(
  [[
import { Component, OnInit } from '@angular/core';

@Component({
  selector: '<selector_name>',
  templateUrl: '<template_name>.component.html'
})
export class <class_name>Component implements OnInit {
  constructor() { }

  ngOnInit() { }
}
]],
  {
    selector_name = i(1, "selector-name"),
    template_name = i(2, "name"),
    class_name = f(function(args)
      local word = args[1][1]
      return Convert(word).to_pascal_case()
    end, { 2 }),
  }
)

local inline_component = fmta(
  [[
import { Component, OnInit } from '@angular/core';

@Component({
	selector: '<selector_name>',
	template: '<template>'
})
export class <class_name>Component implements OnInit {
	constructor() { }

	ngOnInit() { }
}
]],
  {
    selector_name = i(1, "selector-name"),
    template = i(2, "template"),
    class_name = i(3, "Name"),
  }
)

local ng_component = s(
  {
    trig = "ng-component",
    dscr = "Angular component",
  },

  c(1, {
    template_component,
    inline_component,
  })
)

return { ng_component }, {}
