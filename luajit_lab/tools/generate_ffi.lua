-- https://github.com/godfat/cubeat/blob/master/cubeat-core/generate_ffi.lua
-- temporary C interface header to LuaJIT FFI cdefs command script
-- $ luajit tools/generate_ffi.lua bindings

local stub = io.open("stub.c", "w")
stub:write("#include <" .. arg[1] .. ".h>")
stub:close()

local str2 = "gcc -I include -E -P stub.c > luascripts/ffi/" .. arg[1] .. ".ffi"
print(str2)

os.execute(str2)
os.execute('rm stub.c')
print 'done'
