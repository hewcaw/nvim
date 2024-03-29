local utils = {}

function utils.exists(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

--- Check if a directory exists in this path
function utils.isdir(path)
  -- "/" works on both Unix and Windows
  return utils.exists(path .. "/")
end

function utils.read_all(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

return utils
