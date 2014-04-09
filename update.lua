file1=loadfile("C:/Users/Skylight/My Documents/dependencies/Releases.lua")
file1()
a=Releases
file2=loadfile("C:/Users/Skylight/My Documents/dependencies/tRQDB.lua")
file2()
function format_filename(s)
s=string.gsub(s,"+","")
s=string.gsub(s,"%%(%x%x)",function(h)
return string.char(tonumber(h,16))
end)
return s
end
for i,v in pairs(tRQDB.REL) do
for j,w in ipairs(tRQDB.REL[i]) do
local index=w.Time
local b=w.Name
local c=os.date("%d/%m/%Y %X",index)
_,_,d=string.match(b,"=(.-)=(.-)=(.*)")
local e=format_filename(d)
counter=0
for p,q in ipairs(a[i]) do
if index==q.Time then
counter=counter+1
end
end
if counter==0 then
table.insert(a[i],{ Magnet=b,File=e,Nick=w.Nick,Date=c,Time=index })
end
end
end

Handle=io.open("C:/Users/Skylight/My Documents/dependencies/Releases.lua","w+")
Handle:write("Releases={\n\t\t")
for i,v in pairs(a) do
table.sort(a[i],function(a,b) return(a.Time>b.Time) end)
Handle:write(i,"={\n\t\t\t\t")
table.sort(a[i],function(a,b) return(a.Time>b.Time) end)
for j,w in ipairs(a[i]) do
Handle:write("{\n\t\t\t\t\t Magnet=\"",w.Magnet,"\",\n\t\t\t\t\t File=\"",w.File,"\",\n\t\t\t\t\t Nick=\"",w.Nick,"\",\n\t\t\t\t\t Date=\"",w.Date,"\",\n\t\t\t\t\t Time=",w.Time,",\n\t\t\t\t},\n\t\t\t\t")
end
Handle:write("},\n\t\t")
end
Handle:write("}")
Handle:close()
