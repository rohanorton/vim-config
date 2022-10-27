local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local ng_service = s(
  {
    trig = "ng-service",
    dscr = "Angular service",
  },

  fmta(
    [[
import { Injectable } from '@angular/core';

@Injectable({ providedIn: <provided_in> })
export class <service_name>Service {
	constructor() { }
  <final>
}
]],
    {
      provided_in = i(1, "root"),
      service_name = i(2, "Name"),
      final = i(3, ""),
    }
  )
)

return { ng_service }, {}
