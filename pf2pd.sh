#!/bin/bash

declare -a pila

agregar(){
	(( p++ ))
	pila[${p}]=${1}
}

operar(){
	case ${1} in

		D ) (( p++ ))
	            pila[${p}]="${pila[$(( p - 1 ))]}"
			;;

		X ) x="${pila[$p]}"; pila[${p}]="${pila[$(( p - 1 ))]}"; pila[$(( p - 1 ))]="$x"
			;;
		
		! ) operacion="!${pila[$p]}"
			pila[${p}]="${operacion}"
			;;
		
		~ ) operacion="~${pila[$p]}"
			pila[${p}]="${operacion}"
			;;

		n ) operacion="(t*p(2\,${pila[$p]}/12.0))"
			pila[${p}]="${operacion}"
			;;
		
		* ) operacion="(${pila[$(( p - 1 ))]}${1}${pila[$p]})" 
			(( p-- )) 
			pila[${p}]="${operacion}"
			;;
	
	esac
	
}

for ((i=1;i<=$#;i++))
do 
	[ "${!i::1}" == "_" ] && continue # comentarios
	[[ ${!i} =~ t|[0-9] ]] && agregar "${!i}" || operar "${!i}"
done

#echo "${pila[${p}]}" 

EXPR=$(echo "${pila[${p}]}" | sed -f replace.sed)
echo 'clear; obj 12 29 expr~ '$EXPR';obj 12 271 s~ wave;obj 12 3 r~ time;connect 0 0 1 0;connect 2 0 0 0;'
