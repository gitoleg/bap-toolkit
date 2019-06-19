

  |   Artifacts      |                            Checks                                                                 |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  |  httpd-2.4.18    | Forbidden:                                                                                        |
  |                  |  __errno_location abort atoi atol exit fprintf freopen getenv printf putchar puts sscanf          |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  |  ap_abort_on_oom           parse_errorlog_item                                                    |
  |                  |  ap_add_module_commands    process_resource_config_fnmatch                                        |
  |                  |  ap_die                    process_resource_config_nofnmatch                                      |
  |                  |  ap_rgetline_core          sub_43e8ec                                                             |
  |                  |  ap_rxplus_exec            sub_4404b0                                                             |
  |                  |  ap_soak_end_container     sub_45aa86                                                             |
  |                  |  ap_strcasecmp_match       sub_45da01                                                             |
  |                  |  ap_strcmp_match           sub_478d3d                                                             |
  |                  |  child_main                sub_48384a                                                             |
  |                  |  clean_child_exit          sub_483ce2                                                             |
  |                  |  count_directives_sub      sub_486162                                                             |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  |  ap_core_output_filter                  ap_select_protocol                                        |
  |                  |  ap_directory_walk                      ap_set_byterange                                          |
  |                  |  ap_get_mime_headers_core               ap_setup_client_block                                     |
  |                  |  ap_http_filter                         basic_http_header                                         |
  |                  |  ap_process_async_request               default_handler event_check_config                        |
  |                  |  ap_process_request_internal            log_error_core                                            |
  |                  |  ap_read_request                        sub_483ce2                                                |
  |                  |  ap_scan_script_header_err_core_ex                                                                |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  |  not found                                                                                        |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  |  ap_add_module                   0x45AD1D    ap_send_interim_response  0x43F3C0                   |
  |                  |  ap_expr_yy_init_buffer          0x471B22    prep_walk_cache           0x44E371                   |
  |                  |  ap_expr_yy_load_buffer_state    0x471983    ap_make_dirstr_parent     0x4303AA                   |
  |                  |  ap_escape_html2                 0x432C43    regsub_core               0x42FB09                   |
  |                  |  cfg_trim_line                   0x431073    regsub_core               0x42FCD4                   |
  |                  |  ap_varbuf_cfg_getline           0x431192    ap_if_walk                0x4514CC                   |
  |                  |  ap_cfg_getline_core             0x430F6F    alloc_listener            0x468D30                   |
  |                  |  find_module                     0x446260    ap_send_http_trace        0x47D39B                   |
  |                  |  ap_getword_conf                 0x430851    ap_rxplus_compile         0x46DF26                   |
  |                  |  ap_expr_parse                   0x45605B    ap_response_code_string   0x4424D1                   |
  |                  |  register_filter                 0x437257    ap_read_request           0x43CBF2                   |
  |                  |  ap_os_escape_path               0x4327DE    ap_read_request           0x43CA31                   |
  |                  |  load_module                     0x472E74    ap_read_request           0x43D37A                   |
  |                  |  ap_add_file_conf                0x441F5A    close_handle_in_child     0x45F6D6                   |
  |                  |  extract_cookie_line             0x46D460    close_handle_in_child     0x45F6EA                   |
  |                  |  ap_reopen_scoreboard            0x43954A    dummy_connection          0x46BC5C                   |
  |                  |  ap_get_server_protocol          0x4468DF    ap_make_method_list       0x4766D6                   |
  |                  |  find_accf_name                  0x468A05    form_header_field         0x47B994                   |
  |                  |  ap_add_per_dir_conf             0x441E94                                                         |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  |  atoi    0x4734E2  memcpy  0x432C43                                                               |
  |                  |  atoi    0x48958D  memcpy  0x434632                                                               |
  |                  |  atoi    0x4895DC  memcpy  0x471318                                                               |
  |                  |  atoi    0x48962B  memset  0x4491C6                                                               |
  |                  |  atoi    0x489789  memset  0x45CE3F                                                               |
  |                  |  atoi    0x4897D8  memset  0x471F30                                                               |
  |                  |  atoi    0x489827  memset  0x47269E                                                               |
  |                  |  atoi    0x489876  memset  0x48235C                                                               |
  |                  |  fprintf 0x42BE42  memset  0x4853DB                                                               |
  |                  |  fprintf 0x4723E5  printf  0x45A8EE                                                               |
  |                  |  memcpy  0x432B17  strlen  0x447001                                                               |
  |                  |  memcpy  0x432B53  strlen  0x45605B                                                               |
  |                  |  memcpy  0x432B8F  strtod  0x4898CC                                                               |
  |                  |  memcpy  0x432BCB                                                                                 |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  |  libbfd-2.31.1   | Forbidden:                                                                                        |
  |                  | __errno_location abort ctime exit fclose ferror fflush fprintf fputc fputs fread fwrite           |
  |                  | getenv printf sprintf sscanf time vfprintf                                                        |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  |   _bfd_archive_64_bit_slurp_armap          elf_gc_propagate_vtable_entries_used     sub_9f530     |
  |                  |   _bfd_coff_final_link                     elf_i386_finish_dynamic_symbol           sub_ac1f8     |
  |                  |   _bfd_coff_gc_mark.part.11.constprop.14   elf_x86_64_finish_dynamic_symbol         sub_ac220     |
  |                  |   _bfd_elf_adjust_dynamic_symbol           eval_symbol                              sub_ad7b6     |
  |                  |   _bfd_elf_compute_section_file_positions  find_abstract_instance.isra.29           sub_afb62     |
  |                  |   _bfd_elf_gc_mark                         higher_prime_index                       sub_b14eb     |
  |                  |   _bfd_elf_get_property                    internal_cplus_demangle                  sub_b3ac0     |
  |                  |   _bfd_elf_make_section_from_shdr          on_needed_list                           sub_b4000     |
  |                  |   _bfd_elf_write_object_contents           qualifier_string read_attribute_value    sub_b473f     |
  |                  |   _bfd_get_elt_at_filepos                  rsrc_compute_region_sizes                sub_b49b8     |
  |                  |   bfd_cache_lookup_worker                  rsrc_count_directory                     sub_b4b35     |
  |                  |   bfd_compress_section_contents            rsrc_parse_directory                     sub_b545e     |
  |                  |   bfd_elf_string_from_elf_section          rsrc_print_resource_directory            sub_b9fe7     |
  |                  |   bfd_errmsg                               rsrc_sort_entries.part.8                 sub_bc4d6     |
  |                  |   bfd_section_from_shdr                    rsrc_write_directory                     sub_c4618     |
  |                  |   bfd_set_error                            string_need                              sub_c4640     |
  |                  |   cplus_demangle                           sub_4c446                                sub_c5bd6     |
  |                  |   cplus_demangle_mangled_name              sub_577b0                                sub_c7f22     |
  |                  |   cplus_demangle_type                      sub_5b7a1                                sub_c987b     |
  |                  |   d_bare_function_type                     sub_5cb38                                sub_d1cd8     |
  |                  |   d_encoding                               sub_5f9a0                                sub_e9bb1     |
  |                  |   d_expression_1                           sub_73e65                                              |
  |                  |   d_exprlist                               sub_73fc3                                              |
  |                  |   d_find_pack                              sub_758d0                                              |
  |                  |   d_name                                   sub_7b6e8                                              |
  |                  |   d_print_array_type.isra.10               sub_7b718                                              |
  |                  |   d_print_mod_list                         sub_81dcb                                              |
  |                  |   d_template_args_1                        sub_81e0a                                              |
  |                  |   demangle_qualified                       sub_92288                                              |
  |                  |   demangle_template_template_parm          sub_96fd0                                              |
  |                  |   demangle_template_value_parm             sub_97009                                              |
  |                  |   dlang_identifier                         sub_970a0                                              |
  |                  |   dlang_parse_mangle                       sub_970e9                                              |
  |                  |   dlang_parse_qualified                    sub_9bd4b                                              |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  |   _bfd_dwarf2_find_nearest_line              sub_42252      sub_a52c9                             |
  |                  |   _bfd_elf_discard_section_eh_frame          sub_5aa32      sub_a60d9                             |
  |                  |   _bfd_elf_map_sections_to_segments          sub_5cb38      sub_a7ab2                             |
  |                  |   _bfd_elf_merge_symbol                      sub_5f9a0      sub_a9de9                             |
  |                  |   _bfd_elf_slurp_version_tables              sub_6175a      sub_aa792                             |
  |                  |   _bfd_generic_link_output_symbols           sub_631cc      sub_ac4d0                             |
  |                  |   _bfd_link_section_stabs                    sub_67479      sub_b0b07                             |
  |                  |   _bfd_merge_sections                        sub_682b9      sub_b272d                             |
  |                  |   _bfd_stab_section_find_nearest_line        sub_6b212      sub_b5baf                             |
  |                  |   _bfd_x86_elf_finish_dynamic_sections       sub_6c157      sub_b6dc9                             |
  |                  |   _bfd_x86_elf_link_setup_gnu_properties     sub_6d6fb      sub_bb34a                             |
  |                  |   bfd_elf_final_link                         sub_6f331      sub_bcb04                             |
  |                  |   bfd_elf_link_add_symbols                   sub_6fcb9      sub_be4c2                             |
  |                  |   bfd_elf_size_dynamic_sections              sub_70e55      sub_c21d9                             |
  |                  |   coff_slurp_symbol_table.part.12            sub_72d7b      sub_c2b82                             |
  |                  |   coff_slurp_symbol_table.part.6             sub_740da      sub_c48f0                             |
  |                  |   d_expression_1                             sub_775d2      sub_caadd                             |
  |                  |   d_exprlist                                 sub_79efa      sub_cd959                             |
  |                  |   decode_line_info                           sub_81fe3      sub_d1682                             |
  |                  |   demangle_arm_hp_template                   sub_8549b      sub_dc4a6                             |
  |                  |   demangle_template                          sub_86bf6      sub_e4b5b                             |
  |                  |   elf_i386_check_relocs                      sub_8870a                                            |
  |                  |   error_handler_internal                     sub_90fd6                                            |
  |                  |   eval_symbol                                sub_923e1                                            |
  |                  |   gnu_special                                sub_94948                                            |
  |                  |   internal_cplus_demangle                    sub_9a8fa                                            |
  |                  |   pex64_bfd_print_pdata_section              sub_9bd4b                                            |
  |                  |   read_attribute_value                       sub_9d5d2                                            |
  |                  |   scan_unit_for_symbols                      sub_9f530                                            |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | _bfd_abort sub_bbcc1 sub_e2b51                                                                    |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  |  string_need                              0xCD0E7                                                 |
  |                  |  nacl_modify_segment_map                  0x6546A                                                 |
  |                  |  elf_x86_64_finish_dynamic_symbol         0x5AFF8                                                 |
  |                  |  elf_i386_finish_dynamic_symbol           0x9DB30                                                 |
  |                  |  bfd_elf_link_add_symbols                 0x82440                                                 |
  |                  |  elf_link_input_bfd                       0x88CD3                                                 |
  |                  |  elf_link_input_bfd                       0x8889C                                                 |
  |                  |  do_type                                  0xCF4A8                                                 |
  |                  |  dlang_parse_qualified                    0xDF4B4                                                 |
  |                  |  sec_merge_hash_lookup                    0x4DFA2                                                 |
  |                  |  elf_merge_gnu_properties                 0x90B40                                                 |
  |                  |  _bfd_construct_extended_name_table       0x422CC                                                 |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | lighttpd-1.4.15  | Forbidden:                                                                                        |
  |                  | __errno_location  abort exit     fprintf   fputc  fputs  fwrite getenv gmtime                     |
  |                  | puts setlocale    signal strftime localtime mktime perror time                                    |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | array_init array_insert_uniq data_string_init proc_open_b                                         |
  |                  | sub_1163c sub_12091 sub_14d5 sub_1eee0 sub_1eee7 sub_bf08                                         |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | connection_handle_read_state sub_12091 sub_121be sub_18774                                        |
  |                  | sub_74e9 sub_97a2                                                                                 |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | fdevent_poll_event_get_revent                                                                     |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  |  splaytree_insert                0x1F220                                                          |
  |                  |  splaytree_insert                0x1F1CC                                                          |
  |                  |  array_init_array                0x192F7                                                          |
  |                  |  array_init_array                0x19327                                                          |
  |                  |  array_init_array                0x19339                                                          |
  |                  |  array_init_array                0x192D1                                                          |
  |                  |  splaytree_delete                0x1F2F8                                                          |
  |                  |  network_server_init             0xCF86                                                           |
  |                  |  stat_cache_get_entry            0x17306                                                          |
  |                  |  config_parse.constprop.5        0xE999                                                           |
  |                  |  network_write_chunkqueue_writev 0x1E95B                                                          |
  |                  |  network_write_chunkqueue_writev 0x1E991                                                          |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | nginx-1.7        | Forbidden:                                                                                        |
  |                  | __errno_location abort exit getenv localtime mktime raise rename strftime time                    |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | sub_4077f4 sub_409103 sub_409250 sub_4093A0 sub_409FA0 sub_40A7A0 sub_40A8D0 sub_40AEA0           |
  |                  | sub_40DAB0 sub_40DEC0 sub_411970 sub_412273 sub_418500 sub_41c0a4 sub_41c0ab sub_41c100           |
  |                  | sub_41d0b4 sub_4288e1 sub_42AC50 sub_4305E0 sub_430830 sub_430990 sub_430B70 sub_430DC0           |
  |                  | sub_434890 sub_434B20 sub_435890 sub_436e1d sub_437d02 sub_43C5E0 sub_43CE70 sub_4403b4           |
  |                  | sub_442be3 sub_4456f9 sub_44F360 sub_451940 sub_4532C0 sub_454f11 sub_458F80 sub_45c76c           |
  |                  | sub_45f060 sub_460da8 sub_460f83 sub_460fd8 sub_4621a1 sub_469a11 sub_46eecc sub_471B10           |
  |                  | sub_472b16 sub_47339a sub_473895 sub_479753 sub_47A870 sub_47ecd0 sub_48E510                      |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | sub_40FD90 sub_40c042 sub_416590 sub_418500 sub_41e7be sub_422BB0 sub_427A00 sub_430f6c           |
  |                  | sub_433710 sub_435da0 sub_43C5E0 sub_441D50 sub_443a40 sub_44A180 sub_44f36a sub_450E90           |
  |                  | sub_455df8 sub_45D180 sub_45a6a4 sub_46249d sub_463428 sub_46784a sub_469E70 sub_46BB70           |
  |                  | sub_46cda9 sub_472990 sub_475F70 sub_477310 sub_479DF0 sub_47C540 sub_480440 sub_4812B0           |
  |                  | sub_482960 sub_483C60 sub_4856B0 sub_486860 sub_48bc90 sub_48f567 sub_490470 sub_491F80           |
  |                  | sub_493797                                                                                        |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | sub_41B810 sub_425800 sub_426600 sub_426D00 sub_4273F0 sub_427A00 sub_47ecd0                      |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  | 0x49168F 0x4969CC 0x409FB0 0x48E539 0x48DFFB 0x48E0B0                                             |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | ntpd-4.2.8p5     | Forbidden:                                                                                        |
  |                  | __errno_location abort ctime exit fclose ferror fflush fgetc fgets fopen fprintf fputc            |
  |                  | fputs fread freopen fscanf fwrite getenv gmtime localtime mktime perror printf putchar            |
  |                  | puts rename rewind setvbuf sprintf sscanf strftime system time vfprintf                           |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | addArgListEntry               maintain_activefds           sub_1a9e5                              |
  |                  | adj_systime                   modem_control                sub_1ae49                              |
  |                  | ao_malloc.part.30             mprintf_event                sub_1eea9                              |
  |                  | ao_strdup.part.29             optionUsage                  sub_22fd9                              |
  |                  | change_logfile                peer_config                  sub_2aae6                              |
  |                  | check_gen_fifo_consistency    print_one_paragraph.part.49  sub_2b1bd                              |
  |                  | copy_addrinfo_list_impl       print_ver.part.56            sub_2bdb0                              |
  |                  | ctl_putuint                   prt_extd_usage               sub_2bde1                              |
  |                  | ctl_putunqstr                 prt_opt_usage                sub_2be29                              |
  |                  | destroy_address_node          set_timer_or_die             sub_394c9                              |
  |                  | dump_config_tree              step_systime                 sub_436e8                              |
  |                  | env_presets                   sub_11deb                    sub_577b4                              |
  |                  | ereallocz                     sub_11f00                    sub_5a708                              |
  |                  | free_res                      sub_120a1                    sub_5d3d4                              |
  |                  | freesymkey                    sub_120df                    sub_62073                              |
  |                  | genshelloptUsage              sub_1214c                    sub_622e8                              |
  |                  | get_systime                   sub_12313                    sub_6c094                              |
  |                  | hack_restrict                 sub_12b28                    sub_6d1f9                              |
  |                  | initialize_action             sub_12b46                    teljjy_control                         |
  |                  | isc__strerror                 sub_12c37                    unload_arg_list                        |
  |                  | isc_error_runtimecheck        sub_12e0a                    update_interfaces                      |
  |                  | isc_log_doit                  sub_12e2f                                                           |
  |                  | isc_log_write                 sub_12eed                                                           |
  |                  | isc_msgcat_get                sub_1333a                                                           |
  |                  | isc_sha1_update               sub_133a2                                                           |
  |                  | json_token_skip.part.2        sub_1350f                                                           |
  |                  | list_restrict4                sub_136c5                                                           |
  |                  | list_restrict6                sub_197d8                                                           |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | acts_receive arc_receive clock_select free_all_config_trees                                       |
  |                  | getCmdOpts gpsd_receive hack_restrict jsmn_parse                                                  |
  |                  | opt_find_long optionSetMembers read_network_packet sub_1246f                                      |
  |                  | sub_1376d sub_15056 sub_199e8 sub_1ae49 sub_1da6d sub_2499e sub_3e072 sub_436e8                   |
  |                  | sub_49b86 sub_622e8 sub_6c098 sub_6d1f9 sub_71589 sub_72ad3 sub_73522 sub_f7a6                    |
  |                  | timer update_interfaces yylex                                                                     |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | findexistingpeer getCmdOpts local_clock normal_dtoa                                               |
  |                  | optionRestore option_exits start_blocking_thread_internal sub_11deb                               |
  |                  | sub_1da6d sub_55f6f sub_69208 sub_6d1f9                                                           |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | ntpdc-4.2.8p5    | Forbidden:                                                                                        |
  |                  | __errno_location abort ctime exit fclose ferror fflush fgetc fgets fopen fprintf fputc            |
  |                  | fputs fread freopen fwrite getenv gmtime localtime longjmp perror printf putchar puts             |
  |                  | rename setbuf sprintf sscanf strftime system time vfprintf                                        |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  |  acts_receive              sub_1da6d                                                              |
  |                  |  arc_receive               sub_2499e                                                              |
  |                  |  clock_select              sub_3e072                                                              |
  |                  |  free_all_config_trees     sub_436e8                                                              |
  |                  |  getCmdOpts                sub_49b86                                                              |
  |                  |  gpsd_receive              sub_622e8                                                              |
  |                  |  hack_restrict jsmn_parse  sub_6c098                                                              |
  |                  |  opt_find_                 sub_6d1f9                                                              |
  |                  |  long                      sub_71589                                                              |
  |                  |  optionSetMembers          sub_72ad3                                                              |
  |                  |  read_network_packet       sub_73522                                                              |
  |                  |  sub_1246f                 sub_f7a6                                                               |
  |                  |  sub_1376d                 timer                                                                  |
  |                  |  sub_15056                 update_interfaces                                                      |
  |                  |  sub_199e8                 yylex                                                                  |
  |                  |  sub_1ae49                                                                                        |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | doquery opt_find_long sub_162a8 sub_17409 sub_1b799 sub_1cce3 sub_1d732 sub_226b8                 |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | optionRestore option_exits quit sub_13418 sub_17409                                               |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | openssl-1.1.0    | Forbidden:                                                                                        |
  |                  | __errno_location exit fclose fflush fgets fprintf fputc fputs                                     |
  |                  | fwrite getenv perror printf putchar puts rename setbuf signal time                                |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | app_malloc do_revoke dump_certs_pkeys_bag generate_cookie_callback                                |
  |                  | print_ssl_summary sub_45bed sub_45f45 sub_473b0                                                   |
  |                  | sub_4ffb6 sub_4ffd0 sub_50078 sub_5636d sub_58d90 sub_5d3b3 sub_5d818 sub_5f053                   |
  |                  | sub_67160 sub_671a5                                                                               |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | ca_main dgst_main do_body enc_main engine_main ocsp_main req_main s_server_main                   |
  |                  | smime_main srp_main sub_38c7c sub_3fdef sub_4b5a8 sub_4e510 sub_51459 sub_58d90                   |
  |                  | sub_5d3b3 sub_671b2 sub_6968c sub_715b6 www_body x509_main                                        |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | main                                                                                              |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  | not found                                                                                         |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | samba-4.7.6      | Forbidden:                                                                                        |
  |                  | __errno_location exit fprintf fwrite                                                              |
  |                  | printf puts signal time                                                                           |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | recursive_delete sig_term                                                                         |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | binary_smbd_main                                                                                  |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | not found                                                                                         |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  |  binary_smbd_main 0x4DD0:64u                                                                      |
  |                  |  binary_smbd_main 0x4D6D:64u                                                                      |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  |  fprintf 0x380D                                                                                   |
  |                  |  fprintf 0x4919                                                                                   |
  |                  |  fwrite  0x499B                                                                                   |
  |                  |  printf  0x361F                                                                                   |
  |                  |  printf  0x44FF                                                                                   |
  |                  |  printf  0x455C                                                                                   |
  |                  |  puts    0x450B                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | smtpd-5.7.3p2    | Forbidden:                                                                                        |
  |                  | __errno_location ctime exit fclose feof ferror fflush fopen fprintf fputc fread fseek fwrite      |
  |                  | getenv localtime perror printf rename time vfprintf                                               |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  |  _rs_stir                                    sub_11b9d    sub_37ae8                               |
  |                  |  bounce_delivery                             sub_12a23    sub_3e6c0                               |
  |                  |  ca                                          sub_12a83    sub_3e6c4                               |
  |                  |  ca_init                                     sub_19384    sub_40210                               |
  |                  |  child_add                                   sub_1d4df    sub_40214                               |
  |                  |  expandtree_RB_INSERT_COLOR                  sub_1e5f8    sub_414ac                               |
  |                  |  fatal                                       sub_1e5fc    sub_41efe                               |
  |                  |  filter_extend_chain                         sub_1eaa0    sub_471c8                               |
  |                  |  fsqueue_envelope_path.constprop.4           sub_1eaa4    sub_47221                               |
  |                  |  fsqueue_message_incoming_path.constprop.7   sub_1efe0    sub_47ad0                               |
  |                  |  fsqueue_message_path.constprop.8            sub_1efe4    sub_47ad4                               |
  |                  |  io_dispatch                                 sub_1f6b0    sub_47bcd                               |
  |                  |  io_frame_leave                              sub_1f6b4    sub_48773                               |
  |                  |  m_add                                       sub_1fba0    sub_487d3                               |
  |                  |  m_get_data                                  sub_1fba4    sub_7ebf                                |
  |                  |  m_get_evpid                                 sub_21020    sub_94f1                                |
  |                  |  mta_connect                                 sub_21024    sub_af10                                |
  |                  |  mta_drain                                   sub_22408    sub_af14                                |
  |                  |  offline_enqueue                             sub_22694    sub_c247                                |
  |                  |  parse_sockaddr                              sub_227d0    sub_e5a0                                |
  |                  |  post_fork                                   sub_22c45    sub_e5a4                                |
  |                  |  queue                                       sub_22da9                                            |
  |                  |  queue_proc_end                              sub_24818                                            |
  |                  |  queue_shutdown                              sub_28bdb                                            |
  |                  |  rsae_priv_dec                               sub_2efef                                            |
  |                  |  scheduler_proc_end                          sub_2f078                                            |
  |                  |  set_local                                   sub_2fc28                                            |
  |                  |  smtp_reply                                  sub_30968                                            |
  |                  |  ssl_setup                                   sub_31cbf                                            |
  |                  |  stats_tree_RB_INSERT_COLOR                  sub_31dd3                                            |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | envelope_ascii_dump envelope_load_buffer mta_connect sub_18014                                    |
  |                  | sub_1a9b6 sub_40eb2 sub_410c2 sub_49e34 yylex                                                     |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | queue_proc_call queue_proc_envelope_walk scheduler_proc_call sub_40eb2 sub_410c2 table_proc_call  |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | sqlite3-2.27.2   |                                                                                                   |
  |                  | Forbidden:                                                                                        |
  |                  | __errno_location atoi exit fclose fflush fgetc fgets fprintf                                      |
  |                  | fputc fputs fread fseek ftell fwrite getenv localtime                                             |
  |                  | printf putchar puts raise rewind setvbuf signal system time                                       |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | SortByDimension                    setJoinExpr                       sub_5a631                    |
  |                  | SortByDistance                     shell_out_of_memory               sub_5b423                    |
  |                  | btreeOverwriteContent              sqlite3BitvecDestroy              sub_5b4fc                    |
  |                  | btreePrevious                      sqlite3BitvecSet                  sub_62ac0                    |
  |                  | btreeRestoreCursorPosition         sqlite3BtreeNext                  sub_62b49                    |
  |                  | checkTreePage                      sqlite3BtreeTripAllCursors        sub_630dc                    |
  |                  | clearDatabasePage                  sqlite3CodeSubselect              sub_6f115                    |
  |                  | columnTypeImpl                     sqlite3CreateFunc                 sub_6f6cc                    |
  |                  | deleteCell                         sqlite3DeleteTable                sub_6fd6b                    |
  |                  | do_meta_command                    sqlite3ExprCode                   sub_728cf                    |
  |                  | dupedExprSize                      sqlite3ExprCodeTarget             sub_793a8                    |
  |                  | eqp_render_level                   sqlite3ExprCompare                sub_88120                    |
  |                  | execSql                            sqlite3ExprDelete                 sub_88c5b                    |
  |                  | exprAnalyze                        sqlite3ExprDeleteNN               sub_891d4                    |
  |                  | exprCodeBetween                    sqlite3ExprDup                    sub_8928a                    |
  |                  | exprCodeVector                     sqlite3ExprIfFalse                sub_8a0d5                    |
  |                  | exprDup                            sqlite3ExprIfTrue                 sub_8a296                    |
  |                  | exprSelectUsage                    sqlite3ExprImpliesExpr            sub_8edf0                    |
  |                  | findConstInWhere                   sqlite3ExprIsInteger              sub_8ef40                    |
  |                  | fixBoundingBox                     sqlite3FixExpr                    sub_91913                    |
  |                  | fts3EvalAllocateReaders            sqlite3FixSelect                  sub_9192f                    |
  |                  | fts3EvalNextRow                    sqlite3FixSrcList                 sub_96e93                    |
  |                  | fts3EvalRestart                    sqlite3Fts5ParseNodeFree          sub_96f79                    |
  |                  | fts3EvalStartReaders               sqlite3GenerateConstraintChecks   sub_9b9ef                    |
  |                  | fts3EvalTestExpr                   sqlite3PcacheFetchFini            sub_9cac9                    |
  |                  | fts3EvalTokenCosts                 sqlite3Select                     sub_9cb00                    |
  |                  | fts3EvalUpdateCounts               sqlite3SelectDelete               sub_a2286                    |
  |                  | fts3ExprBalance                    sqlite3SelectDup                  sub_a2347                    |
  |                  | fts3ExprCheckDepth                 sqlite3SrcListAssignCursors       sub_a2364                    |
  |                  | fts3ExprIterate2                   sqlite3VdbeAddOp3                 sub_a2788                    |
  |                  | fts3ExprLHitGather                 sqlite3VdbeChangeP4               sub_a30f3                    |
  |                  | fts3NodeAddTerm.constprop.590      sqlite3VdbeMemShallowCopy         sub_a3311                    |
  |                  | fts3NodeFree                       sqlite3WalkExpr                   sub_a337a                    |
  |                  | fts3SegmentMerge                   sqlite3WalkSelect                 sub_a33e2                    |
  |                  | fts3SelectLeaf                     sqlite3WhereBegin                 sub_a7370                    |
  |                  | fts5DlidxIterNextR                 sqlite3WhereClauseClear           sub_a739e                    |
  |                  | fts5DlidxIterPrevR                 sqlite3WhereExprAnalyze           sub_a7637                    |
  |                  | fts5ExprCheckPoslists              sqlite3WhereExprListUsage         sub_a7642                    |
  |                  | fts5ExprClearPoslists              sqlite3WhereExprUsageNN           sub_a7694                    |
  |                  | fts5ExprNodeFirst                  sqlite3WhereSplit                 sub_a7706                    |
  |                  | fts5ExprNodeZeroPoslist            sqlite3_initialize                sub_ae05c                    |
  |                  | fts5ExprPrint                      sub_10083                         substExpr                    |
  |                  | fts5ExprPrintTcl                   sub_11acc                         substSelect                  |
  |                  | fts5ExprSetEof                     sub_1aeaa                         testcase_glob                |
  |                  | fts5ParseSetColset                 sub_1b081                         unsetJoinExpr                |
  |                  | getRowTrigger                      sub_24942                         valueFromExpr.constprop.626  |
  |                  | isConsonant                        sub_2c353                         vdbeMergeEngineFree          |
  |                  | jsonEachComputePath                sub_2cffa                         vdbeMergeEngineInit.isra.301 |
  |                  | jsonLookupStep                     sub_34aed                         vdbePmaReadBlob              |
  |                  | jsonMergePatch                     sub_3a571                         vdbePmaReaderNext            |
  |                  | jsonParseAddNode                   sub_3b634                         walkExpr                     |
  |                  | jsonParseFillInParentage           sub_3bc87                         whereLoopAddBtreeIndex       |
  |                  | jsonParseValue                     sub_3fe9f                         whereLoopAddOr               |
  |                  | jsonRemoveAllNulls                 sub_485f9                         whereUsablePartialIndex      |
  |                  | multiSelectCollSeq                 sub_4b49a                                                      |
  |                  | nodeRelease                        sub_4dc64                                                      |
  |                  | patternCompare                     sub_4dca6                                                      |
  |                  | pushDownWhereTerms                 sub_4dcb5                                                      |
  |                  | resolveExprStep                    sub_502b2                                                      |
  |                  | rowSetNDeepTree                    sub_504b0                                                      |
  |                  | rowSetTreeToList                   sub_5480f                                                      |
  |                  | rtreeCheckNode                     sub_548c8                                                      |
  |                  | rtreeInsertCell                    sub_5a17a                                                      |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | allocateBtreePage do_meta_command exprAnalyze fts3InitVtab                                        |
  |                  | fts3SnippetFunc fts5MultiIterNew fts5PorterCb openDatabase                                        |
  |                  | pagerWalFrames porterNext process_input selectExpander                                            |
  |                  | sqlite3BtreeOpen sqlite3CreateIndex sqlite3ExprCodeTarget sqlite3Fts5UnicodeCatParse              |
  |                  | sqlite3Insert sqlite3ParseUri sqlite3WhereBegin sqlite3WhereCodeOneLoopStart                      |
  |                  | sqlite3_step sub_108f3 sub_1a0f5 sub_4174a sub_4c02e sub_4ccd8 sub_58179 sub_5a17a                |
  |                  | sub_5eed8 sub_5fccb sub_61c44 sub_68590 sub_6b05b sub_6bf45 sub_6cfd9 sub_6e922                   |
  |                  | sub_82bf7 sub_a160d sub_a417c sub_a538a sub_a6f32 sub_a993b sub_aafb1 unixOpen                    |
  |                  | whereLoopAddBtree wherePathSatisfiesOrderBy                                                       |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | sub_4de4e sub_62b49 sub_83d0a sub_852fe sub_8f005 sub_9192f sub_ae05c                             |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  |  0x2B591                                                                                          |
  |                  |  0x3D25A                                                                                          |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  |  memmove  0x3D25A                                                                                 |
  |                  |  fsync    0x44205                                                                                 |
  |                  |  getpid   0x43F7A                                                                                 |
  |                  |  getpid   0x5CFEF                                                                                 |
  |                  |  memmove  0x46471                                                                                 |
  |                  |  fputs    0x14E64                                                                                 |
  |                  |  fprintf  0x158DD                                                                                 |
  |                  |  fprintf  0x15AE1                                                                                 |
  |                  |  printf   0x1595F                                                                                 |
  |                  |  fprintf  0x15A7F                                                                                 |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | sshd-7.3.p1      | Forbidden:                                                                                        |
  |                  | __errno_location abort ctime exit fclose feof fflush fgetc fgets fopen fputc fputs fscanf         |
  |                  | fwrite getenv localtime perror putchar puts raise rename rewind sscanf strftime time              |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  |  BSDgetopt                                        mm_terminate                         sub_407b1  |
  |                  |  Blowfish_expand0state                            mm_xmalloc                           sub_408e5  |
  |                  |  _rs_stir                                         mmtree_RB_INSERT_COLOR               sub_40972  |
  |                  |  a2tun                                            monitor_read                         sub_481d3  |
  |                  |  addr_match_list                                  packet_set_connection                sub_49c7e  |
  |                  |  atomicio                                         parse_server_config                  sub_4a36a  |
  |                  |  auth2_challenge                                  process_do_stat                      sub_4ad50  |
  |                  |  auth2_update_methods_lists                       read_mux                             sub_531ef  |
  |                  |  auth_debug_add                                   send_attrib                          sub_58318  |
  |                  |  auth_openfile                                    send_data_or_handle                  sub_5e05c  |
  |                  |  auth_rhosts                                      send_msg                             sub_5f98d  |
  |                  |  authorized_principals_file                       send_names                           sub_5fe7d  |
  |                  |  barrett_reduce                                   send_status                          sub_603a3  |
  |                  |  bcrypt_pbkdf                                     send_statvfs                         sub_606e0  |
  |                  |  buffer_consume                                   server_loop2                         sub_606ed  |
  |                  |  buffer_consume_end_ret                           session_destroy_all                  sub_615a7  |
  |                  |  buffer_get_cstring_ret                           session_new                          sub_615b4  |
  |                  |  buffer_get_string                                session_pty_cleanup                  sub_61920  |
  |                  |  buffer_get_string_ptr_ret                        session_unused                       sub_6192d  |
  |                  |  cert_free                                        sftp_server_main                     sub_61dd6  |
  |                  |  channel_decode_socks4.isra.10                    ssh_digest_memory                    sub_61f56  |
  |                  |  channel_decode_socks5.isra.11                    ssh_dispatch_run_fatal               sub_61f71  |
  |                  |  channel_free                                     ssh_krl_revoke_cert_by_key_id        sub_61fcc  |
  |                  |  channel_handle_efd                               ssh_krl_revoke_cert_by_serial_range  sub_624c4  |
  |                  |  channel_new                                      ssh_krl_revoke_key_sha1              sub_624c7  |
  |                  |  channel_setup_fwd_listener_streamlocal           ssh_packet_read_poll_seqnr           sub_62530  |
  |                  |  child_set_env                                    ssh_packet_read_seqnr                sub_6d180  |
  |                  |  cleanup_exit                                     ssh_packet_send2                     sub_9b20   |
  |                  |  collect_children                                 sshbuf_free                          sub_9bdd   |
  |                  |  compress_buffer.isra.4                           sshbuf_get_cstring                   sub_9c0a   |
  |                  |  connect_next.isra.5                              sshbuf_get_string_direct             sub_9c55   |
  |                  |  crypto_sign_ed25519_ref_fe25519_mul              sshbuf_put                           sub_9d66   |
  |                  |  crypto_sign_ed25519_ref_fe25519_sub              sshbuf_put_cstring                   sub_9dc7   |
  |                  |  crypto_sign_ed25519_ref_sc25519_from32bytes      sshbuf_put_ec                        sub_a1b1   |
  |                  |  crypto_sign_ed25519_ref_sc25519_mul              sshbuf_putf                          sub_a4aa   |
  |                  |  do_child                                         sshkey_check_revoked                 sub_b0cf   |
  |                  |  do_cleanup                                       sshkey_fingerprint_raw               sub_b171   |
  |                  |  do_exec_no_pty                                   sshkey_from_blob_internal            sub_b2a9   |
  |                  |  do_exec_pty                                      sshkey_load_file                     sub_b424   |
  |                  |  do_log                                           sshkey_load_private_cert             sub_bbf7   |
  |                  |  do_motd.part.11                                  sshkey_parse_private2.isra.9         sub_bc05   |
  |                  |  error                                            sshpkt_disconnect                    sub_d0c0   |
  |                  |  fatal                                            sshpkt_send                                     |
  |                  |  fatal_on_fatal_errors.part.0                     sshpkt_start                                    |
  |                  |  get_handle                                       store_lastlog_message.isra.0                    |
  |                  |  get_socket_address                               subprocess.isra.1.part.2                        |
  |                  |  host_hash                                        userauth_finish                                 |
  |                  |  hostbased_key_allowed                            xstrdup                                         |
  |                  |  kex_derive_keys                                  sub_1b8e8                                       |
  |                  |  key_to_blob                                      sub_1b9c8                                       |
  |                  |  lastlog_get_entry                                sub_1ba06                                       |
  |                  |  load_hostkeys                                    sub_20240                                       |
  |                  |  logdie                                           sub_205d1                                       |
  |                  |  login_alloc_entry                                sub_20950                                       |
  |                  |  login_get_lastlog                                sub_20953                                       |
  |                  |  login_write                                      sub_21438                                       |
  |                  |  logit                                            sub_21bbd                                       |
  |                  |  mac_compute                                      sub_224a3                                       |
  |                  |  match_pattern                                    sub_22503                                       |
  |                  |  mkstemp                                          sub_22ff8                                       |
  |                  |  mm_auth2_read_banner                             sub_230cd                                       |
  |                  |  mm_create                                        sub_2310b                                       |
  |                  |  mm_free                                          sub_2334a                                       |
  |                  |  mm_get_keystate                                  sub_2e9a0                                       |
  |                  |  mm_getpwnamallow                                 sub_2e9c5                                       |
  |                  |  mm_inform_authserv                               sub_31afb                                       |
  |                  |  mm_key_allowed                                   sub_31b50                                       |
  |                  |  mm_make_entry                                    sub_31b69                                       |
  |                  |  mm_memvalid                                      sub_32504                                       |
  |                  |  mm_request_receive_expect                        sub_32520                                       |
  |                  |  mm_session_pty_cleanup2                          sub_3d268                                       |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | auth_parse_options copy_set_server_options fill_default_server_options hostkeys_foreach           |
  |                  | monitor_child_postauth session_input_channel_req sftp_server_main ssh_krl_from_blob               |
  |                  | sub_48db6 sub_60bcf sub_8e7f sub_a5bf                                                             |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | grace_alarm_handler log_init monitor_child_postauth server_input_channel_open                     |
  |                  | session_input_channel_req sub_497ec sub_5f830 sub_5fd20 userauth_pubkey                           |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  | sshbuf_put_u8              0x3524C                                                                |
  |                  | sshkey_try_load_public     0x371D0                                                                |
  |                  | mktemp_internal            0x6C41E                                                                |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  |   close  0x167FB    close    0x3C4B4    dup2     0xBD93      memcpy   0x3530E                     |
  |                  |   close  0x17525    close    0x4075F    execl    0x1BEBC     memcpy   0x3554A                     |
  |                  |   close  0x195EC    close    0x40787    fclose   0x19EC7     memcpy   0x412D4                     |
  |                  |   close  0x19627    close    0x4080E    fclose   0x1A514     memcpy   0x41DCA                     |
  |                  |   close  0x1963A    close    0x40CC8    fclose   0x1C588     memcpy   0x5291F                     |
  |                  |   close  0x1C8C8    close    0x40CD9    fclose   0x20E7F     memcpy   0x533A9                     |
  |                  |   close  0x1C8D1    close    0x51EEB    fclose   0x54303     memcpy   0x54DDC                     |
  |                  |   close  0x1C923    close    0x51F69    fclose   0x5436B     memcpy   0x54E23                     |
  |                  |   close  0x1CA54    close    0x698D3    fclose   0x54393     memcpy   0x55FCC                     |
  |                  |   close  0x1CA87    close    0x69942    fputc    0x344E3     memcpy   0x56013                     |
  |                  |   close  0x1CB0F    close    0x6E20D    fputc    0x357BB     memcpy   0x57844                     |
  |                  |   close  0x1CB18    close    0x9D48     fputc    0x357E1     memcpy   0x5E441                     |
  |                  |   close  0x1CB1F    close    0xBA4E     fputc    0x42D35     memcpy   0x5EC74                     |
  |                  |   close  0x1CC48    close    0xBD35     fputs    0x19EAA     memcpy   0x696A9                     |
  |                  |   close  0x1CC4F    close    0xBD81     fputs    0x1C356     memcpy   0x6DBE9                     |
  |                  |   close  0x1CC57    close    0xCABB     fwrite   0x1BEA5     memset   0x63925                     |
  |                  |   close  0x25086    close    0xD585     fwrite   0x1C390     memset   0x63F16                     |
  |                  |   close  0x25509    close    0xD5C0     fwrite   0x344C3     memset   0x696B6                     |
  |                  |   close  0x25705    close    0xD602     fwrite   0x3457C     strncpy  0x27E1F                     |
  |                  |   close  0x2570D    memmove  0x2CE09    fwrite   0x345D8     strncpy  0x27E74                     |
  |                  |   close  0x271FF    memmove  0x50332    fwrite   0x35739     strtol   0x389B0                     |
  |                  |   close  0x27DF2    memmove  0x533D2    getpid   0x27E5C     unlink   0x28F55                     |
  |                  |   close  0x3651A    memmove  0x53635    getpid   0x694C4     unlink   0x51F71                     |
  |                  |   close  0x3653D    strlen   0x178BD    getpid   0x695C4     write    0x13092                     |
  |                  |   close  0x3B4C7    strlen   0x4516D    getpid   0x6972E     write    0x444A7                     |
  |                  |   close  0x3B5CE    strlen   0x1A22C    memcpy   0x230F4                                          |
  |                  |   close  0x3C062    dup      0xBA3E     memcpy   0x2E0AC                                          |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | swfc-0.9.2       | Forbidden:                                                                                        |
  |                  | __errno_location clearerr ctime exit fclose feof ferror fflush                                    |
  |                  | fopen fprintf fputc fputs fread fseek ftell fwrite getenv perror printf putchar                   |
  |                  | puts rename sprintf time                                                                          |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | _trie_dump _trie_put add_parent args_callback_longoption                                          |
  |                  | as3__scan_bytes as3_ensure_buffer_stack callcode cut_last_push                                    |
  |                  | dump_asset dump_method enter_file enumerateUsedIDs                                                |
  |                  | filterState_free free_lines input insert_unresolved                                               |
  |                  | node_dump2 node_free registry_find registry_use                                                   |
  |                  | state_free sub_42928 sub_4b335 sub_5134b sub_5e73a sub_61a7a sub_67b07 sub_67dfe                  |
  |                  | sub_6ac1c sub_6ac48 sub_8589b sub_898cd sub_8a9a8 sub_8e2be sub_90b63 sub_9c24a                   |
  |                  | swf4_scan_bytes swf4restart swf5_scan_bytes swf5restart                                           |
  |                  | swf_ShapeSetLine swf_WriteTag use_asset write_asset                                               |
  |                  | yy_scan_bytes yyensure_buffer_stack                                                               |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | enumerateUsedIDs png_load png_write_palette_based2 writeABC                                       |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | zlib_error                                                                                        |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  | dict_put                    0xA854E                                                               |
  |                  | varinfo_register_onclass    0x72140                                                               |
  |                  | swf_Shape2ToShape           0x5CB56                                                               |
  |                  | swf_ReadABCfile             0x66EF1                                                               |
  |                  | swf_Relocate                0x63C8E                                                               |
  |                  | as3__load_buffer_state      0x955B1                                                               |
  |                  | png_write_palette_based2    0xAC856                                                               |
  |                  | png_write_palette_based2    0xAC810                                                               |
  |                  | png_write_palette_based2    0xAC7D0                                                               |
  |                  | png_write_palette_based2    0xAC38E                                                               |
  |                  | png_read_header             0xA97ED                                                               |
  |                  | node_free                   0xA63C2                                                               |
  |                  | enter_file2                 0x95334                                                               |
  |                  | handleInclude               0x9603C                                                               |
  |                  | get_path                    0x94E2B                                                               |
  |                  | texture2                    0x4EBF4                                                               |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | swfcombine-0.9.2 | Forbidden:                                                                                        |
  |                  | __errno_location ctime exit fclose fflush fopen fprintf fputc fread fseek                         |
  |                  | ftell fwrite getenv perror printf putchar puts rename sprintf time                                |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | args_callback_longoption enumerateUsedIDs sub_2b7c swf_WriteTag                                   |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | enumerateUsedIDs main normalcombine write_master                                                  |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | main zlib_error                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | swfextract-0.9.2 | Forbidden:                                                                                        |
  |                  | __errno_location ctime exit fclose feof fflush fopen fprintf fputc fputs fread fseek              |
  |                  | ftell fwrite getenv perror printf putchar puts rename sprintf time                                |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | _trie_dump _trie_put args_callback_longoption callcode cut_last_push dump_asset                   |
  |                  | dump_method enumerateUsedIDs free_lines input registry_find registry_use                          |
  |                  | sub_43254 sub_46594 sub_55177 sub_551a3 sub_6e5a4 sub_72f95 sub_7583a swf4_scan_bytes             |
  |                  | swf4restart swf5_scan_bytes swf5restart swf_ShapeSetLine swf_WriteTag use_asset write_asset       |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | enumerateUsedIDs extractTag main png_load png_write_palette_based2 writeABC                       |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | zlib_error                                                                                        |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  | zlib_error                   0x80F44                                                              |
  |                  | dict_put                     0x7B7FB                                                              |
  |                  | varinfo_register_onclass     0x5C69B                                                              |
  |                  | swf_Shape2ToShape            0x528E1                                                              |
  |                  | swf_ReadABCfile              0x4BA0B                                                              |
  |                  | swf_GetTagID                 0x491B7                                                              |
  |                  | swf_Optimize                 0x48ED8                                                              |
  |                  | swf_FontReduce_swfc          0x437BF                                                              |
  |                  | swf_Relocate                 0x487A8                                                              |
  |                  | png_write_palette_based2     0x7F952                                                              |
  |                  | png_write_palette_based2     0x7F90C                                                              |
  |                  | png_write_palette_based2     0x7F8CC                                                              |
  |                  | png_write_palette_based2     0x7F48A                                                              |
  |                  | png_load                     0x7E373                                                              |
  |                  | png_read_header              0x7C8E9                                                              |
  |                  | code_free                    0x5B4E2                                                              |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  |  calloc   0x79E81    fwrite   0x4B1D1                                                             |
  |                  |  close    0x80D14    fwrite   0x4B1FB                                                             |
  |                  |  fprintf  0x4766F    fwrite   0x4BB57                                                             |
  |                  |  fprintf  0x4924F    fwrite   0x4BFDD                                                             |
  |                  |  fprintf  0x492C0    fwrite   0x5056A                                                             |
  |                  |  fprintf  0x4933C    fwrite   0x507D1                                                             |
  |                  |  fprintf  0x496A3    fwrite   0x7AB98                                                             |
  |                  |  fprintf  0x496E8    fwrite   0x80E69                                                             |
  |                  |  fprintf  0x4BFB7    fwrite   0x810CB                                                             |
  |                  |  fprintf  0x5042D    fwrite   0x810ED                                                             |
  |                  |  fprintf  0x80EBB    fwrite   0x81150                                                             |
  |                  |  fprintf  0x80F3A    fwrite   0x81182                                                             |
  |                  |  fprintf  0x82730    fwrite   0x8122A                                                             |
  |                  |  fprintf  0x82798    memcpy   0x493CF                                                             |
  |                  |  fprintf  0x827E4    memcpy   0x52267                                                             |
  |                  |  fputc    0x49705    memcpy   0x80DA1                                                             |
  |                  |  fwrite   0x43C86    memcpy   0x80E39                                                             |
  |                  |  fwrite   0x453C2    printf   0x7AAF5                                                             |
  |                  |  fwrite   0x4A2F7    strcpy   0x6EE1D                                                             |
  |                  |  fwrite   0x4B1A7                                                                                 |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | tshark-2.6.0     | Forbidden:                                                                                        |
  |                  | __errno_location exit fclose ferror fflush fopen fputc fputs                                      |
  |                  | fwrite getenv putchar puts rename setlocale ungetc                                                |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | copy_filter_list flow_exit iostat_init phs_draw                                                   |
  |                  | sub_101da sub_119b7 sub_11d83 sub_154b0 sub_2086e sub_20e3b sub_20ec9 sub_20edc                   |
  |                  | sub_20eea sub_27930 sub_28f00 sub_29bd0 tree_traverse_pre_order.constprop.0                       |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | iostat_draw main sub_101fd sub_2e750                                                              |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | not found                                                                                         |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  | register_tap_listener  0x2955B                                                                    |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  | close  0x14E43     fwrite 0x18B8E     fwrite 0x191EB   putchar 0x27510   puts 0x28EBC             |
  |                  | close  0x1B96F     fwrite 0x18BA7     fwrite 0x19204   putchar 0x277E8   puts 0x29431             |
  |                  | close  0x1B978     fwrite 0x18BDD     fwrite 0x1921D   putchar 0x277F6   puts 0x29AFB             |
  |                  | close  0x1BA08     fwrite 0x18BF6     fwrite 0x19243   putchar 0x27B02   puts 0x29B07             |
  |                  | close  0x1BA11     fwrite 0x18C0F     fwrite 0x1925C   putchar 0x27B40   puts 0x29B80             |
  |                  | close  0x1BA44     fwrite 0x18C28     fwrite 0x19275   putchar 0x27B4E   puts 0x29CEF             |
  |                  | close  0x1BA4C     fwrite 0x18C41     fwrite 0x1928E   putchar 0x28EF1   puts 0x29CFB             |
  |                  | close  0x1BA6D     fwrite 0x18C5A     fwrite 0x192A7   putchar 0x29419   puts 0x29D07             |
  |                  | close  0x1BA76     fwrite 0x18C73     fwrite 0x192C0   putchar 0x29BB1   puts 0x29E52             |
  |                  | close  0x1BA8C     fwrite 0x18C8C     fwrite 0x192D9   putchar 0x29CE3   puts 0x2A1F5             |
  |                  | close  0x1BA95     fwrite 0x18CA5     fwrite 0x192F2   putchar 0x2A4F9   puts 0x2A427             |
  |                  | close  0x1DB48     fwrite 0x18CBE     fwrite 0x19318   putchar 0x2AE09   puts 0x2A52C             |
  |                  | close  0x1E377     fwrite 0x18CD7     fwrite 0x19331   putchar 0x2B2D9   puts 0x2A54F             |
  |                  | close  0x1E420     fwrite 0x18CF0     fwrite 0x1934A   putchar 0x2B748   puts 0x2A8D9             |
  |                  | close  0x1F1AE     fwrite 0x18D09     fwrite 0x19394   putchar 0x2B89E   puts 0x2AE6C             |
  |                  | dup2   0x1BA64     fwrite 0x18D22     fwrite 0x19424   putchar 0x2B96F   puts 0x2AE8F             |
  |                  | dup2   0x1BA84     fwrite 0x18D3B     fwrite 0x194B1   puts 0x180E7      puts 0x2AEDF             |
  |                  | fclose 0x2D88C     fwrite 0x18D54     fwrite 0x1A53E   puts 0x1EAD7      puts 0x2B2E5             |
  |                  | fclose 0x2DBDB     fwrite 0x18D6D     fwrite 0x1F360   puts 0x1ECEE      puts 0x2B2F1             |
  |                  | fputc  0x12488     fwrite 0x18D86     fwrite 0x1F37D   puts 0x1F636      puts 0x2B8B6             |
  |                  | fputc  0x1882C     fwrite 0x18D9F     fwrite 0x21FF0   puts 0x1FE3E      puts 0x2B987             |
  |                  | fputc  0x18852     fwrite 0x18DB8     fwrite 0x246ED   puts 0x1FE91      puts 0x2B993             |
  |                  | fputc  0x1898D     fwrite 0x18DD1     fwrite 0x24FFD   puts 0x2011B      ungetc 0x2D507           |
  |                  | fputc  0x18AC6     fwrite 0x18DEA     fwrite 0x2556D   puts 0x203E4      unlink 0x14D14           |
  |                  | fputc  0x1922A     fwrite 0x18E03     fwrite 0x2654A   puts 0x204A2      unlink 0x14D34           |
  |                  | fputc  0x192FF     fwrite 0x18E1C     fwrite 0x268B9   puts 0x2058B      unlink 0x14D54           |
  |                  | fputc  0x1A96C     fwrite 0x18E35     fwrite 0x26980   puts 0x209DC      unlink 0x14EC5           |
  |                  | fputc  0xEC0C      fwrite 0x18E4E     fwrite 0x269A7   puts 0x20BA7      unlink 0x1AA24           |
  |                  | fputc  0xF558      fwrite 0x18E67     fwrite 0x290C5   puts 0x20BB3      unlink 0x2D894           |
  |                  | fputs  0xEC2A      fwrite 0x18E80     fwrite 0x292B5   puts 0x20BBF      unlink 0x2D8E7           |
  |                  | fputs  0xEC39      fwrite 0x18E99     fwrite 0x296D5   puts 0x20BCB      unlink 0x2D976           |
  |                  | fputs  0xEC48      fwrite 0x18EB2     fwrite 0x2B3B5   puts 0x20D99                               |
  |                  | fwrite 0x10E0A     fwrite 0x18ECB     fwrite 0x2B3D2   puts 0x217DC                               |
  |                  | fwrite 0x18845     fwrite 0x18EE4     fwrite 0x2B3EF   puts 0x217E8                               |
  |                  | fwrite 0x1886B     fwrite 0x18EFD     fwrite 0x2E732   puts 0x217F4                               |
  |                  | fwrite 0x18884     fwrite 0x18F16     fwrite 0x2F35D   puts 0x22ED7                               |
  |                  | fwrite 0x1889D     fwrite 0x18F2F     fwrite 0xFA60    puts 0x234E9                               |
  |                  | fwrite 0x188B6     fwrite 0x18F48     getgid 0x1C6ED   puts 0x23E2E                               |
  |                  | fwrite 0x188CF     fwrite 0x18F61     getuid 0x1C6E5   puts 0x23E3A                               |
  |                  | fwrite 0x188E8     fwrite 0x18F7A     memcpy 0x2E197   puts 0x23E46                               |
  |                  | fwrite 0x1891C     fwrite 0x18F93     memcpy 0x2F848   puts 0x23EDD                               |
  |                  | fwrite 0x18935     fwrite 0x18FAC     memset 0x21273   puts 0x23F61                               |
  |                  | fwrite 0x1894E     fwrite 0x18FC5     memset 0x287AB   puts 0x23FE9                               |
  |                  | fwrite 0x18967     fwrite 0x18FDE     putchar 0x18088  puts 0x24071                               |
  |                  | fwrite 0x18980     fwrite 0x18FF7     putchar 0x18118  puts 0x240F9                               |
  |                  | fwrite 0x189A6     fwrite 0x19010     putchar 0x181C0  puts 0x24181                               |
  |                  | fwrite 0x189BF     fwrite 0x19029     putchar 0x1FE32  puts 0x24209                               |
  |                  | fwrite 0x189D8     fwrite 0x19042     putchar 0x20470  puts 0x24291                               |
  |                  | fwrite 0x189F1     fwrite 0x1905B     putchar 0x2054E  puts 0x242FF                               |
  |                  | fwrite 0x18A0A     fwrite 0x19074     putchar 0x209D0  puts 0x2430B                               |
  |                  | fwrite 0x18A23     fwrite 0x1908D     putchar 0x20A3E  puts 0x2455B                               |
  |                  | fwrite 0x18A3C     fwrite 0x190A6     putchar 0x20B9B  puts 0x24567                               |
  |                  | fwrite 0x18A55     fwrite 0x190BF     putchar 0x20DEB  puts 0x2487C                               |
  |                  | fwrite 0x18A6E     fwrite 0x190D8     putchar 0x20E28  puts 0x2489F                               |
  |                  | fwrite 0x18A87     fwrite 0x190F1     putchar 0x21031  puts 0x24C28                               |
  |                  | fwrite 0x18AA0     fwrite 0x1910A     putchar 0x217D0  puts 0x24D99                               |
  |                  | fwrite 0x18AB9     fwrite 0x19123     putchar 0x22A91  puts 0x24E1A                               |
  |                  | fwrite 0x18ADF     fwrite 0x1913C     putchar 0x23E22  puts 0x24E26                               |
  |                  | fwrite 0x18AF8     fwrite 0x19155     putchar 0x2458B  puts 0x25198                               |
  |                  | fwrite 0x18B11     fwrite 0x1916E     putchar 0x24849  puts 0x25309                               |
  |                  | fwrite 0x18B2A     fwrite 0x19187     putchar 0x24C10  puts 0x2538A                               |
  |                  | fwrite 0x18B43     fwrite 0x191A0     putchar 0x25180  puts 0x25396                               |
  |                  | fwrite 0x18B5C     fwrite 0x191B9     putchar 0x26F57  puts 0x27520                               |
  |                  | fwrite 0x18B75     fwrite 0x191D2     putchar 0x26F6F  puts 0x2766B                               |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | wav2swf-0.9.2    | Forbidden:                                                                                        |
  |                  | __errno_location ctime exit fclose fflush fopen fprintf fputc fread fseek ftell fwrite            |
  |                  | getenv perror printf putchar puts rename sprintf time                                             |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | args_callback_longoption enumerateUsedIDs input sub_11494 sub_13d39 sub_caa3 sub_db7e             |
  |                  | sub_dbee swf4_scan_bytes swf4restart swf5_scan_bytes swf5restart swf_WriteTag                     |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | enumerateUsedIDs                                                                                  |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | zlib_error                                                                                        |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  |  zlib_error             0x1AFD6                                                                   |
  |                  |  swf_ReadABCfile        0x8963                                                                    |
  |                  |  swf_Optimize           0xB919                                                                    |
  |                  |  swf_Relocate           0xB1E9                                                                    |
  |                  |  swf5_load_buffer_state 0xF081                                                                    |
  |                  |  swf4_load_buffer_state 0xD1BD                                                                    |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  | close    0x1ADA6   fwrite   0x1B15D                                                               |
  |                  | close    0x8FED    fwrite   0x1B17F                                                               |
  |                  | fclose   0x1A1DC   fwrite   0x1B1E2                                                               |
  |                  | fprintf  0x1AF4D   fwrite   0x1B214                                                               |
  |                  | fprintf  0x1AFCC   fwrite   0x1B2BC                                                               |
  |                  | fprintf  0x1C7C2   fwrite   0x6CC1                                                                |
  |                  | fprintf  0x1C82A   fwrite   0x6D0E                                                                |
  |                  | fprintf  0x1C876   fwrite   0x724F                                                                |
  |                  | fprintf  0x6159    fwrite   0x7D25                                                                |
  |                  | fprintf  0x61A7    fwrite   0x7D83                                                                |
  |                  | fprintf  0x6218    fwrite   0x80FF                                                                |
  |                  | fprintf  0x6294    fwrite   0x8129                                                                |
  |                  | fprintf  0x64E5    fwrite   0x8153                                                                |
  |                  | fprintf  0x65FB    fwrite   0x8AAF                                                                |
  |                  | fprintf  0x6640    fwrite   0x8F35                                                                |
  |                  | fprintf  0x8F0F    memcpy   0x1AE33                                                               |
  |                  | fprintf  0x9024    memcpy   0x1AECB                                                               |
  |                  | fprintf  0x986D    memcpy   0x62DE                                                                |
  |                  | fprintf  0xBB55    memcpy   0x6327                                                                |
  |                  | fputc    0x665D    printf   0x1A1C0                                                               |
  |                  | fwrite   0x1A1AC   printf   0x1A21C                                                               |
  |                  | fwrite   0x1A1D4   strcpy   0xD31C                                                                |
  |                  | fwrite   0x1AEFB                                                                                  |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | wpa_cli-2.2      | Forbidden:                                                                                        |
  |                  | __errno_location atoi exit fclose fflush fopen fprintf fread fseek ftell getenv gmtime            |
  |                  | localtime mktime perror printf putchar puts signal system vprintf                                 |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | not found                                                                                         |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | not found                                                                                         |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | not found                                                                                         |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  | wpa_ctrl_request          0x9730                                                                  |
  |                  | dl_list_del               0xCB7F                                                                  |
  |                  | eloop_cancel_timeout      0xD4DC                                                                  |
  |                  | eloop_destroy             0xDF9C                                                                  |
  |                  | eloop_cancel_timeout_one  0xD5DA                                                                  |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  | alarm     0xD910    printf    0x7A71     puts  0x5822    puts      0x8493                         |
  |                  | alarm     0xD9A8    printf    0x7AB6     puts  0x5A17    puts      0x84CB                         |
  |                  | close     0x94B8    printf    0x8463     puts  0x5A34    puts      0x85FA                         |
  |                  | close     0x9527    printf    0x8A9B     puts  0x5AFC    puts      0x8AED                         |
  |                  | close     0x95C5    printf    0x8E85     puts  0x5B96    puts      0x8B07                         |
  |                  | close     0x9609    printf    0x9C66     puts  0x5C28    puts      0x8D89                         |
  |                  | fclose    0xC4C0    printf    0x9DC2     puts  0x5C9A    puts      0x917B                         |
  |                  | fclose    0xC553    printf    0x9DE4     puts  0x5D34    puts      0x924B                         |
  |                  | fclose    0xC7D1    printf    0x9EC3     puts  0x5DC6    puts      0xC523                         |
  |                  | fclose    0xC80C    printf    0x9EEB     puts  0x5E38    random    0xC574                         |
  |                  | fclose    0xC83C    printf    0x9F0C     puts  0x5ED2    setenv    0xC740                         |
  |                  | fclose    0xC87A    printf    0x9F61     puts  0x5F64    sleep     0xC155                         |
  |                  | fclose    0xC899    printf    0x9F8B     puts  0x5FD6    snprintf  0x426B                         |
  |                  | fclose    0xC8DC    printf    0x9FAB     puts  0x6070    snprintf  0x480A                         |
  |                  | fprintf   0x90E3    printf    0xE188     puts  0x6102    snprintf  0x551D                         |
  |                  | fprintf   0x920A    printf    0xE26F     puts  0x6174    snprintf  0x55A7                         |
  |                  | fprintf   0xC4B4    printf    0xE2D9     puts  0x620E    snprintf  0x58F8                         |
  |                  | memcpy    0x78A9    putchar   0x492D     puts  0x62A0    snprintf  0x5982                         |
  |                  | memcpy    0xB93C    putchar   0x7292     puts  0x6312    snprintf  0x75DA                         |
  |                  | memcpy    0xB95C    putchar   0x7A8C     puts  0x63AC    snprintf  0x8760                         |
  |                  | memcpy    0xB9A1    putchar   0x9D26     puts  0x643E    strdup    0xC5BA                         |
  |                  | memcpy    0xB9C6    putchar   0x9DEE     puts  0x64B0    unlink    0x9515                         |
  |                  | memcpy    0xBA2B    putchar   0xA007     puts  0x654A    unlink    0x9619                         |
  |                  | memcpy    0xC6E1    putchar   0xA02A     puts  0x65DC    unlink    0x96AB                         |
  |                  | memset    0x9412    putchar   0xA043     puts  0x663F    unlink    0xC4E6                         |
  |                  | memset    0xB914    puts      0x40D1     puts  0x6822    unsetenv  0xC75A                         |
  |                  | memset    0xC2DD    puts      0x46AD     puts  0x685C                                             |
  |                  | memset    0xCBCC    puts      0x4786     puts  0x68C0                                             |
  |                  | printf    0x4891    puts      0x47C0     puts  0x6924                                             |
  |                  | printf    0x48BC    puts      0x4A99     puts  0x69FF                                             |
  |                  | printf    0x48F6    puts      0x4E90     puts  0x6A51                                             |
  |                  | printf    0x4B14    puts      0x52A5     puts  0x6C05                                             |
  |                  | printf    0x4DE2    puts      0x5397     puts  0x6C3C                                             |
  |                  | printf    0x6D3C    puts      0x5635     puts  0x6C81                                             |
  |                  | printf    0x7235    puts      0x5641     puts  0x6DC7                                             |
  |                  | printf    0x7268    puts      0x5664     puts  0x72AD                                             |
  |                  | printf    0x776A    puts      0x5745     puts  0x81D1                                             |
  |                  | printf    0x7A1A    puts      0x57D0     puts  0x837A                                             |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  |wpa_supplicant-2.2| Forbidden:                                                                                        |
  |                  | __errno_location abort atoi exit fclose fgets fopen fprintf fputc fread fseek ftell               |
  |                  | fwrite gmtime localtime mktime perror printf putchar puts signal vprintf                          |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | eapol_sm_step sub_88c42 wpa_driver_nl80211_scan wpas_set_pkcs11_engine_and_module_path            |
  |                  |                                                                                                   |
  |                  | Complexity (> 50):                                                                                |
  |                  | nl80211_connect_common print_bss_info wpa_config_get_cred_no_key wpa_config_set_cred              |
  |                  | wpa_config_write_global wpa_driver_nl80211_set_ap wpa_sm_rx_eapol                                 |
  |                  | wpa_supplicant_ctrl_iface_process wpa_supplicant_req_sched_scan wpa_supplicant_scan               |
  |                  | wpas_start_assoc_cb                                                                               |
  |                  |                                                                                                   |
  |                  | Non-structured:                                                                                   |
  |                  | not found                                                                                         |
  |                  |                                                                                                   |
  |                  | Null pointer dereference:                                                                         |
  |                  | eloop_cancel_timeout   0x17C6D                                                                    |
  |                  | dl_list_del            0x17310                                                                    |
  |                  | dl_list_add            0x17289                                                                    |
  |                  | wpa_config_get_line    0x18B5C                                                                    |
  |                  | dl_list_add            0x21C36                                                                    |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  |  close   0x94379  fprintf 0x1B039   fputc   0x1AD4B                                               |
  |                  |  fclose  0x1B974  fprintf 0x1B08B   fputc   0x1B48E                                               |
  |                  |  fprintf 0x1A3AF  fprintf 0x1B0BE   fputc   0x1B542                                               |
  |                  |  fprintf 0x1A3DC  fprintf 0x1B0F1   fputc   0x1B63E                                               |
  |                  |  fprintf 0x1A409  fprintf 0x1B122   fwrite  0x1B408                                               |
  |                  |  fprintf 0x1A470  fprintf 0x1B152   fwrite  0x1B4F2                                               |
  |                  |  fprintf 0x1A49D  fprintf 0x1B185   fwrite  0x1B5B8                                               |
  |                  |  fprintf 0x1A4CA  fprintf 0x1B1B5   fwrite  0x1B81D                                               |
  |                  |  fprintf 0x1A4F7  fprintf 0x1B1E5   fwrite  0x1B84D                                               |
  |                  |  fprintf 0x1A524  fprintf 0x1B227   fwrite  0x1B8D9                                               |
  |                  |  fprintf 0x1ACDF  fprintf 0x1B2B4   fwrite  0x1B909                                               |
  |                  |  fprintf 0x1AD23  fprintf 0x1B2E7   memcpy  0x16195                                               |
  |                  |  fprintf 0x1AD8D  fprintf 0x1B317   memcpy  0x217C0                                               |
  |                  |  fprintf 0x1ADBA  fprintf 0x1B347   memcpy  0x68DA6                                               |
  |                  |  fprintf 0x1ADE5  fprintf 0x1B377   memset  0x1672E                                               |
  |                  |  fprintf 0x1AE10  fprintf 0x1B3A7   memset  0x227A1                                               |
  |                  |  fprintf 0x1AE3A  fprintf 0x1B3D7   memset  0x3B5E6                                               |
  |                  |  fprintf 0x1AE65  fprintf 0x1B45B   memset  0x5CF97                                               |
  |                  |  fprintf 0x1AE92  fprintf 0x1B525   memset  0x5D0A7                                               |
  |                  |  fprintf 0x1AEBF  fprintf 0x1B572   memset  0x5D137                                               |
  |                  |  fprintf 0x1AEEC  fprintf 0x1B60B   printf  0x15294                                               |
  |                  |  fprintf 0x1AF19  fprintf 0x1B66E   printf  0x153F0                                               |
  |                  |  fprintf 0x1AF46  fprintf 0x1B69E   printf  0x15412                                               |
  |                  |  fprintf 0x1AF79  fprintf 0x1B6C8   putchar 0x15354                                               |
  |                  |  fprintf 0x1AFA9  fprintf 0x1B6F8   putchar 0x1541C                                               |
  |                  |  fprintf 0x1AFD9  fprintf 0x1B72B                                                                 |
  |                  |  fprintf 0x1B009  fprintf 0x1B72B                                                                 |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |----------------------------------------------------------------------------------------------------------------------|
