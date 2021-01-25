function SetState(name)
    dput(name,"landin","1")
    dput(name,"landout","0")
end
Listen("onJoin","SetState")

function SendNotice()
    players = oList()
    for i = 1, #players do
        pname = players[i]
        owner = nil
        if getLand(getPos(pname)) ~= nil then
            kkk,kkkk,owners = getLand(getPos(pname))
            owner = owners[1]
        end
        if owner ~= nil and dget(pname,"landin") == "0" then
            sendText(pname,"你进入了"..owner.."的领地",4)
            dput(pname,"landout","0")
            dput(pname,"landin","1")
        end
        if owner == nil and dget(pname,"landout") == "0" then
            sendText(pname,"你离开了领地",4) 
            dput(pname,"landout","1")
            dput(pname,"landin","0")
        end
    end
end
schedule("SendNotice",1,0)

function Fixsystem(s)
    if s ~= nil then
        s = string.gsub(s, ',"system"','')
        s = string.gsub(s, '","',',')
    return s
    end
end

print'LandNotice 已载入'
