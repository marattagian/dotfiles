local M = {}

function M.parse_fountain()
  local scene_number = 1
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local elements = {}
  local current_element = {}
  local in_dialogue = false

  for i, line in ipairs(lines) do
    -- Remove leading and trailing whitespace
    line = line:gsub("^%s*(.-)%s*$", "%1")

    if line:find("^#") then
      -- Scene heading
      local heading = line:sub(2)
      table.insert(elements, { type = "scene_heading", text = heading, number = scene_number })
      scene_number = scene_number + 1
    elseif line:find("^%..+") then
      -- Action
      local action = line:sub(2)
      table.insert(elements, { type = "action", text = action })
    elseif line:find("^%b()") then
      -- Parenthetical
      local parenthetical = line:sub(2, -2)
      table.insert(current_element, { type = "parenthetical", text = parenthetical })
    elseif line:find("^%b<>") then
      -- Transition
      local transition = line:sub(2, -2)
      table.insert(elements, { type = "transition", text = transition })
    elseif line:find("^[%a%s]+$") then
      -- Character name
      local name = line
      table.insert(current_element, { type = "character", name = name })
      in_dialogue = true
    elseif in_dialogue then
      -- Dialogue
      table.insert(current_element, { type = "dialogue", text = line })
    else
      -- Unknown element
      table.insert(elements, { type = "unknown", text = line })
    end

    if line == "" or i == #lines then
      -- End of element
      if #current_element > 0 then
        table.insert(elements, { type = "element", elements = current_element })
        current_element = {}
        in_dialogue = false
      end
    end
  end

  return elements
end

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = {},
      custom_captures = {
        ["element.character"] = "FountainCharacter",
        ["element.dialogue"] = "FountainDialogue",
        ["element.scene_heading"] = "FountainSceneHeading",
        ["element.transition"] = "FountainTransition",
      },
    },
  })
end

return M
