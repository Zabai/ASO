#!/bin/bash

# Ejecuta codigo python desde un bash script
cat << FIN | python
print 'Hola Mundo Cat'

for f in range(10):
	print 'Hola de nuevo Cat'
FIN

python << FIN
print 'Hola Mundo Python'

for f in range(10):
	print 'Hola de nuevo Python'
FIN
