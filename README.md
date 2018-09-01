# test-cereal-getFloat32-vector

~~~~
stack init
stack build --profile
stack exec putter
stack exec -- naive-getter +RTS -hc -p -s
stack exec -- hp2ps -c naive-getter.hp
open naive-getter.ps
stack exec -- revised-getter +RTS -hc -p -s
stack exec -- hp2ps -c revised-getter.hp
open revised-getter.ps
~~~~
