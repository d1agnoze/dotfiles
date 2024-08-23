local M = {}
M.imname_vn = "unikey"
M.imname_us = "keyboard-us"

function M.getFcitx()
  local fcitx = ""
  if vim.fn.executable "fcitx-remote" == 1 then
    fcitx = "fcitx-remote"
  elseif vim.fn.executable "fcitx5-remote" == 1 then
    fcitx = "fcitx5-remote"
  end
  return fcitx
end

function M.toggleImname()
  local targetImname = M.imname_vn
  local current = M.getFcitx()
  if current == "" then
    return
  end
  local output = vim.fn.system(current .. " -n")
  output:gsub("%s+", "") -- Remove any trailing whitespace
  if output == M.imname_vn then
    targetImname = M.imname_us
  end
  vim.fn.system(current .. " -s " .. targetImname)
end

return M
