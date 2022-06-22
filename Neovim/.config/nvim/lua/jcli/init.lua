local function init()
    require 'jcli.plugins'.init()
    require 'jcli.editor'.init()
end

return { init = init }
