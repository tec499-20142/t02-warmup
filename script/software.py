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
		
		op = raw_input('Operacao: ')
		
		if op == '+':
			#rs232.write('{0:08b}'.format(0))
			rs232.write(chr(0))
		elif op == '-':			
			rs232.write(chr(1))
		elif op == '&':
			rs232.write(chr(2))
		elif op == '|':
			rs232.write(chr(3))
		elif op == '*':
			rs232.write(chr(4))
		elif op == '/':
			rs232.write(chr(5))

		while op1 > 255:
			op1 = int(raw_input('Operando 1: '))
			if op1 > 255:
				print 'Numero possui mais que 8 bits.'
		rs232.write(chr(op1))
		
		while op2 > 255:
			op2 = int(raw_input('Operando 2: '))
			if op2 > 255:
				print 'Numero possui mais que 8 bits.'
		rs232.write(chr(op2))
		
	except KeyboardInterrupt:
		print '\n\n\tPrograma finalizado!\n'
		break

