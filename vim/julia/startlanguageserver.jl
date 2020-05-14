import LanguageServer
using Pkg
import StaticLint
import SymbolServer

debug = false
envpath = dirname(Pkg.Types.Context().env.project_file)

# const DEPOT_DIR_NAME = ".julia"
# depotpath = if Sys.iswindows()
#     joinpath(ENV["USERPROFILE"], DEPOT_DIR_NAME)
# else
#     joinpath(ENV["HOME"], DEPOT_DIR_NAME)
# end
# server = LanguageServer.LanguageServerInstance(stdin, stdout, false, envpath, depotpath, Dict())

server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, envpath, "")
server.runlinter = true
run(server)
