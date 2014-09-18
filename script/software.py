#!/usr/bin/env python
#-*- coding: utf-8 -*-

#================================== 
#	Author: Wagner Bittencourt
#==================================

''' Originalmente feito para LINUX!'''

import os,sys,serial

''' obtendo a identificação, passado na linha de execução do programa, normalmente /dev/tty*** no linux''' 
path = sys.argv[1] 

rs232 = serial.Serial(path,9600) # 9600 TAXA de transmissão

while True:
	try:
		op1 = 256
		op2 = 256
		
		op = raw_input('Operação: ')
		rs232.write(val1)
		
		while op1 > 255:
			o1 = raw_input('Operando 1: ')
			if o1 > 255:
				print 'Número possui mais que 8 bits.'
		rs232.write('{0:08b}'.format(int(o1)))
		
		while op2 > 255:
			o2 = raw_input('Operando 2: ')
			if o2 > 255:
				print 'Número possui mais que 8 bits.'
		rs232.write('{0:08b}'.format(int(o2)))
		
		os.system('clear')

	except KeyboardInterrupt:
		print 'Programa finalizado!'
		break

