onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 40 {TOP LEVEL}
add wave -noupdate /tb_datapath/clk
add wave -noupdate /tb_datapath/rst_n
add wave -noupdate /tb_datapath/write
add wave -noupdate /tb_datapath/writedata
add wave -noupdate /tb_datapath/error
add wave -noupdate /tb_datapath/state
add wave -noupdate /tb_datapath/first_reg
add wave -noupdate /tb_datapath/second_reg
add wave -noupdate /tb_datapath/third_reg
add wave -noupdate /tb_datapath/fourth_reg
add wave -noupdate -divider -height 40 INTERNAL
add wave -noupdate /tb_datapath/dut/first_enable
add wave -noupdate /tb_datapath/dut/second_enable
add wave -noupdate /tb_datapath/dut/third_enable
add wave -noupdate /tb_datapath/dut/fourth_enable
add wave -noupdate /tb_datapath/dut/a_enable
add wave -noupdate /tb_datapath/dut/b_enable
add wave -noupdate /tb_datapath/dut/c_select
add wave -noupdate /tb_datapath/dut/ab_select
add wave -noupdate /tb_datapath/dut/reg_init
add wave -noupdate /tb_datapath/dut/init
add wave -noupdate /tb_datapath/dut/reg_select
add wave -noupdate /tb_datapath/dut/first_out
add wave -noupdate /tb_datapath/dut/second_out
add wave -noupdate /tb_datapath/dut/third_out
add wave -noupdate /tb_datapath/dut/fourth_out
add wave -noupdate /tb_datapath/dut/a_out
add wave -noupdate /tb_datapath/dut/b_out
add wave -noupdate /tb_datapath/dut/m_out
add wave -noupdate /tb_datapath/dut/data
add wave -noupdate /tb_datapath/dut/data_through
add wave -noupdate /tb_datapath/dut/init_data
add wave -noupdate /tb_datapath/dut/i
add wave -noupdate /tb_datapath/dut/j
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 213
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {28455 ps}
