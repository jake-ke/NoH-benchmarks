# BEGIN Vivado Commands 
set vivado_ver [version -short]
set fpo_ver 7.1
if {[regexp -nocase {2015\.1.*} $vivado_ver match]} {
    set fpo_ver 7.0
}
create_ip -name floating_point -version $fpo_ver -vendor xilinx.com -library ip -module_name krnl_partialKnn_wrapper_35_fmadd_32ns_32ns_32ns_32ns_32_3_primitive_dsp_1_ip
# BEGIN Vivado Commands 
# BEGIN Vivado Parameters
set_property -dict [list CONFIG.Operation_Type {Unfused_Multiply_Add} \
                         CONFIG.Add_Sub_Value {Add} \
                         CONFIG.Flow_Control {NonBlocking} \
                         CONFIG.Maximum_Latency {false} \
                         CONFIG.Has_ACLKEN {true} \
                         CONFIG.A_Precision_Type {Single} \
                         CONFIG.C_A_Exponent_Width {8} \
                         CONFIG.C_A_Fraction_Width {24} \
                         CONFIG.Result_Precision_Type {Single} \
                         CONFIG.C_Result_Exponent_Width {8} \
                         CONFIG.C_Result_Fraction_Width {24} \
                         CONFIG.c_mult_usage Primitive_Usage \
                         CONFIG.c_latency 2 \
                         CONFIG.Has_RESULT_TREADY {false} \
                         CONFIG.C_Rate {1}] [get_ips krnl_partialKnn_wrapper_35_fmadd_32ns_32ns_32ns_32ns_32_3_primitive_dsp_1_ip]
# END Vivado Parameters
set_property generate_synth_checkpoint false [get_files krnl_partialKnn_wrapper_35_fmadd_32ns_32ns_32ns_32ns_32_3_primitive_dsp_1_ip.xci]
generate_target {synthesis simulation} [get_files krnl_partialKnn_wrapper_35_fmadd_32ns_32ns_32ns_32ns_32_3_primitive_dsp_1_ip.xci]
