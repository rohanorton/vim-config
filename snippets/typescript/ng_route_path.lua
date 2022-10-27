local ls = require("luasnip")
local s = ls.snippet
local c = ls.choice_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local default_route_path =
  fmta("{ path: '', pathMatch: 'full', redirectTo: '<path>' },<final>", { path = i(1, "path"), final = i(2, "") })

local eager_route_path = fmta(
  "{ path: '<path>', component: <component>Component },<final>",
  { path = i(1, "path"), component = i(2, "Name"), final = i(3, "") }
)

local lazy_route_path = fmta(
  [[
{
	path: '<path>',
	loadChildren: () =>> import('<lazy_path>').then(m =>> m.<lazy_module>)
},<final>
]],
  {
    path = i(1, "path"),
    lazy_path = i(2, "lazy_path"),
    lazy_module = i(3, "lazy_module"),
    final = i(4, ""),
  }
)

local not_found_route_path = fmta(
  "{ path: '**', component: <component> },<final>",
  { component = i(1, "PathNotFoundComponent"), final = i(2, "") }
)

local route_path_with_children = fmta(
  [[
{
	path: '<path>',
	component: <component>,
	children: [
		{ path: '<child_path>', component: <child_component> }
	]
},<final>
]],
  {
    path = i(1, "path"),
    component = i(2, "Component"),
    child_path = i(3, "cihld_path"),
    child_component = i(4, "ChidComponent"),
    final = i(5, ""),
  }
)

local ng_route_path = s(
  {
    trig = "ng-route-path",
    dscr = "Angular route path",
  },

  c(1, {
    default_route_path,
    eager_route_path,
    lazy_route_path,
    route_path_with_children,
    not_found_route_path,
  })
)

return { ng_route_path }, {}
