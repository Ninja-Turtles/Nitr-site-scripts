file2=loadfile("C:/Users/Skylight/My Documents/dependencies/tRQDB.lua")
file2()
a={}
function format_filename(s)
s=string.gsub(s,"+","")
s=string.gsub(s,"%%(%x%x)",function(h)
return string.char(tonumber(h,16))
end)
return s
end
for i,v in pairs(tRQDB.REL) do
a[i]={}
for j,w in ipairs(tRQDB.REL[i]) do
local b=w.Name
local c=os.date("%d/%m/%Y %X",w.Time)
_,_,d=string.match(b,"=(.-)=(.-)=(.*)")
local e=format_filename(d)
table.insert(a[i],{ Magnet=b,File=e,Nick=w.Nick,Date=c,Time=w.Time })
end
end

Handle=io.open("C:/Users/Skylight/My Documents//dependencies/Releases.lua","w+")
Handle:write("Releases={\n\t\t")
for i,v in pairs(a) do
Handle:write(i,"={\n\t\t\t\t")
for j,w in ipairs(a[i]) do
Handle:write("{\n\t\t\t\t\t Magnet=\"",a[i][j].Magnet,"\",\n\t\t\t\t\t File=\"",a[i][j].File,"\",\n\t\t\t\t\t Nick=\"",a[i][j].Nick,"\",\n\t\t\t\t\t Date=\"",a[i][j].Date,"\",\n\t\t\t\t\t Time=",a[i][j].Time,",\n\t\t\t\t},\n\t\t\t\t")
end
Handle:write("},\n\t\t")
end
Handle:write("}")
Handle:close()
