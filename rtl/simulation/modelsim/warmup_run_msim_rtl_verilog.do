transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/wagner/UEFS/2014.2/MI\ -\ SD/t02-warmup/rtl {/home/wagner/UEFS/2014.2/MI - SD/t02-warmup/rtl/warmup.v}
vcom -93 -work work {/home/wagner/UEFS/2014.2/MI - SD/t02-warmup/rtl/uart.vhd}

