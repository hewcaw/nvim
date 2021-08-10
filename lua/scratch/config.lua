local config = {}

config.one = "one"

function config.setup(two, three)
  config.two = two or "two"
  config.three = three or "three"
end

return config
