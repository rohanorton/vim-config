local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local ng_pipe = s(
  {
    trig = "ng-pipe",
    dscr = "Angular pipe",
  },

  fmta(
    [[
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
	name: '<selector_name>'
})
export class <class_name>Pipe implements PipeTransform {
	transform(value: any, ...args: any[]): any {
    <final>
	}
}
]],
    {
      selector_name = i(1, "selector-name"),
      class_name = i(2, "Name"),
      final = i(3, ""),
    }
  )
)

return { ng_pipe }, {}
