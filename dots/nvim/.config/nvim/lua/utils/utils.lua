local M = {}

function M.list_insert_unique(lst, vals)
  -- Suppresses the error in this case:
  if not vim.tbl_islist(lst) then lst = {} end
  if not vim.tbl_islist(vals) then vals = { vals } end
  for _, val in ipairs(vals) do
    if not vim.tbl_contains(lst, val) then table.insert(lst, val) end
  end
  return lst
end

function M.vim_opt_toggle(opt, on, off, name)
  if on == nil then on = true end
  if off == nil then off = false end
  if not name then name = opt end
  local is_off = vim.opt[opt]:get() == off
  vim.opt[opt] = is_off and on or off
  require("astrocore").notify(name .. " " .. (is_off and "Enabled" or "Disabled"))
end

function M.async_run(cmd, on_finish)
  local lines = { "" }

  local function on_event(_, data, event)
    if (event == "stdout" or event == "stderr") and data then vim.list_extend(lines, data) end

    if event == "exit" then
      vim.fn.setqflist({}, " ", {
        title = table.concat(cmd, " "),
        lines = lines,
        efm = "%f:%l:%c: %t%n %m",
      })
      if on_finish then on_finish() end
    end
  end

  vim.fn.jobstart(cmd, {
    on_stdout = on_event,
    on_stderr = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

function M.toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
      break
    end
  end
  if qf_exists then
    vim.cmd.cclose()
  elseif not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd.copen()
  end
end

function M.better_search(key)
  return function()
    local searched, error =
      pcall(vim.cmd.normal, { args = { (vim.v.count > 0 and vim.v.count or "") .. key }, bang = true })
    if not searched and type(error) == "string" then require("astrocore").notify(error, vim.log.levels.ERROR) end
  end
end

return M
